<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="helper" class="util.DateTimeHelper"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Schedule</title>
        <style>
            .slot{
                background-color: #6b90da;
                font-family: Calibri;
            }
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
            .TimeTable{
                width: 100%;
                table-layout: fixed;
            }
            .TimeLine{
                text-transform: uppercase;
                height: 10px;
                background-color: #6b90da;
            }
            .session{
                background-color: aliceblue;
                
            }
            #edunext{
                background-color:#2E2EFE;
                font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
                text-decoration: none;
                color: white;
                font-size: 14px;
                border-radius: 3px;
            }
            #timeslot{
                background-color: #01DF01;
                width: 90px;
                font-size: 14px;
                border-radius: 3px;
                text-align: center;
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
                        <a>Time Table</a>
                    </span>
                </li>
            </ol>
        </div>
        Campus: 
        <select>
            <option>
                FU-HL
            </option>
        </select><br>
        <h1>Activities for ${requestScope.lecturer.name} </h1>
        <p>
            <b>Note</b> : These activities do not include extra-curriculum activities, such as club activities ...<br>
            <b>Ch?? th??ch</b> : C??c ho???t ?????ng trong b???ng d?????i kh??ng bao g???m ho???t ?????ng ngo???i kh??a, v?? d??? nh?? ho???t ?????ng c??u l???c b??? ...<br>
            C??c ph??ng b???t ?????u b???ng AL thu???c t??a nh?? Alpha. VD: AL...<br>
            C??c ph??ng b???t ?????u b???ng BE thu???c t??a nh?? Beta. VD: BE,..<br>
            C??c ph??ng b???t ?????u b???ng G thu???c t??a nh?? Gamma. VD: G201,...<br>
            C??c ph??ng t???p b???ng ?????u b???ng R thu???c khu v???c s??n t???p Vovinam.<br>
            C??c ph??ng b???t ?????u b???ng DE thu???c t??a nh?? Delta. VD: DE,..<br>
            Little UK (LUK) thu???c t???ng 5 t??a nh?? Delta
        </p>
        <form action="timetable" method="GET">
            <input type="hidden" name="lid" value="${param.lid}"/>
            <b>Date: </b><br>
            From: <input type="date" name="from" value="${requestScope.from}"/>
            To: <input type="date" name="to" value="${requestScope.to}"/>
            <input type="submit" value="View"/> 
        </form>
        <table class="TimeTable">

            <tr class="TimeLine">
                <td style="width: 70px;">Slot</td>
                <c:forEach items="${requestScope.dates}" var="d">
                    <td>${helper.getDayNameofWeek(d)} <br>${d}</td>
                    </c:forEach>
            </tr>
            <c:forEach items="${requestScope.slots}" var="slot">
                <tr>
                    <td style="background-color: aliceblue; ">Slot ${slot.id}</td>
                    <c:forEach items="${requestScope.dates}" var="d">
                        <td class="session">
                            <c:forEach items="${requestScope.sessions}" var="ses">
                                <c:if test="${helper.compare(ses.date,d) eq 0 and (ses.timeslot.id eq slot.id)}">
                                    <a id="namesubject" href="att?id=${ses.id}">${ses.group.name}</a>
                                    <br/>
                                    at ${ses.room.name}
                                    <c:if test="${ses.attandated}">
                                        <p style="color: #01DF01;">(attended) <a id="edunext" href="#">Edunext</a> </p> <br>
                                        <p id="timeslot">(${slot.description})</p>
                                    </c:if>
                                    <c:if test="${!ses.attandated}">
                                        <p style="color: red;">(absent) <a id="edunext" href="#">Edunext</a></p>
                                        <p id="timeslot">(${slot.description})</p>
                                    </c:if>
                                </c:if>
                            </c:forEach>
                        </td>
                    </c:forEach>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
