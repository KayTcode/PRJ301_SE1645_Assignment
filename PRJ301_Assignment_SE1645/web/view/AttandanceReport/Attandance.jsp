<%-- 
    Document   : Attandance
    Created on : Oct 27, 2022, 12:02:59 PM
    Author     : win
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Take Attendance</title>
    </head>
    <body>
        <h1>FPT University Academic Portal</h1>
        <div>
            <a href="#">Home</a>
        </div>
        <h1>Take attendance</h1>
        <p>Attendance for ${requestScope.Subject.name} at slot ${requestScope.slot.id} on ${requestScope.dates} ${requestScope.helper.compare(ses.date,d)}</p>
        
    </body>
</html>
