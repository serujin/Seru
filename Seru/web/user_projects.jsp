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
        <link rel="stylesheet" href="css/general1.css">
    </head>
    <body>
        <%
            String projectNamePlaceholder = TranslationManager.getInstance().getTranslatedString(Constants.PROJECT_NAME_PH);
            String projectDescPlaceholder = TranslationManager.getInstance().getTranslatedString(Constants.PROJECT_DESC_PH);
            String showCreateProjectButtonValue = TranslationManager.getInstance().getTranslatedString(Constants.CREATE_PROJECT_BTN);
            String createProjectButtonValue = TranslationManager.getInstance().getTranslatedString(Constants.CREATE_BTN_VALUE);
            String loadProjectButtonValue = TranslationManager.getInstance().getTranslatedString(Constants.LOAD_PROJECT_BTN_VALUE);
            String deleteProjectButtonValue = TranslationManager.getInstance().getTranslatedString(Constants.DELETE_BTN_VALUE);
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
        <button id="show_pop-up"><%=showCreateProjectButtonValue%></button>
        <div id="pop-up" class="col-12 row-12">
            <div class="pop-up_content col_container col-10">
                <span class="close col-12">&times;</span>
                <form class="col-12" action="${pageContext.request.contextPath}/UserProjects" method="post">
                    <input class="text_input" type="text" name=<%=Constants.FORM_PROJECT_NAME%> placeholder="<%=projectNamePlaceholder%>" required>
                    <input class="text_input" type="text" name=<%=Constants.FORM_PROJECT_DESC%> placeholder="<%=projectDescPlaceholder%>" required>
                    <input class="submit_input" type="submit" value="<%=createProjectButtonValue%>">
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
