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
import longbnh.emotion.EmotionDAO;
import longbnh.notify.NotifyDAO;
import org.apache.log4j.Logger;

/**
 *
 * @author DELL
 */
@WebServlet(name = "EmotionServlet", urlPatterns = {"/EmotionServlet"})
public class EmotionServlet extends HttpServlet {

    private final String LOGINPAGE = "Login.jsp";
    private final String SEARCHPAGE = "SearchPage.jsp";
    private final Logger LOG = Logger.getLogger(EmotionServlet.class);

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
            int postID = Integer.parseInt((String) request.getParameter("txtPostID"));
            String email = (String) session.getAttribute("EMAIL");

            LocalDate local = LocalDate.now();
            Date currentDate = Date.valueOf(local);
            String reaction = request.getParameter("reaction");
            ArticleDAO articleDAO = new ArticleDAO();
            boolean checkStatus = articleDAO.checkStatusPost(postID);
            EmotionDAO emotionDAO = new EmotionDAO();

            int typeNotify = -1;
            int lastReaction = emotionDAO.checkUserExistEmotion(postID, email);
            int react = 3;
            if (email == null) {
                url = LOGINPAGE;
            } else if (checkStatus && email != null) {
                if (lastReaction == -1) {
                    if (reaction.equals("like")) {
                        react = 1;
                        typeNotify = 2;
                    } else {
                        react = 2;
                        typeNotify = 3;
                    }
                    emotionDAO.addNewEmotion(postID, email, currentDate, react);
                } else {
                    if (lastReaction == 3) { //no emotion
                        if (reaction.equals("like")) {
                            react = 1;
                            typeNotify = 2;
                        } else {
                            react = 2;
                            typeNotify = 3;
                        }
                    } else if (lastReaction == 2) { //dislike
                        if (reaction.equals("like")) {
                            react = 1;
                            typeNotify = 2;
                        } else {
                            react = 3;
                            typeNotify = 5;
                        }
                    } else if (lastReaction == 1) { //like
                        if (reaction.equals("like")) {
                            react = 3;
                            typeNotify = 4;
                        } else {
                            react = 2;
                            typeNotify = 3;
                        }
                    }
                    emotionDAO.updateEmotion(postID, email, currentDate, react);
                }
                boolean result = emotionDAO.getLastEmotion(postID, email, currentDate, react);
                if (result && typeNotify != -1) {
                    int emotionID = emotionDAO.getEmotionID();
                    NotifyDAO notifyDAO = new NotifyDAO();
                    notifyDAO.addNotifyEmotion(postID, email, currentDate, typeNotify, emotionID);
                }
                url = "ServletDispatcher?btnAction=View Post&txtPostID=" + postID;
            }
        } catch (NamingException ex) {
            LOG.error("NamingException : " + ex.getMessage());
        } catch (SQLException ex) {
            LOG.error("SQLException : " + ex.getMessage());
        } catch (NumberFormatException ex) {
            LOG.error("NumberFormatException : " + ex.getMessage());
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
