package servlet;

import constants.Constants;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import manager.TaskManager;
import manager.TranslationManager;

/**
 *
 * @author sergi
 */
@WebServlet(name = "Task", urlPatterns = {"/Task"})
public class Task extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        int taskID = Integer.parseInt(req.getParameter(Constants.FORM_TASK_ID));
        int state = Integer.parseInt(req.getParameter(Constants.FORM_TASK_STATE));
        String type = req.getParameter(Constants.FORM_SUBMIT_CHANGE);
        TaskManager.getInstance().setCurrentTask(taskID);
        if(type != null) {
            TaskManager.getInstance().changeTaskState(state);
        } else {
            System.out.println(TranslationManager.getInstance().getTranslatedString(
                    Constants.SUCCESSFULLY_DELETE_TASK) + 
                    TaskManager.getInstance().getCurrentTask().getName()
            );
            TaskManager.getInstance().deleteTask();
        }
        resp.sendRedirect(Constants.PROJECT_JSP_PATH);
    }
}
