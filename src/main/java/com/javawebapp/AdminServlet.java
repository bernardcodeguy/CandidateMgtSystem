package com.javawebapp;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;




@WebServlet("/admin")
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String key = request.getParameter("key");
		
		
		if(key.equals("kmTECHaDm1")) {
			
			HttpSession session = request.getSession();
			session.setAttribute("key", key);
			response.sendRedirect("admin.jsp");
			
			
		}else {
			PrintWriter out = response.getWriter(); 
			out.println("<script type=\"text/javascript\">"); 
			out.println("alert('Wrong PIN!!');"); 
			out.println("location='adminindex.jsp';");
			out.println("</script>"); 
			
		}
		
		
		
		
	}

	

}
