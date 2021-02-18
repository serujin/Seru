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
        <link rel="stylesheet" href="css/pop_up.css">
        <link rel="stylesheet" href="css/change_language.css">
    </head>
    <body>
        <%
            String projectNamePlaceholder = TranslationManager.getInstance().getTranslatedString(Constants.PROJECT_NAME_PH);
            String projectDescPlaceholder = TranslationManager.getInstance().getTranslatedString(Constants.PROJECT_DESC_PH);
            String showCreateProjectButtonValue = TranslationManager.getInstance().getTranslatedString(Constants.CREATE_PROJECT_BTN);
            String createProjectButtonValue = TranslationManager.getInstance().getTranslatedString(Constants.CREATE_BTN_VALUE);
            String loadProjectButtonValue = TranslationManager.getInstance().getTranslatedString(Constants.LOAD_PROJECT_BTN_VALUE);
            String deleteProjectButtonValue = TranslationManager.getInstance().getTranslatedString(Constants.DELETE_BTN_VALUE);
        %>
        <div class="dropdown">
            <button class="dropbtn">Dropdown</button>
            <form class="dropdown-content" action="${pageContext.request.contextPath}/Translator" method="post">
                <input type="text" name=<%=Constants.FORM_CURRENT_PAGE_VALUE%> value="<%=Constants.USER_PROJECTS_JSP_PATH%>" style="display:none">
                <%
                    String[] languages =  TranslationManager.getInstance().getAvaliableLanguages(); 

                    String language = "";
                    for(int i = 0; i < languages.length; i++) {
                        language = languages[i];
                %> 
                       <input type="submit" name=<%=i%> value="<%=language%>">
                    <%}
                %>
            </form>
        </div>
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
                <form action="${pageContext.request.contextPath}/Project" method="post">
                    <input type="number" name=<%=Constants.FORM_PROJECT_ID%> value="<%=p.getId()%>" style="display:none;">
                    <input type="submit" name=<%=Constants.FORM_SUBMIT_CHANGE%> value="<%=loadProjectButtonValue%>">
                    <input type="submit" name=<%=Constants.FORM_SUBMIT_DELETE%> value="<%=deleteProjectButtonValue%>">
                </form>
            </div>
        <%}%>
        <script src="js/pop_up.js"></script>
    </body>
</html>
