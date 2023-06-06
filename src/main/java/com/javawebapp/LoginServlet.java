package com.javawebapp;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javawebapp.dao.LoginDao;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		LoginDao dao = new LoginDao();
		
		String email = request.getParameter("email");
		String password = request.getParameter("pass1");

		
		  if(dao.checkCredentials(email, password)) { 
			  HttpSession session = request.getSession(); 
			  session.setAttribute("email", email);
			  response.sendRedirect("dashboard");
		 
		 }else { 
			 PrintWriter out = response.getWriter();
			 out.println("<script type=\"text/javascript\">");
			 out.println("alert('Passowrd or Email incorrect');");
			 out.println("location='login.jsp';"); out.println("</script>");
		  
		  
		  }
		 
		
	}

}
