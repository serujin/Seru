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
        resp.setContentType("text/html;charset=UTF-8");
        String projectName = req.getParameter(Constants.FORM_PROJECT_NAME);
        String projectDesc = req.getParameter(Constants.FORM_PROJECT_DESC);
        ProjectManager.getInstance().createProject(projectName, projectDesc);
        resp.sendRedirect("user_projects.jsp");
    }
}
