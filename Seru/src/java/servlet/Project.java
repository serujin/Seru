package servlet;

import constants.Constants;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import manager.ProjectManager;
import manager.TaskManager;
import manager.TranslationManager;

/**
 *
 * @author Seruji
 */
@WebServlet(name = "Project", urlPatterns = {"/Project"})
public class Project extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter(Constants.FORM_PROJECT_ID));
        String type = req.getParameter(Constants.FORM_SUBMIT_CHANGE);
        ProjectManager.getInstance().loadProject(id);
        if(type != null) {
            resp.sendRedirect(Constants.PROJECT_JSP_PATH);
        } else {
            System.out.println(TranslationManager.getInstance().getTranslatedString(
                    Constants.SUCCESSFULLY_DELETE_PROJECT) + 
                    ProjectManager.getInstance().getCurrentProject().getName()
            );
            ProjectManager.getInstance().deleteProject();
            resp.sendRedirect(Constants.USER_PROJECTS_JSP_PATH);
        }

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String taskName = req.getParameter(Constants.FORM_TASK_NAME);
        String taskDesc = req.getParameter(Constants.FORM_TASK_DESC);
        TaskManager.getInstance().createTask(taskName, taskDesc);
        resp.sendRedirect(Constants.PROJECT_JSP_PATH);
    }
    
}
