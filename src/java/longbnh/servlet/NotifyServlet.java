/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package longbnh.servlet;

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
import longbnh.notify.NotifyDAO;
import longbnh.notify.NotifyDTO;
import org.apache.log4j.Logger;

/**
 *
 * @author DELL
 */
@WebServlet(name = "NotifyServlet", urlPatterns = {"/NotifyServlet"})
public class NotifyServlet extends HttpServlet {

    private final String LOGINPAGE = "Login.jsp";
    private final String HOMEPAGE = "Homepage.jsp";
    private final Logger LOG = Logger.getLogger(NotifyServlet.class);

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
        String url = HOMEPAGE;
        try {
            HttpSession session = request.getSession(false);
            String emailLogin = (String) session.getAttribute("EMAIL");
            String current = request.getParameter("currentPage");
            int currentPage;
            if (current == null) {
                currentPage = 1;
            } else {
                currentPage = Integer.parseInt(current);
            }
            if (emailLogin == null) {
                url = LOGINPAGE;
            } else {
                NotifyDAO dao = new NotifyDAO();
                dao.caculateNotifyPage(emailLogin);
                int totalPage = dao.getTotalPage();
                if (currentPage <= 0) {
                    currentPage = 1;
                } else if (currentPage > totalPage) {
                    currentPage = totalPage;
                }

                request.setAttribute("TOTALPAGE", totalPage);

                dao.showAllNotify(emailLogin, currentPage - 1);
                List<NotifyDTO> listNotify = dao.getList();

                request.setAttribute("NOTIFY", listNotify);
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
