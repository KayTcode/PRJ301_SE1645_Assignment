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
        <style>
            h1{
                font-family: inherit;
                font-weight: 500;
                line-height: 1.1;
                color: inherit;
                font-size: 36px;
                margin-top: 20px;
                margin-bottom: 10px;
            }
            .breadcrumb{
                padding: 8px 15px;
                margin-bottom: 20px;
                list-style: none;
                background-color: #f5f5f5;
                border-radius: 4px;
                text-decoration: none;
            }
            .takeatttable{
                width: 100%;
                table-layout: fixed;
            }
            .content{
                text-transform: uppercase;
                height: 10px;
                background-color: #6b90da;
            }
            .nd{
                background-color: aliceblue;
            }
        </style>
    </head>
    <body>
        <div>
            <h1>
                <span style="box-sizing: border-box">FPT University Academic Portal</span>
            </h1>
        </div>
        <div>
            <ol class="breadcrumb">
                <li>
                    <span>
                        <a href="#"  style="text-decoration: none;">Home</a>
                        &nbsp; | &nbsp;
                        <a>Take Attendance</a>
                    </span>
                </li>
            </ol>
        </div>
        <h1>Take attendance</h1>
        Attendance for ${requestScope.ses.group.subject.name} at slot ${requestScope.ses.timeslot.id} 
        on ${requestScope.ses.date} at room ${requestScope.ses.room.name}. This is the session number ${requestScope.ses.index} of the course
        <br> Attended: <span style="color: red;"> ${requestScope.ses.attandated?"Yes":"No"} </span>
        <form action="att" method="POST">
            <input type="hidden" name="sesid" value="${param.id}"/>
            <table class="takeatttable">
                <tr class="content">
                    <td>No.</td>
                    <td>StudentID</td>
                    <td>Full Name</td>
                    <td>Present</td>
                    <td>Absent</td>
                    <td>Description</td>
                    <td>Record Time</td>
                </tr>
                <c:forEach items="${requestScope.ses.attandances}" var="a" varStatus="loop">
                    <tr class="nd">
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
                    <td><input type="text" name="description${a.student.id}" value="${a.record_time}" /></td>
                </tr>   
                    
                </c:forEach>
                
            </table>
            <input type="submit" value="Save"/>
        </form>
    </body>
</html>
