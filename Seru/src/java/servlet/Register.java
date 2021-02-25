package servlet;

import constants.Constants;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import manager.TranslationManager;
import manager.UserManager;

/**
 *
 * @author Seruji
 */
@WebServlet(name = "Register", urlPatterns = {"/Register"})
public class Register extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter(Constants.FORM_USERNAME_NAME);
        String password = req.getParameter(Constants.FORM_PASSWORD_NAME);
        String confirmPassword = req.getParameter(Constants.FORM_CONFIRM_PASSWORD_NAME);
        if(password.equals(confirmPassword)) {
            try {
                if(UserManager.getInstance().register(username, password)) {
                    resp.sendRedirect(Constants.LOGIN_JSP_PATH); 
                } else {
                    req.setAttribute(Constants.INCORRECT_REGISTER_ATTRIBUTE, Constants.INCORRECT_REGISTER_ATTRIBUTE);
                    req.getRequestDispatcher(Constants.REGISTER_JSP_PATH).forward(req, resp);
                }
            } catch (NoSuchAlgorithmException ex) {
                System.out.println(ex.getMessage());
            }
        } else {
            req.setAttribute(Constants.INCORRECT_REGISTER_ATTRIBUTE, Constants.INCORRECT_PASSWORD_ATTRIBUTE);
            req.getRequestDispatcher(Constants.REGISTER_JSP_PATH).forward(req, resp);
        }
    }
    
}
