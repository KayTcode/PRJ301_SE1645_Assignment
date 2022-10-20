/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package View;

import Dal.assignment.LecturerDBContext;
import Dal.assignment.SessionDBContext;
import Dal.assignment.TimeSlotDBContext;
import Model.Lecturer;
import Model.Session;
import Model.TimeSlot;
import Util.DateTimeHelper;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author win
 */
public class view extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      processRequest(req, resp);
    }

   

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp);
    }
    void processRequest(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int lid = Integer.parseInt(req.getParameter("lid"));
        String raw_from = req.getParameter("from");
        String raw_to = req.getParameter("to");
        java.sql.Date from = null;
        java.sql.Date to = null;
        if(raw_from ==null || raw_from.length() ==0)
        {
            Date today = new Date();
            int todayOfWeek = DateTimeHelper.getDayofWeek(today);
            Date e_from = DateTimeHelper.addDays(today, 2 - todayOfWeek);
            Date e_to = DateTimeHelper.addDays(today, 8-todayOfWeek);
            from = DateTimeHelper.toDateSql(e_from);
            to = DateTimeHelper.toDateSql(e_to);
        }
        else
        {
            from = java.sql.Date.valueOf(raw_from);
            to = java.sql.Date.valueOf(raw_to);
        }
        
        req.setAttribute("from", from);
        req.setAttribute("to", to);
        req.setAttribute("dates", DateTimeHelper.getDateList(from, to));
        
        TimeSlotDBContext slotDB = new TimeSlotDBContext();
        ArrayList<TimeSlot> slots = slotDB.list();
        req.setAttribute("slots", slots);
        
        SessionDBContext sesDB = new SessionDBContext();
        ArrayList<Session> sessions = sesDB.filter(lid, from, to);
        req.setAttribute("sessions", sessions);
        
        LecturerDBContext lecDB = new LecturerDBContext();
        Lecturer lecturer = lecDB.get(lid);
        req.setAttribute("lecturer", lecturer);
        
        req.getRequestDispatcher("/View_Background/ViewSchedule.jsp").forward(req, resp);
    }
}