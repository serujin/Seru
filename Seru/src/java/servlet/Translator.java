/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import constants.Constants;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import manager.TranslationManager;

/**
 *
 * @author sergi
 */
@WebServlet(name = "Translator", urlPatterns = {"/Translator"})
public class Translator extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String requestedFrom = req.getParameter(Constants.FORM_CURRENT_PAGE_VALUE);
        changeLanguage(req);
        resp.sendRedirect(requestedFrom);
    }
    
    private void changeLanguage(HttpServletRequest req) {
        for(int i = 0; i < TranslationManager.getInstance().getAvaliableLanguages().length; i++) {
            String parameter = req.getParameter(String.valueOf(i));
            if(parameter != null) {
                TranslationManager.getInstance().changeLanguage(i);
                return;
            }
        }
    }
    
}
