<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="helper" class="util.DateTimeHelper"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Schedule</title>
        <link rel="stylesheet" href="/CSS/Styleindex.css">
    </head>
    <body>
        <div class="Content">
            Campus: 
            <select>
                <option>
                    FU-HL
                </option>
            </select><br>
            Lecturer: <input type="text" readonly="readonly" value="${requestScope.lecturer.name}"/>
            <form action="timetable" method="GET">
                <input type="hidden" name="lid" value="${param.lid}"/>
                Date:
                From: <input type="date" name="from" value="${requestScope.from}"/>
                To: <input type="date" name="to" value="${requestScope.to}"/>
                <input type="submit" value="View"/> 
            </form>
        </div>
        <table class="TimeTable" border="0px" style="width: 100%;">

            <tr>
                <th style="background-color: #6b90da">Slot</th>
                    <c:forEach items="${requestScope.dates}" var="d">
                    <th style="background-color: #6b90da">${helper.getDayNameofWeek(d)} <br>${d}</th>
                    </c:forEach>
            </tr>
            <c:forEach items="${requestScope.slots}" var="slot">
                <tr style="background: beige">
                    <td >Slot ${slot.id}</td>
                    <c:forEach items="${requestScope.dates}" var="d">
                        <td>
                            <c:forEach items="${requestScope.sessions}" var="ses">
                                <c:if test="${helper.compare(ses.date,d) eq 0 and (ses.timeslot.id eq slot.id)}">
                                    <a id="namesubject" href="att?id=${ses.id}">${ses.group.name}</a>
                                    <br/>
                                    at ${ses.room.name}
                                    <c:if test="${ses.attandated}">
                                        <p>attaned <a id="edunext" href="#">Edunext</a> </p> <br>
                                        <p id="timeslot">(${slot.description})</p>
                                    </c:if>
                                    <c:if test="${!ses.attandated}">
                                        <p>absent <a id="edunext" href="#">Edunext</a></p>
                                        <p id="timeslot">(${slot.description})</p>
                                    </c:if>
                                </c:if>
                                <c:if test="${helper.compare(ses.date,d) ne 0 and (ses.timeslot.id eq slot.id)}" >
                                    <p>-</p>
                                </c:if>
                            </c:forEach>
                        </td>
                    </c:forEach>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
