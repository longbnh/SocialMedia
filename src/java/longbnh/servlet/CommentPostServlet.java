/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package longbnh.servlet;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import longbnh.article.ArticleDAO;
import longbnh.comment.CommentDAO;
import longbnh.notify.NotifyDAO;
import org.apache.log4j.Logger;

/**
 *
 * @author DELL
 */
@WebServlet(name = "CommentPostServlet", urlPatterns = {"/CommentPostServlet"})
public class CommentPostServlet extends HttpServlet {

    private final String LOGIN_PAGE = "Login.jsp";
    private final Logger LOG = Logger.getLogger(CommentPostServlet.class);
    private final String SEARCH_PAGE = "SearchPage.jsp";

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
        String url = "";
        try {
            HttpSession session = request.getSession(false);
            String email = (String) session.getAttribute("EMAIL");
            if (email == null) {
                url = LOGIN_PAGE;
            } else {
                int postID = Integer.parseInt(request.getParameter("txtPostID"));
                LocalDate local = LocalDate.now();
                Date dayPost = Date.valueOf(local);
                String content = request.getParameter("txtComment");
                ArticleDAO articleDAO = new ArticleDAO();
                boolean checkStatus = articleDAO.checkStatusPost(postID);
                if (content.trim().length() > 0 && checkStatus && content.trim().length() < 2000) {
                    CommentDAO commentDAO = new CommentDAO();
                    commentDAO.commentToPost(postID, email, dayPost, content, 2);
                    boolean result = commentDAO.takeLastCommentID(postID, email, content, 2);
                    if (result) {
                        int commentID = commentDAO.getCommentID();
                        NotifyDAO notifyDAO = new NotifyDAO();
                        notifyDAO.addNotifyComment(postID, email, dayPost, 1, commentID);
                    }
                }
                url = "ServletDispatcher?btnAction=View Post&txtPostID=" + postID;
                if (!checkStatus) {
                    url = SEARCH_PAGE;
                }
            }
        } catch (NamingException ex) {
            LOG.error("NamingException : " + ex.getMessage());
        } catch (SQLException ex) {
            LOG.error("SQLException : " + ex.getMessage());
        } catch (NumberFormatException ex) {
            LOG.error("NumberFormatException + " + ex.getMessage());
        } finally {
            response.sendRedirect(url);
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
