package servlet;

import constants.Constants;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import manager.ProjectManager;

/**
 *
 * @author Seruji
 */
@WebServlet(name = "UserProjects", urlPatterns = {"/UserProjects"})
public class UserProjects extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String projectName = req.getParameter(Constants.FORM_PROJECT_NAME);
        String projectDesc = req.getParameter(Constants.FORM_PROJECT_DESC);
        ProjectManager.getInstance().createProject(projectName, projectDesc);
        resp.sendRedirect(Constants.USER_PROJECTS_JSP_PATH);
    }
}
