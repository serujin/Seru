<%-- 
    Document   : register
    Created on : 15-feb-2021, 17:49:52
    Author     : Seruji
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
    </head>
    <body>
        <form action="${pageContext.request.contextPath}/Register" method="post">
            <input type="text" name="username" placeholder="Insert your username">
            <input type="password" name="pass" placeholder="Insert your password">
            <input type="password" name="confirm" placeholder="Confirm your password">
            <input type="input" value="Register">
        </form>
        <button onClick="window.location='login.jsp'">Back to login</button>
    </body>
</html>
