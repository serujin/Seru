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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8;">
        <title>Projects</title>
        <link rel="stylesheet" href="css/general.css">
    </head>
    <body style="background-image: url('images/Body_Bg.jpg');background-size: cover;">
        <%
            String projectNamePlaceholder = TranslationManager.getInstance().getTranslatedString(Constants.PROJECT_NAME_PH);
            String projectDescPlaceholder = TranslationManager.getInstance().getTranslatedString(Constants.PROJECT_DESC_PH);
            String showCreateProjectButtonValue = TranslationManager.getInstance().getTranslatedString(Constants.CREATE_PROJECT_BTN);
            String createProjectButtonValue = TranslationManager.getInstance().getTranslatedString(Constants.CREATE_BTN_VALUE);
            String loadProjectButtonValue = TranslationManager.getInstance().getTranslatedString(Constants.LOAD_PROJECT_BTN_VALUE);
            String deleteProjectButtonValue = TranslationManager.getInstance().getTranslatedString(Constants.DELETE_BTN_VALUE);
            String currentLanguage = TranslationManager.getInstance().getTranslatedString(Constants.LANGUAGE_VALUE);
            String logOutButtonValue = TranslationManager.getInstance().getTranslatedString(Constants.LOG_OUT_BTN_VALUE);
            String projectsOfValue = String.format(TranslationManager.getInstance().getTranslatedString(Constants.PROJECTS_OF_USER_VALUE), UserManager.getInstance().getLoggedUsername());
        %>
        <header class="row_container col-12 row-1-vh center_h space_content">
            <img class="col-1" src="images/Seru_Logo.png">
            <div class="col-3 row-1-vh">
                <div class="dropdown col-6 row-12" class="col_container center_wh">
                    <button class="dropbtn col-12 row-12 header_font"><%=currentLanguage%></button>
                    <form class="dropdown-content col-12" action="${pageContext.request.contextPath}/Translator" method="post">
                        <input type="text" name=<%=Constants.FORM_CURRENT_PAGE_VALUE%> value="<%=Constants.USER_PROJECTS_JSP_PATH%>" style="display:none">
                        <%
                            String[] languages = TranslationManager.getInstance().getAvaliableLanguages();

                            String language = "";
                            for (int i = 0; i < languages.length; i++) {
                                language = languages[i];
                        %> 
                        <input class="col-12" type="submit" name=<%=i%> value="<%=language%>">
                        <%}
                        %>
                    </form>
                </div>
                <form class="col-6 row-12" action="${pageContext.request.contextPath}/LogOut" method="post">
                    <input class="col-12 row-12 header_font" type="submit" value="<%=logOutButtonValue%>">
                </form>
            </div>
        </header>
        <div class="row_container col-12 row-1-vh center_wh">
            <p class="extra_info col-10 row-6 center_wh"><%=projectsOfValue%></p>
            <button id="show_pop-up" class="submit_input col-1 row-6 center_wh"><%=showCreateProjectButtonValue%></button>
        </div>
        <div id="pop-up" class="col_container col-12 row-12-vh center_wh">
            <div class="pop-up_content col_container col-10 row-10 center_h rounded">
                <div class="row_container col-12 end_align">
                    <span class="close">&times;</span>
                </div>
                <form class="col_container col-8 row-8 center_wh space_content" action="${pageContext.request.contextPath}/UserProjects" method="post">
                    <div class="col_container col-12 row-4 center_wh space_content">
                        <input class="pop-up_text_input col-12 row-3" type="text" name=<%=Constants.FORM_PROJECT_NAME%> placeholder="<%=projectNamePlaceholder%>" required>
                        <input class="pop-up_text_input col-12 row-3" type="text" name=<%=Constants.FORM_PROJECT_DESC%> placeholder="<%=projectDescPlaceholder%>" required>
                    </div>
                    <div class="col_container col-12 row-5 center_wh">
                        <input class="pop-up_submit_input col-3 row-4 center_wh header_font" type="submit" value="<%=createProjectButtonValue%>">
                    </div>
                </form>
            </div>
        </div>
        <div class="col-12 row-10-vh center_wh">
            <div class="projects_container col-10 row-12 center_wh">
                <%
                    Set<Project> projects = UserManager.getInstance().getLoggedUser().getProjects();
                    for (Project p : projects) {%>

                <div class="project_container col-3 row-3 space_content rounded">
                    <div class="col_container col-12 row-7 center_wh space_content">
                        <p class="project_title col-11 row-6 center_wh"><%=p.getName()%></p>
                        <p class="project_desc col-11  row-6 center_wh"><%=p.getDesc()%></p>
                    </div>
                    <div class="row_container col-12 row-4 center_wh">
                        <form class="row_container col-10 row-10 center_wh space_content" action="${pageContext.request.contextPath}/Project" method="post">
                            <input type="number" name=<%=Constants.FORM_PROJECT_ID%> value="<%=p.getId()%>" style="display:none;">
                            <input class="submit_input col-5 row-6 center_wh" type="submit" name=<%=Constants.FORM_SUBMIT_CHANGE%> value="<%=loadProjectButtonValue%>">
                            <input class="submit_input col-5 row-6 center_wh" type="submit" name=<%=Constants.FORM_SUBMIT_DELETE%> value="<%=deleteProjectButtonValue%>">
                        </form>
                    </div>
                </div>

                <%}%>
            </div>
        </div>
        <script src="js/pop_up.js"></script>
    </body>
</html>
