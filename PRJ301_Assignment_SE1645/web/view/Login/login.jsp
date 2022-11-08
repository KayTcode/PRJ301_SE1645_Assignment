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
        <title>FPT University Login</title>
        <style>
            .img{
                width: 100%;
            }
             h1{
                font-family: inherit;
                font-weight: 500;
                line-height: 1.1;
                color: inherit;
                font-size: 36px;
                margin-top: 20px;
                margin-bottom: 10px;
                text-align: center;
                
            }
            .login{
                text-align: center;
                margin: 200px 200px 150px 800px;
                background-color: rgba(0,233,0,0.2);
                width: 300px;
                height: 100px;
                padding: 200px 10px 150px 0px;
               
               
            }
        </style>
    </head>
    <body>
        
        <div class="img">
            <img src="/view/img/background.jpg">
        </div>
        <div>
            <h1>FPT Login</h1>
        <form action="login" method="post" class="login">
            Username:<input type="text" name="username"/><br/>
            Password:<input type="text" name="password"><br/> 
            <input type="submit" name="Login"/>
        </form>
        </div>
    </body>
</html>
