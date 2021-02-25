<%-- 
    Document   : register
    Created on : 15-feb-2021, 17:49:52
    Author     : Seruji
--%>

<%@page import="manager.TranslationManager"%>
<%@page import="constants.Constants"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8;">
        <title>Register</title>
        <link rel="stylesheet" href="css/general.css">
    </head>
    <body style="background-image: url('images/Body_Bg.jpg');background-size: auto">
        <%
            String usernamePlaceholder = TranslationManager.getInstance().getTranslatedString(Constants.USERNAME_PH);
            String passwordPlaceholder = TranslationManager.getInstance().getTranslatedString(Constants.PASSWORD_PH);
            String confirmPasswordPlaceholder = TranslationManager.getInstance().getTranslatedString(Constants.CONFIRM_PASSWORD_PH);
            String registerButtonValue = TranslationManager.getInstance().getTranslatedString(Constants.REGISTER_BTN_VALUE);
            String backButtonValue = TranslationManager.getInstance().getTranslatedString(Constants.BACK_TO_LOGIN_BTN_VALUE);
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
            <div class="col_container col-3 row-9 center_wh rounded space_content bg_color">
                <img class="col-10" src="images/Register_Logo.png">
                <form class="col_container col-7 row-9" action="${pageContext.request.contextPath}/Register" method="post">
                    <div class="col_container col-12 row-6 space_content">
                        <input class="text_input col-12 row-3" type="text" name=<%=Constants.FORM_USERNAME_NAME%> placeholder="<%=usernamePlaceholder%>" required >
                        <input class="text_input col-12 row-3" type="password" name=<%=Constants.FORM_PASSWORD_NAME%> placeholder="<%=passwordPlaceholder%>" required>
                        <input class="text_input col-12 row-3" type="password" name=<%=Constants.FORM_CONFIRM_PASSWORD_NAME%> placeholder="<%=confirmPasswordPlaceholder%>" required>
                    </div>
                    <div class="row_container col-12 row-4 center_h space_content">
                        <button class="submit_input col-5 row-5 center_wh" onClick="location.href = '<%=Constants.LOGIN_JSP_PATH%>'"><%=backButtonValue%></button>
                        <input class="submit_input col-5 row-5 center_wh" type="submit" value=<%=registerButtonValue%>>
                    </div> 
                </form>
            </div>
        </div>
    </body>
</html>
