/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class Servlet1 extends HttpServlet {
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        response.setContentType("text/html");
        
        PrintWriter out = response.getWriter();
        
        out.println("ko co filter se thay dong nay");
        
//        Cookie cookie = new Cookie("name", "abc");
//        cookie.setMaxAge(5);
//        
//        response.addCookie(cookie);
//        
//        Cookie cookie2 = new Cookie("age", "20");
//        cookie2.setMaxAge(10);
//        
//        response.addCookie(cookie2);
    }
}
