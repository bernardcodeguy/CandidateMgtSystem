package com.javawebapp;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javawebapp.dao.SecurityDao;

/**
 * Servlet implementation class SecurityServlet
 */
@WebServlet("/security")
public class SecurityServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String question = request.getParameter("question");
		String answer = request.getParameter("answer");
		
		SecurityDao dao = new SecurityDao();
		
		String password = "";
		
		
		try {
			password = dao.insert(email, question, answer);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		HttpSession session = request.getSession();
		
		session.setAttribute("password", password);
		
		response.sendRedirect("recoverypassword.jsp");
		
	}

}
