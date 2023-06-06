package com.javawebapp;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class SheetServlet
 */
@WebServlet("/sheet")
public class SheetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		String id = request.getParameter("emp_id");
		
		session.setAttribute("emp_id", id);
		
		response.sendRedirect("employeesheet.jsp?page=1");
		
		response.getWriter().println(id);
		
	}


}
