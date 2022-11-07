/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import org.apache.catalina.User;

/**
 *
 * @author win
 */
public class LoginController extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
       String password = req.getParameter("password");
       UserDBContext db = new UserDBContext();
       User user = db.get(username, password);
       if(user == null){
           resp.getWriter().println("Login failded");
       }else{
           req.getSession().setAttribute("userlogin", user);
           resp.getWriter().println("Lo gin successful");
       }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      req.getRequestDispatcher("View/Login/Login.jsp");
    }
    
    
}
