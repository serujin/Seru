/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import constants.Constants;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import manager.UserManager;

/**
 *
 * @author Seruji
 */
@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String username = req.getParameter(Constants.FORM_USERNAME_NAME);
            String password = req.getParameter(Constants.FORM_PASSWORD_NAME);
            if(UserManager.getInstance().login(username, password)) {
                resp.sendRedirect(Constants.USER_PROJECTS_JSP_PATH);
            } else {
                req.setAttribute(Constants.INCORRECT_LOGIN_ATTRIBUTE, Constants.INCORRECT_LOGIN_ATTRIBUTE);
                req.getRequestDispatcher(Constants.LOGIN_JSP_PATH).forward(req, resp);
            }
        } catch (NoSuchAlgorithmException ex) {
            System.out.println(ex.getMessage());
        }
    }
}
