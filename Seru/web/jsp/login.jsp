<%-- 
    Document   : login
    Created on : 06-feb-2021, 13:44:33
    Author     : Seruji
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <form action="${pageContext.request.contextPath}/Login" method="post">
            <input type="text" name="username" placeholder="Insert your username">
            <input type="password" name="pass" placeholder="Insert your password">
            <input type="input" value="Login">
        </form>
        <button onClick="window.location='register.jsp'">Register</button>
    </body>
</html>
