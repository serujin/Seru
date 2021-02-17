<%-- 
    Document   : project
    Created on : 16-feb-2021, 15:44:17
    Author     : Seruji
--%>
<%@page import="java.util.HashSet"%>
<%@page import="manager.ProjectManager"%>
<%@page import="model.Task"%>
<%@page import="manager.TranslationManager"%>
<%@page import="constants.Constants"%>
<%@page import="java.util.Set"%>
<%@page import="model.Project"%>
<%@page import="manager.UserManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String taskNamePlaceholder = TranslationManager.getInstance().getLanguage()[Constants.TASK_NAME_PH];
            String taskDescPlaceholder = TranslationManager.getInstance().getLanguage()[Constants.TASK_DESC_PH];
            String showCreateTaskButtonValue = TranslationManager.getInstance().getLanguage()[Constants.CREATE_TASK_BTN];
            String createProjectButtonValue = TranslationManager.getInstance().getLanguage()[Constants.CREATE_PROJECT_POPUP_BTN];
        %>
        <button id="show_pop-up"><%=showCreateTaskButtonValue%></button>
        <div id="pop-up">
            <div class="pop-up_content">
                <span class="close">&times;</span>
                <form action="${pageContext.request.contextPath}/UserProjects" method="post">
                    <input type="text" name=<%=Constants.FORM_TASK_NAME%> placeholder="<%=taskNamePlaceholder%>" required>
                    <input type="text" name=<%=Constants.FORM_TASK_DESC%> placeholder="<%=taskDescPlaceholder%>" required>
                    <input type="submit" value="<%=createProjectButtonValue%>">
                </form>
            </div>
        </div>
        <%
            Set<Task> tasks = ProjectManager.getInstance().getCurrentProject().getTasks();
            Set<Task> nonStarted = new HashSet<>();
            Set<Task> started = new HashSet<>();
            Set<Task> completed = new HashSet<>();
            for (Task t : tasks) {
                if (t.getState() == Constants.TASK_CREATED_STATE) {
                    nonStarted.add(t);
                }
                if (t.getState() == Constants.TASK_STARTED_STATE) {
                    started.add(t);
                }
                if (t.getState() == Constants.TASK_COMPLETED_STATE) {
                    completed.add(t);
                }
            }
        %>
        <div class="created_tasks_div">
        <%
            for(Task t : nonStarted) {%>
            <div>
                <h5><%=t.getName()%></h5>
            </div>
            <%}
        %>
        </div>
        <div class="started_tasks_div">
        <%
            for(Task t : started) {%>
            <div>
                <h5><%=t.getName()%></h5>
            </div>
            <%}
        %>
        </div>
        <div class="completed_tasks_div">
        <%
            for(Task t : completed) {%>
            <div>
                <h5><%=t.getName()%></h5>
            </div>
            <%}
        %>
        </div>
        <script src="js/pop_up.js"></script>
    </body>
</html>
