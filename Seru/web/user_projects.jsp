<%-- 
    Document   : user_projects
    Created on : 15-feb-2021, 18:49:50
    Author     : Seruji
--%>

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
        <title>Projects</title>
        <link rel="stylesheet" href="css/user_projects.css">
    </head>
    <body>
        <%
            String projectNamePlaceholder = TranslationManager.getInstance().getLanguage()[Constants.PROJECT_NAME_PH];
            String projectDescPlaceholder = TranslationManager.getInstance().getLanguage()[Constants.PROJECT_DESC_PH];
            String showCreateProjectButtonValue = TranslationManager.getInstance().getLanguage()[Constants.CREATE_PROJECT_BTN];
            String createProjectButtonValue = TranslationManager.getInstance().getLanguage()[Constants.CREATE_PROJECT_POPUP_BTN];
            String loadProjectButtonValue = TranslationManager.getInstance().getLanguage()[Constants.LOAD_PROJECT_BTN];
        %>
        <button id="show_pop-up"><%=showCreateProjectButtonValue%></button>
        <div id="pop-up">
            <div class="pop-up_content">
                <span class="close">&times;</span>
                <form action="${pageContext.request.contextPath}/UserProjects" method="post">
                    <input type="text" name=<%=Constants.FORM_PROJECT_NAME%> placeholder="<%=projectNamePlaceholder%>" required>
                    <input type="text" name=<%=Constants.FORM_PROJECT_DESC%> placeholder="<%=projectDescPlaceholder%>" required>
                    <input type="submit" value="<%=createProjectButtonValue%>">
                </form>
            </div>
        </div>
        <%
            Set<Project> projects = UserManager.getInstance().getLoggedUser().getProjects();
            for (Project p : projects) {%>
            <div>
                <h1><%=p.getName()%></h1>
                <p><%=p.getDesc()%></p>
                <form action="${pageContext.request.contextPath}/Project" method="get">
                    <input type="number" name=<%=Constants.FORM_PROJECT_ID%> value="<%=p.getId()%>" style="display:none;">
                    <input type="submit" value="<%=loadProjectButtonValue%>">
                </form>
            </div>
        <%}%>
        <script src="js/pop_up.js"></script>
    </body>
</html>
