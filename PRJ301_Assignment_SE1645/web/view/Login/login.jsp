<%-- 
    Document   : login
    Created on : Nov 8, 2022, 10:11:53 PM
    Author     : win
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Login</h1>
        <form action="login" method="post">
            Username:<input type="text" name="username"/><br/>
            Password:<input type="text" name="password"><br/> 
            <input type="submit" name="Login"/>
        </form>
    </body>
</html>
