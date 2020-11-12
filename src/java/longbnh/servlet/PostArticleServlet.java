/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package longbnh.servlet;

import longbnh.article.ArticleDAO;
import longbnh.article.PostArticleError;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;

/**
 *
 * @author DELL
 */
@WebServlet(name = "PostArticleServlet", urlPatterns = {"/PostArticleServlet"})
public class PostArticleServlet extends HttpServlet {
    
    private final String POST_PAGE = "PostArticlePage.jsp";
    private final String LOGIN_PAGE = "Login.jsp";
    private final String HOME_PAGE = "Homepage.jsp";
    private final Logger LOG = Logger.getLogger(PostArticleServlet.class);

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
        
        String title = request.getParameter("txtTitle");
        String image = request.getParameter("locationImage");
        String description = request.getParameter("txtDescription");
        String content = request.getParameter("txtContent");
        PostArticleError error = new PostArticleError();
        boolean foundError = false;
        String url = POST_PAGE;
        try {
            HttpSession session = request.getSession(false);
            String email = (String) session.getAttribute("EMAIL");
            if (email == null) {
                foundError = true;
                url = LOGIN_PAGE;
            }
            
            if (title.trim().length() <= 0 || title.trim().length() > 100) {
                error.setEmptyTitle("The title must be required from 1 to 100 characters ");
                foundError = true;
            }
            if (description.trim().length() <= 0) {
                error.setEmptyDescription("The description must be required from 1 to 100 characters");
                foundError = true;
            }
            if (content.trim().length() <= 0 || content.trim().length() > 2000) {
                error.setEmptyContent("Content must be required from 1 to 2000 characters");
                foundError = true;
            }
            if (!foundError) {
                int status = 2;
                LocalDate date = LocalDate.now();
                Date dayPost = Date.valueOf(date);
                
                ArticleDAO dao = new ArticleDAO();
                dao.createArticle(image, title, description, content, dayPost, email, status);
                url = HOME_PAGE;
            } else {
                request.setAttribute("POST_ERROR", error);
            }
        } catch (NamingException ex) {
            LOG.error("NamingException : " + ex.getMessage());
        } catch (SQLException ex) {
            LOG.error("SQLException : " + ex.getMessage());
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
