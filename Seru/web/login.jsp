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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <%
            String usernamePlaceholder = TranslationManager.getInstance().getLanguage()[Constants.USERNAME_PH];
            String passwordPlaceholder = TranslationManager.getInstance().getLanguage()[Constants.PASSWORD_PH];
            String loginButtonValue = TranslationManager.getInstance().getLanguage()[Constants.LOGIN_BTN_VALUE];
            String registerButtonValue = TranslationManager.getInstance().getLanguage()[Constants.REGISTER_BTN_VALUE];
        %>
        <form action="${pageContext.request.contextPath}/Login" method="post">
            <input type="text" name=<%=Constants.FORM_USERNAME_NAME%> placeholder="<%=usernamePlaceholder%>" required>
            <input type="password" name=<%=Constants.FORM_PASSWORD_NAME%> placeholder="<%=passwordPlaceholder%>" required>
            <input type="submit" value=<%=loginButtonValue%>>
        </form>
        <button onClick="location.href='register.jsp'"><%=registerButtonValue%></button>
    </body>
</html>
