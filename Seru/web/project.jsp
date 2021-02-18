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
        <link rel="stylesheet" href="css/project.css">
        <link rel="stylesheet" href="css/pop_up.css">
    </head>
    <body>
        <%
            String taskNamePlaceholder = TranslationManager.getInstance().getLanguage()[Constants.TASK_NAME_PH];
            String taskDescPlaceholder = TranslationManager.getInstance().getLanguage()[Constants.TASK_DESC_PH];
            String showCreateTaskButtonValue = TranslationManager.getInstance().getLanguage()[Constants.CREATE_TASK_BTN_VALUE];
            String createTaskButtonValue = TranslationManager.getInstance().getLanguage()[Constants.CREATE_BTN_VALUE];
        %>
        <button id="show_pop-up"><%=showCreateTaskButtonValue%></button>
        <div id="pop-up">
            <div class="pop-up_content">
                <span class="close">&times;</span>
                <form action="${pageContext.request.contextPath}/Project" method="get">
                    <input type="text" name=<%=Constants.FORM_TASK_NAME%> placeholder="<%=taskNamePlaceholder%>" required>
                    <input type="text" name=<%=Constants.FORM_TASK_DESC%> placeholder="<%=taskDescPlaceholder%>" required>
                    <input type="submit" value="<%=createTaskButtonValue%>">
                </form>
            </div>
        </div>
        <%
            Set<Task> tasks = ProjectManager.getInstance().getCurrentProject().getTasks();
            Set<Task> nonStarted = new HashSet<Task>();
            Set<Task> started = new HashSet<Task>();
            Set<Task> completed = new HashSet<Task>();
            for (Task t : tasks) {
                System.out.println(t.getState());
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
        <main>
            <div ondrop="drop(event)" ondragover="allowDrop(event)" class="created_tasks_div">
                <%
                    for (Task t : nonStarted) {%>
                    <h5 id="<%=t.getId()%>" draggable="true" ondragstart="drag(event)"><%=t.getName()%></h5>
                <%}
                %>
            </div>
            <div ondrop="drop(event)" ondragover="allowDrop(event)" class="started_tasks_div">
                <%
                    for (Task t : started) {%>
    
                    <h5 id="<%=t.getId()%>" draggable="true" ondragstart="drag(event)"><%=t.getName()%></h5>

                <%}
                %>
            </div>
            <div ondrop="drop(event)" ondragover="allowDrop(event)" class="completed_tasks_div">
                <%
                    for (Task t : completed) {%>

                    <h5 id="<%=t.getId()%>" draggable="true" ondragstart="drag(event)"><%=t.getName()%></h5>

                <%}
                %>
            </div>
        </main>
        <script src="js/pop_up.js"></script>
        <script>
                    function allowDrop(ev) {
                        ev.preventDefault();
                    }
                    function drag(ev) {
                        ev.dataTransfer.setData("text", ev.target.id);
                    }
                    function drop(ev) {
                        ev.preventDefault();
                        var data = ev.dataTransfer.getData("text");
                        ev.target.appendChild(document.getElementById(data));
                    }
        </script>
    </body>
</html>
