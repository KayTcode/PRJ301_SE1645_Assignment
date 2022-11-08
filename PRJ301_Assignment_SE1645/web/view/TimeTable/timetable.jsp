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
        <div class="row">
            <h1 class="col-md-8">
                <span style="box-sizing: border-box">FPT University Academic Portal</span>
            </h1>
        </div>
        <div>
            <ol class="breadcrumb">
                <li>
                    <span>
                        <a style="color: ">Home</a>
                        &nbsp; | &nbsp;
                        <b>Time Table</b>
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
            <b>Chú thích</b> : Các hoạt động trong bảng dưới không bao gồm hoạt động ngoại khóa, ví dụ như hoạt động câu lạc bộ ...<br>
            Các phòng bắt đầu bằng AL thuộc tòa nhà Alpha. VD: AL...<br>
            Các phòng bắt đầu bằng BE thuộc tòa nhà Beta. VD: BE,..<br>
            Các phòng bắt đầu bằng G thuộc tòa nhà Gamma. VD: G201,...<br>
            Các phòng tập bằng đầu bằng R thuộc khu vực sân tập Vovinam.<br>
            Các phòng bắt đầu bằng DE thuộc tòa nhà Delta. VD: DE,..<br>
            Little UK (LUK) thuộc tầng 5 tòa nhà Delta
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
