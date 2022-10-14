<%-- 
    Document   : ViewSchedule
    Created on : Oct 14, 2022, 2:12:12 PM
    Author     : win
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Schedule</title>
    </head>
    <body>
         <h1>FPT University Hoa Lac</h1>
    <div>
        <h2>Activities for
            <span id="ctl00_mainContent_lblStudent">ThanhCHHE161893 (Chử Hữu Thành)</span>
        </h2>
        <p>
            <b>Note</b>: These activities do not include extra-curriculum activities, such as
            club activities ...
        </p>
        <p>
            <b>Chú thích</b>: Các hoạt động trong bảng dưới không bao gồm hoạt động ngoại khóa,
            ví dụ như hoạt động câu lạc bộ ...
        </p>
        <div id="ctl00_mainContent_ghichu">
            <p>
                Các phòng bắt đầu bằng AL thuộc tòa nhà Alpha. VD: AL...<br>
                Các phòng bắt đầu bằng BE thuộc tòa nhà Beta. VD: BE,..<br>
                Các phòng bắt đầu bằng G thuộc tòa nhà Gamma. VD: G201,...<br>
                Các phòng tập bằng đầu bằng R thuộc khu vực sân tập Vovinam.<br>
                Các phòng bắt đầu bằng DE thuộc tòa nhà Delta. VD: DE,..<br>
                Little UK (LUK) thuộc tầng 5 tòa nhà Delta
            </p>
        </div>
        <div>
            <table border="0px" style="width: 100%" ;>
                <tr style="background-color: #668fe0" ;>
                    <th>Year
                        <select>
                            <option value="2019">2019</option>
                            <option value="2020">2020</option>
                            <option value="2021">2021</option>
                            <option selected="selected" value="2022">2022</option>
                            <option value="2023">2023</option>
                        </select>
                    </th>
                    <th>Mon</th>
                    <th>Tue</th>
                    <th>Wed</th>
                    <th>Thu</th>
                    <th>Fri</th>
                    <th>Sat</th>
                    <th>Sun</th>

                </tr>
                <tr>
                    <th>Slot 1</th>
                </tr>
                <tr>
                    <th>Slot 2</th>
                </tr>
                <tr>
                    <th>Slot 3</th>
                </tr>
                <tr>
                    <th>Slot 4</th>
                </tr>
                <tr>
                    <th>Slot 5</th>
                </tr>
                <tr>
                    <th>Slot 6</th>
                </tr>
                <tr>
                    <th>Slot 7</th>
                </tr>
                <tr>
                    <th>Slot 8</th>
                </tr>
            </table>
        </div>
    </div>
    </body>
</html>
