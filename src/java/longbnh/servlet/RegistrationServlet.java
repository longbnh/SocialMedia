/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package longbnh.servlet;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import javax.mail.MessagingException;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import longbnh.utility.EncryptHelper;
import longbnh.users.UsersCreateErrors;
import longbnh.users.UsersDAO;
import longbnh.utility.SendMailHelper;
import longbnh.utility.VerifyCodeHelper;
import org.apache.log4j.Logger;

/**
 *
 * @author DELL
 */
@WebServlet(name = "RegistrationServlet", urlPatterns = {"/RegistrationServlet"})
public class RegistrationServlet extends HttpServlet {
    
    private final String ERROR_PAGE = "Registration.jsp";
    private final String VERIFY_PAGE = "verify.jsp";
    private final Logger LOG = Logger.getLogger(RegistrationServlet.class);

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
        String email = request.getParameter("txtID");
        String password = request.getParameter("txtPassword");
        String confirmPassword = request.getParameter("txtConfirmPassword");
        String name = request.getParameter("txtName");
        
        UsersCreateErrors error = new UsersCreateErrors();
        boolean foundError = false;
        String url = ERROR_PAGE;
        try {
            if (!email.trim().matches("^[a-zA-Z0-9_.]+@[a-zA-Z.]+?\\.[a-zA-Z]{2,3}$") || email.trim().length() > 30) {
                foundError = true;
                error.setEmailInvalid("Email is invalid");
            }
            if (password.trim().length() < 7 || password.trim().length() > 20) {
                foundError = true;
                error.setPasswordInvalid("Password is required typing from 7 to 20 characters");
            } else if (!confirmPassword.trim().equals(password.trim())) {
                foundError = true;
                error.setConfirmNotMatch("Confirm not match your password");
            }
            if (name.trim().length() < 2 || name.trim().length() > 50) {
                foundError = true;
                error.setInvalidName("Name is required from 2 to 50 characters");
            }
            if (foundError) {
                request.setAttribute("ERROR_REGISTER", error);
            } else {
                String encryptPassword = EncryptHelper.encryptPassword(password);
                UsersDAO dao = new UsersDAO();
                int status = 1;
                boolean result = dao.createAccount(email, name, encryptPassword, status);
                if (result) {
                    VerifyCodeHelper helper = new VerifyCodeHelper();
                    SendMailHelper sendMail = new SendMailHelper();
                    String verifyCode = helper.generateCode();
                    sendMail.sendMail(verifyCode, email);
                    HttpSession session = request.getSession();
                    session.setAttribute("VERIFY_CODE", verifyCode);
                    session.setAttribute("NEW_ACCOUNT", email);
                    url = VERIFY_PAGE;
                }
            }
        } catch (NamingException ex) {
            LOG.error("NamingException : " + ex.getMessage());
        } catch (SQLException ex) {
            LOG.error("SQLException : " + ex.getMessage());
            String msg = ex.getMessage();
            if (msg.contains("duplicate")) {
                error.setEmailIsExisted(email + " is existed");
                request.setAttribute("ERROR_REGISTER", error);
            }
        } catch (NoSuchAlgorithmException ex) {
            LOG.error("NoSuchAlgorithmException : " + ex.getMessage());
        } catch (MessagingException ex) {
            LOG.error("MessagingException : " + ex.getMessage());
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
