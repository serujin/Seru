<%-- 
    Document   : project
    Created on : 16-feb-2021, 15:44:17
    Author     : Seruji
--%>
<%@page import="manager.TaskManager"%>
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
        <link rel="stylesheet" href="css/general1.css.css">
    </head>
    <body>
        <%
            String taskNamePlaceholder = TranslationManager.getInstance().getTranslatedString(Constants.TASK_NAME_PH);
            String taskDescPlaceholder = TranslationManager.getInstance().getTranslatedString(Constants.TASK_DESC_PH);
            String showCreateTaskButtonValue = TranslationManager.getInstance().getTranslatedString(Constants.CREATE_TASK_BTN_VALUE);
            String createTaskButtonValue = TranslationManager.getInstance().getTranslatedString(Constants.CREATE_BTN_VALUE);
            String deleteTaskButtonValue = TranslationManager.getInstance().getTranslatedString(Constants.DELETE_BTN_VALUE);
            String currentLanguage = TranslationManager.getInstance().getTranslatedString(Constants.LANGUAGE_VALUE);
            String logOutButtonValue = TranslationManager.getInstance().getTranslatedString(Constants.LOG_OUT_BTN_VALUE);
        %>
        <header class="row_container col-12 row-1-vh center_h space_content color-2">
            <img class="col-1" src="images/Seru_Logo.png">
            <div class="col-2 row-1-vh">
                <div class="dropdown col-6 row-12" class="col_container center_wh color-2">
                    <button class="dropbtn col-12 row-12 color-2 header_font"><%=currentLanguage%></button>
                    <form class="dropdown-content col-12" action="${pageContext.request.contextPath}/Translator" method="post">
                        <input type="text" name=<%=Constants.FORM_CURRENT_PAGE_VALUE%> value="<%=Constants.LOGIN_JSP_PATH%>" style="display:none">
                        <%
                            String[] languages = TranslationManager.getInstance().getAvaliableLanguages();

                            String language = "";
                            for (int i = 0; i < languages.length; i++) {
                                language = languages[i];
                        %> 
                        <input class="col-12 color-3" type="submit" name=<%=i%> value="<%=language%>">
                        <%}
                        %>
                    </form>
                </div>
                <form class="col-6 row-12" action="${pageContext.request.contextPath}/LogOut" method="post">
                    <input class="col-12 row-12 color-2 header_font" type="submit" value="<%=logOutButtonValue%>">
                </form>
            </div>
        </header>
        <button id="show_pop-up"><%=showCreateTaskButtonValue%></button>
        <div id="pop-up" class="col-12 row-12">
            <div class="pop-up_content col-10">
                <span class="close">&times;</span>
                <form action="${pageContext.request.contextPath}/Project" method="get">
                    <input type="text" name=<%=Constants.FORM_TASK_NAME%> placeholder="<%=taskNamePlaceholder%>" required>
                    <input type="text" name=<%=Constants.FORM_TASK_DESC%> placeholder="<%=taskDescPlaceholder%>" required>
                    <input type="submit" value="<%=createTaskButtonValue%>">
                </form>
            </div>
        </div>
        <div id="task_pop-up">
            <div class="task_pop-up_content">
                <span class="task_close">&times;</span>
                <form action="${pageContext.request.contextPath}/Task" method="post">
                    <input id="task_pop-up_id" type="text" name=<%=Constants.FORM_TASK_ID%> style="display:none;">
                    <input id="task_pop-up_name" type="text" name=<%=Constants.FORM_TASK_NAME%> readonly>
                    <input id="task_pop-up_desc" type="text" name=<%=Constants.FORM_TASK_DESC%> readonly>
                    <input id="task_pop-up_state" type="text" name=<%=Constants.FORM_TASK_STATE%> style="display:none;">
                    <input id="task_pop-up_submit" type="submit" name=<%=Constants.FORM_SUBMIT_CHANGE%>>
                    <input type="submit" name=<%=Constants.FORM_SUBMIT_DELETE%> value="<%=deleteTaskButtonValue%>">
                </form>
            </div>
        </div>
        <%
            Set<Task> tasks = ProjectManager.getInstance().getCurrentProject().getTasks();
            Set<Task> nonStarted = new HashSet<Task>();
            Set<Task> started = new HashSet<Task>();
            Set<Task> completed = new HashSet<Task>();
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
        <main>
            <div class="created_tasks_div">
                <%
                    int id = 0;
                    String name = "";
                    String desc = "";
                    int state = Constants.TASK_CREATED_STATE;
                    String btnText = TranslationManager.getInstance().getTranslatedString(Constants.STARTED_TASK_BTN_VALUE);
                    for (Task t : nonStarted) {
                        id = t.getId();
                        name = t.getName();
                        desc = t.getDesc();
                %>

                <button onclick="openPopUp('<%=id%>', '<%=name%>', '<%=desc%>', '<%=state%>', '<%=btnText%>')">
                    <%=t.getName()%>
                </button>
                <%}
                %>
            </div>
            <div class="started_tasks_div">
                <%
                    state = Constants.TASK_STARTED_STATE;
                    btnText = TranslationManager.getInstance().getTranslatedString(Constants.COMPLETED_TASK_BTN_VALUE);
                    for (Task t : started) {
                        id = t.getId();
                        name = t.getName();
                        desc = t.getDesc();
                %>

                <button onclick="openPopUp('<%=id%>', '<%=name%>', '<%=desc%>', '<%=state%>', '<%=btnText%>')">
                    <%=t.getName()%>
                </button>
                <%}
                %>
            </div>
            <div class="completed_tasks_div">
                <%
                    for (Task t : completed) {%>
                <button><%=t.getName()%></button>
                <%}
                %>
            </div>
        </main>
        <script src="js/pop_up.js"></script>
        <script>
                    const popUpTask = document.getElementById("task_pop-up");
                    const popUpID = document.getElementById("task_pop-up_id");
                    const popUpName = document.getElementById("task_pop-up_name");
                    const popUpDesc = document.getElementById("task_pop-up_desc");
                    const popUpState = document.getElementById("task_pop-up_state");
                    const popUpSubmit = document.getElementById("task_pop-up_submit")
                    const spanTask = document.getElementsByClassName("task_close")[0];

                    spanTask.onclick = function () {
                        popUpTask.style.display = "none";
                    }

                    window.onclick = function (event) {
                        if (event.target == popUp) {
                            popUpTask.style.display = "none";
                        }
                    }

                    function openPopUp(id, name, desc, state, text) {
                        popUpID.setAttribute("value", id);
                        popUpName.setAttribute("value", name);
                        popUpDesc.setAttribute("value", desc);
                        popUpState.setAttribute("value", state);
                        popUpSubmit.setAttribute("value", text);
                        popUpTask.style.display = "block";
                    }
        </script>
    </body>
</html>
