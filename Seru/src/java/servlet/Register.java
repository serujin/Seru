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
                UserManager.getInstance().register(username, password);
            } catch (NoSuchAlgorithmException ex) {
                System.out.println(ex.getMessage());
            }
        } else {
            System.out.println(TranslationManager.getInstance().getLanguage()[Constants.NOT_EQUAL_PASSWORD_ALERT]);
        }
    }
    
}
