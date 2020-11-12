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
import org.apache.log4j.Logger;

/**
 *
 * @author DELL
 */
@WebServlet(name = "SearchPostServlet", urlPatterns = {"/SearchPostServlet"})
public class SearchPostServlet extends HttpServlet {

    private final String LOGIN_PAGE = "Login.jsp";
    private final String SEARCH_PAGE = "SearchPage.jsp";
    private final Logger LOG = Logger.getLogger(SearchPostServlet.class);

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
        HttpSession session = request.getSession(false);
        String url = SEARCH_PAGE;
        try {
            String searchContent = request.getParameter("txtSearch");
            String email = (String) session.getAttribute("NAME");
            String current = request.getParameter("currentPage");
            int currentPage;
            if (current == null) {
                currentPage = 1;
            } else {
                currentPage = Integer.parseInt(current);
            }
            if (email == null) {
                url = LOGIN_PAGE;
            }
            if (searchContent.trim().length() > 0) {
                ArticleDAO dao = new ArticleDAO();
                dao.caculatePage(searchContent);

                int totalPage = dao.getPageCount();
                if (currentPage <= 0) {
                    currentPage = 1;
                } else if (currentPage > totalPage) {
                    currentPage = totalPage;
                }

                dao.searchArticleByContent(searchContent, currentPage - 1);
                List<ArticleDTO> result = dao.getListDTO();
                request.setAttribute("ARTICLE", result);

                request.setAttribute("TOTAL_PAGE", totalPage);
            }

        } catch (NamingException ex) {
            LOG.error("NamingException : " + ex.getMessage());
        } catch (SQLException ex) {
            LOG.error("SQLException : " + ex.getMessage());
        } catch (NumberFormatException ex) {
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
