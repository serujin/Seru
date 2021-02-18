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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        <link rel="stylesheet" href="css/change_language.css">
    </head>
    <body>
        <%
            String usernamePlaceholder = TranslationManager.getInstance().getTranslatedString(Constants.USERNAME_PH);
            String passwordPlaceholder = TranslationManager.getInstance().getTranslatedString(Constants.PASSWORD_PH);
            String confirmPasswordPlaceholder = TranslationManager.getInstance().getTranslatedString(Constants.CONFIRM_PASSWORD_PH);
            String registerButtonValue = TranslationManager.getInstance().getTranslatedString(Constants.REGISTER_BTN_VALUE);
            String backButtonValue = TranslationManager.getInstance().getTranslatedString(Constants.BACK_TO_LOGIN_BTN_VALUE);
        %>
        <div class="dropdown">
            <button class="dropbtn">Dropdown</button>
            <form class="dropdown-content" action="${pageContext.request.contextPath}/Translator" method="post">
                <input type="text" name=<%=Constants.FORM_CURRENT_PAGE_VALUE%> value="<%=Constants.REGISTER_JSP_PATH%>" style="display:none">
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
        <form action="${pageContext.request.contextPath}/Register" method="post">
            <input type="text" name=<%=Constants.FORM_USERNAME_NAME%> placeholder="<%=usernamePlaceholder%>" required >
            <input type="password" name=<%=Constants.FORM_PASSWORD_NAME%> placeholder="<%=passwordPlaceholder%>" required>
            <input type="password" name=<%=Constants.FORM_CONFIRM_PASSWORD_NAME%> placeholder="<%=confirmPasswordPlaceholder%>" required>
            <input type="submit" value=<%=registerButtonValue%>>
        </form>
        <button onClick="location.href='login.jsp'"><%=backButtonValue%></button>
    </body>
</html>
