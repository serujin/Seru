<%-- 
    Document   : login
    Created on : 06-feb-2021, 13:44:33
    Author     : Seruji
--%>

<%@page import="manager.TranslationManager"%>
<%@page import="constants.Constants"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8;">
        <title>Login</title>
        <link rel="stylesheet" href="css/general.css">
    </head>
    <body style="background-image: url('images/Body_Bg.jpg'); background-size: auto;">
        <%
            String usernamePlaceholder = TranslationManager.getInstance().getTranslatedString(Constants.USERNAME_PH);
            String passwordPlaceholder = TranslationManager.getInstance().getTranslatedString(Constants.PASSWORD_PH);
            String loginButtonValue = TranslationManager.getInstance().getTranslatedString(Constants.LOGIN_BTN_VALUE);
            String registerButtonValue = TranslationManager.getInstance().getTranslatedString(Constants.REGISTER_BTN_VALUE);
            String currentLanguage = TranslationManager.getInstance().getTranslatedString(Constants.LANGUAGE_VALUE);
        %>
        <header class="row_container col-12 row-1-vh center_h space_content">
            <img class="col-1" src="images/Seru_Logo.png">
            <div class="dropdown col-1 row-1-vh" class="col_container center_wh">
                <button class="dropbtn col-12 row-12 header_font"><%=currentLanguage%></button>
                <form class="dropdown-content col-12" action="${pageContext.request.contextPath}/Translator" method="post">
                    <input type="text" name=<%=Constants.FORM_CURRENT_PAGE_VALUE%> value="<%=Constants.LOGIN_JSP_PATH%>" style="display:none">
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
        </header>
        <div class="row_container col-12 row-10-vh center_wh">
            <div class="col_container col-3 row-7 center_wh rounded space_content bg_color">
                <img class="col-10" src="images/Login_Logo.png">
                <form class="col_container col-7 row-8" action="${pageContext.request.contextPath}/Login" method="post">
                    <div class="col_container col-12 row-6 space_content">
                        <input class="text_input col-12 row-5" type="text" name=<%=Constants.FORM_USERNAME_NAME%> placeholder="<%=usernamePlaceholder%>" required>
                        <input class="text_input col-12 row-5" type="password" name=<%=Constants.FORM_PASSWORD_NAME%> placeholder="<%=passwordPlaceholder%>" required>
                    </div>
                    <div class="row_container col-12 row-4 center_h space_content">
                        <button class="submit_input col-4 row-5 center_wh" onClick="location.href = 'register.jsp'"><%=registerButtonValue%></button> 
                        <input class="submit_input col-4 row-5 center_wh" type="submit" value=<%=loginButtonValue%>>
                    </div> 
                </form>
            </div>
        </div>
    </body>
</html>
