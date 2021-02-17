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
    </head>
    <body>
        <%
            String usernamePlaceholder = TranslationManager.getInstance().getLanguage()[Constants.USERNAME_PH];
            String passwordPlaceholder = TranslationManager.getInstance().getLanguage()[Constants.PASSWORD_PH];
            String confirmPasswordPlaceholder = TranslationManager.getInstance().getLanguage()[Constants.CONFIRM_PASSWORD_PH];
            String registerButtonValue = TranslationManager.getInstance().getLanguage()[Constants.REGISTER_BTN_VALUE];
            String backButtonValue = TranslationManager.getInstance().getLanguage()[Constants.BACK_TO_LOGIN_BTN_VALUE];
            System.out.println(usernamePlaceholder);
        %>
        <form action="${pageContext.request.contextPath}/Register" method="post">
            <input type="text" name=<%=Constants.FORM_USERNAME_NAME%> placeholder="<%=usernamePlaceholder%>" required >
            <input type="password" name=<%=Constants.FORM_PASSWORD_NAME%> placeholder="<%=passwordPlaceholder%>" required>
            <input type="password" name=<%=Constants.FORM_CONFIRM_PASSWORD_NAME%> placeholder="<%=confirmPasswordPlaceholder%>" required>
            <input type="submit" value=<%=registerButtonValue%>>
        </form>
        <button onClick="location.href='login.jsp'"><%=backButtonValue%></button>
    </body>
</html>
