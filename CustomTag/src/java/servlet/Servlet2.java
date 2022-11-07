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
public class Servlet2 extends HttpServlet {
   
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        out.println("ko co filter se thay dong nay");
        
//        Cookie[] cookies = request.getCookies();
//        
//        for (Cookie c : cookies) {
//            out.println(c.getName()+ " : "+ c.getValue() + "<br>");
//            
//            if(c.getName().equals("age")){
//                c.setMaxAge(0);
//                
//                response.addCookie(c);
//                        
//            }
//        }
    } 

    
}
