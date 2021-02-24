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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8;">
        <title><%=ProjectManager.getInstance().getCurrentProject().getName()%></title>
        <link rel="stylesheet" href="css/general.css">
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
            String backToProjectsButtonValue = TranslationManager.getInstance().getTranslatedString(Constants.BACK_TO_PROJECTS_BTN_VALUE);
            String tasksOfValue = String.format(TranslationManager.getInstance().getTranslatedString(Constants.TASKS_OF_PROJECT_VALUE), ProjectManager.getInstance().getCurrentProject().getName());
        %>
        <header class="row_container col-12 row-1-vh center_h space_content color-2">
            <img class="col-1" src="images/Seru_Logo.png">
            <div class="col-2 row-1-vh">
                <div class="dropdown col-6 row-12" class="col_container center_wh color-2">
                    <button class="dropbtn col-12 row-12 color-2 header_font"><%=currentLanguage%></button>
                    <form class="dropdown-content col-12" action="${pageContext.request.contextPath}/Translator" method="post">
                        <input type="text" name=<%=Constants.FORM_CURRENT_PAGE_VALUE%> value="<%=Constants.PROJECT_JSP_PATH%>" style="display:none">
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
        <div class="row_container col-12 row-1-vh center_wh">
            <p class="extra_info col-9 row-6 center_wh"><%=tasksOfValue%></p>
            <button id="show_pop-up" class="submit_input col-1 row-6 center_wh"><%=showCreateTaskButtonValue%></button>
            <button class="submit_input col-1 row-6 center_wh" onClick="location.href = '<%=Constants.USER_PROJECTS_JSP_PATH%>'"><%=backToProjectsButtonValue%></button>
        </div>
        <div id="pop-up" class="col_container col-12 row-12-vh center_wh">
            <div class="pop-up_content col_container col-10 row-10 color-7 center_h rounded">
                <div class="row_container col-12 end_align">
                    <span class="close">&times;</span>
                </div>
                <form class="col_container col-8 row-8 center_wh space_content" action="${pageContext.request.contextPath}/Project" method="get">
                    <div class="col_container col-12 row-4 center_wh space_content">
                        <input class="text_input col-12 row-3" type="text" name=<%=Constants.FORM_TASK_NAME%> placeholder="<%=taskNamePlaceholder%>" required>
                        <input class="text_input col-12 row-3" type="text" name=<%=Constants.FORM_TASK_DESC%> placeholder="<%=taskDescPlaceholder%>" required>
                    </div>
                    <div class="col_container col-12 row-5 center_wh">
                        <input class="submit_input col-3 row-4 center_wh header_font" type="submit" value="<%=createTaskButtonValue%>">
                    </div>
                </form>
            </div>
        </div>
        <div id="task_pop-up" class="col_container col-12 row-12-vh center_wh">
            <div class="task_pop-up_content col_container col-10 row-10 color-7 center_h rounded">
                <div class="row_container col-12 end_align">
                    <span class="task_close">&times;</span>
                </div>
                <form class="col_container col-8 row-8 center_wh space_content" action="${pageContext.request.contextPath}/Task" method="post">
                    <input id="task_pop-up_id" type="text" name=<%=Constants.FORM_TASK_ID%> style="display:none;">
                    <div class="col_container col-12 row-4 center_wh space_content">
                        <input id="task_pop-up_name"  class="text_input col-12 row-3" type="text" name=<%=Constants.FORM_TASK_NAME%> readonly>
                        <input id="task_pop-up_desc"  class="text_input col-12 row-3" type="text" name=<%=Constants.FORM_TASK_DESC%> readonly>  
                    </div>
                    <input id="task_pop-up_state" type="text" name=<%=Constants.FORM_TASK_STATE%> style="display:none;">
                    <div class="row_container col-12 row-5 center_wh">
                        <input id="task_pop-up_submit" class="submit_input col-4 row-4 center_wh header_font" type="submit" name=<%=Constants.FORM_SUBMIT_CHANGE%>>
                        <input  class="submit_input col-4 row-4 center_wh header_font" type="submit" name=<%=Constants.FORM_SUBMIT_DELETE%> value="<%=deleteTaskButtonValue%>">
                    </div>
                </form>
            </div>
        </div>
        <%
            String createdTasksTitle = TranslationManager.getInstance().getTranslatedString(Constants.CREATED_TASK_TITLE);
            String startedTasksTitle = TranslationManager.getInstance().getTranslatedString(Constants.STARTED_TASK_TITLE);
            String completedTasksTitle = TranslationManager.getInstance().getTranslatedString(Constants.COMPLETED_TASK_TITLE);
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
        <main class="row_container col-11 row-10-vh center_wh space_content">
            <div class="col_container col-3 row-11 color-1 rounded">
                <p class="header_font col-12 row-1 center_w"><%=createdTasksTitle%></p>
                <div class="tasks_container col-12 center_w">
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
                    <div class="task_container col-10 center_h">
                        <button class="task_title col-10 row-12 color-6" onclick="openPopUp('<%=id%>', '<%=name%>', '<%=desc%>', '<%=state%>', '<%=btnText%>')">
                            <%=t.getName()%>
                        </button>
                        <div class="task_created_state col-2 row-12"></div>
                    </div>
                    <%}
                    %>
                </div>
            </div>
            <div class="col_container col-3 row-11 color-2 rounded">
                <p class="header_font col-12 row-1 center_w"><%=startedTasksTitle%></p>
                <div class="tasks_container col-12 center_w">
                    <%
                        state = Constants.TASK_STARTED_STATE;
                        btnText = TranslationManager.getInstance().getTranslatedString(Constants.COMPLETED_TASK_BTN_VALUE);
                        for (Task t : started) {
                            id = t.getId();
                            name = t.getName();
                            desc = t.getDesc();
                    %>
                    <div class="task_container col-10 center_h">
                        <button class="task_title col-10 row-12 color-6" onclick="openPopUp('<%=id%>', '<%=name%>', '<%=desc%>', '<%=state%>', '<%=btnText%>')">
                            <%=t.getName()%>
                        </button>
                        <div class="task_started_state col-2 row-12"></div>
                    </div>
                    <%}
                    %>
                </div>
            </div>
            <div class="col_container col-3 row-11 color-3 rounded">
                <p class="header_font col-12 row-1 center_w"><%=completedTasksTitle%></p>
                <div class="tasks_container col-12 center_w">
                    <%
                        for (Task t : completed) {%>
                    <div class="task_container col-10 center_h">
                        <button class="task_title col-10 row-12 color-6">
                            <%=t.getName()%>
                        </button>
                        <div class="task_completed_state col-2 row-12"></div>
                    </div>
                    <%}
                    %>
                </div>
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
