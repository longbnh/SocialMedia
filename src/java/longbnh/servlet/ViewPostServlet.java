/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package longbnh.servlet;

import longbnh.article.ArticleDAO;
import longbnh.article.ArticleDTO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import longbnh.comment.CommentDAO;
import longbnh.comment.CommentDTO;
import longbnh.emotion.EmotionDAO;
import org.apache.log4j.Logger;

/**
 *
 * @author DELL
 */
@WebServlet(name = "ViewPostServlet", urlPatterns = {"/ViewPostServlet"})
public class ViewPostServlet extends HttpServlet {
    
    private final String SEARCHPAGE = "SearchPage.jsp";
    private final String VIEWPAGE = "ViewPost.jsp";
    private final String LOGINPAGE = "Login.jsp";
    private final Logger LOG = Logger.getLogger(ViewPostServlet.class);

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = SEARCHPAGE;
        try {
            HttpSession session = request.getSession(false);
            String email = (String) session.getAttribute("EMAIL");
            if (email == null) {
                url = LOGINPAGE;
            } else {
                String ID = request.getParameter("txtPostID");
                int postID = Integer.parseInt(ID);
                request.setAttribute("POSTID", postID);
                
                ArticleDAO articleDAO = new ArticleDAO();
                articleDAO.searchPostByID(postID);
                
                ArticleDTO articleDTO = articleDAO.getArticle();                
                request.setAttribute("POST", articleDTO);
                                
                EmotionDAO emotionDAO = new EmotionDAO();
                emotionDAO.countNumberLikeDislike(postID);                
                int totalLike = emotionDAO.getIsLike();
                int totalDisLike = emotionDAO.getIsDislike();
                request.setAttribute("LIKE", totalLike);
                request.setAttribute("DISLIKE", totalDisLike);
                
                CommentDAO commentDAO = new CommentDAO();
                commentDAO.showAllCommentInPost(postID);                
                List<CommentDTO> listComment = commentDAO.getListComment();
                request.setAttribute("COMMENT", listComment);
                
                url = VIEWPAGE;
            }
        } catch (NamingException ex) {
            LOG.error("NamingException : " + ex.getMessage());
        } catch (SQLException ex) {
            LOG.error("SQLException : " + ex.getMessage());
        } catch (NumberFormatException ex) {
            url = SEARCHPAGE;
            LOG.error("NumberFormatException : " + ex.getMessage());
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
