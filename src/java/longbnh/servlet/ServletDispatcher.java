/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package longbnh.servlet;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author DELL
 */
public class ServletDispatcher extends HttpServlet {

    private final String LOGIN_PAGE = "Login.jsp";
    private final String LOGIN_CONTROLLER = "LoginServlet";
    private final String REGISTRATION_CONTROLLER = "RegistrationServlet";
    private final String LOGOUT_CONTROLLER = "LogoutServlet";
    private final String SEARCH_CONTROLLER = "SearchPostServlet";
    private final String POST_CONTROLLER = "PostArticleServlet";
    private final String POST_PAGE = "PostArticlePage.jsp";
    private final String VIEW_POST_CONTROLLER = "ViewPostServlet";
    private final String DELETE_POST_CONTROLLER = "DeletePostServlet";
    private final String COMMENT_POST_CONTROLLER = "CommentPostServlet";
    private final String DELETE_COMMENT_CONTROLLER = "DeleteCommentServlet";
    private final String EMOTION_CONTROLLER = "EmotionServlet";
    private final String NOTIFY_COTROLLER = "NotifyServlet";
    private final String VERIFY_CONTROLLER = "VerifyEmailServlet";
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
        String url = LOGIN_PAGE;
        try {
            String button = request.getParameter("btnAction");
            if (button == null) {
            } else if (button.equals("Login")) {
                url = LOGIN_CONTROLLER;
            } else if (button.equals("Create an account")) {
                url = REGISTRATION_CONTROLLER;
            }else if (button.equals("Logout")){
                url = LOGOUT_CONTROLLER;
            }else if(button.equals("Search")){
                url = SEARCH_CONTROLLER;
            }else if(button.equals("Post")){
                url = POST_CONTROLLER;
            }else if(button.equals("PostPage")){
                url = POST_PAGE;
            }else if(button.equals("View Post")){
                url = VIEW_POST_CONTROLLER;
            }else if(button.equals("Delete Your Post")){
                url = DELETE_POST_CONTROLLER;
            }else if(button.equals("Comment")){
                url = COMMENT_POST_CONTROLLER;
            }else if(button.equals("Delete Your Comment")){
                url = DELETE_COMMENT_CONTROLLER;
            }else if(button.equals("btnLike") || button.equals("btnDislike")){
                url = EMOTION_CONTROLLER;
            }else if(button.equals("Notify")){
                url = NOTIFY_COTROLLER;
            }else if(button.equals("Verify")){
                url = VERIFY_CONTROLLER;
            }
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
