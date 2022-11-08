<%-- 
    Document   : Attandance
    Created on : Oct 27, 2022, 12:02:59 PM
    Author     : win
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="helper" class="util.DateTimeHelper"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Take Attendance</title>
    </head>
    <body>
        <h1>Take attendance</h1>
        Attendance for ${requestScope.ses.group.subject.name} at slot ${requestScope.ses.timeslot.id} 
        on ${requestScope.ses.date} at room ${requestScope.ses.room.name}. This is the session number ${requestScope.ses.index} of the course
        <form action="att" method="POST">
            <input type="hidden" name="sesid" value="${param.id}"/>
            <table border="0px" style="width: 100%;">
                <tr style="background-color: #6b90da">
                    <td>No.</td>
                    <td>StudentID</td>
                    <td>Full Name</td>
                    <td>Present</td>
                    <td>Absent</td>
                    <td>Description</td>
                    <td>Show Image</td>
                </tr>
                <c:forEach items="${requestScope.ses.attandances}" var="a" varStatus="loop">
                 <tr>
                    <td>${loop.index+1}</td>
                    <td>${a.student.id}
                    <input type="hidden" name="stdid" value="${a.student.id}"/>
                    </td>
                    <td>${a.student.name}</td>
                    <td><input type="radio"
                               <c:if test="${a.present}">
                               checked="checked"
                               </c:if>
                               name="present${a.student.id}" value="present" /></td>
                    <td><input type="radio"
                               <c:if test="${!a.present}">
                               checked="checked"
                               </c:if>
                               name="present${a.student.id}" value="absent" /></td>
                    <td><input type="text" name="description${a.student.id}" value="${a.description}" /></td>
                </tr>   
                    
                </c:forEach>
                
            </table>
            <input type="submit" value="Save"/>
        </form>
    </body>
</html>
