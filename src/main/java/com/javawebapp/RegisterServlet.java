package com.javawebapp;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;

import com.javawebapp.dao.EmailExistDao;
import com.javawebapp.dao.RegisterDao;


@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		
		String fname = request.getParameter("firstname");
		String lname = request.getParameter("lastname");
		String email = request.getParameter("email");
		String passPlain1 = request.getParameter("pass1");
		String passPlain2 = request.getParameter("pass2");
		String department = request.getParameter("department");
		String job = request.getParameter("job");	
		String country = request.getParameter("country");
		String gender = request.getParameter("gender");
		String question = request.getParameter("question");
		String answer = request.getParameter("answer");
		
		
		try {
			if(EmailExistDao.userExist(email)) {
				PrintWriter out1 = response.getWriter();
				out1.println("<script type=\"text/javascript\">");
				out1.println("alert('Employee with email you provided already exists');");
				out1.println("location='register.jsp';");
				out1.println("</script>");				
			}else {
				if(passPlain1.equals(passPlain2)) {
					String pass1 = hashPassword(passPlain1);
					String pass2 = hashPassword(passPlain2);
					
					Employee employee = new Employee(fname,lname,email,pass1,pass2,department,job,country,gender,question,answer);
					
					RegisterDao dao = new RegisterDao();
					
					
					String result = "";
					try {
						result = dao.insert(employee);
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (ClassNotFoundException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
					 if(result.equals("Data entry successfull")) {
						 HttpSession session = request.getSession();
						 session.setAttribute("email", employee.getEmail());			 
						 response.sendRedirect("dashboard");			 
					 }else {
						 response.getWriter().print(result);
					 }
				}else {
					PrintWriter out1 = response.getWriter();
					out1.println("<script type=\"text/javascript\">");
					out1.println("alert('Passwords does not match');");
					out1.println("location='register.jsp';"); out1.println("</script>");
				}
				
			}
			
			
		} catch (ClassNotFoundException | SQLException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}
	
	private String hashPassword(String plainTextPassword){
		return BCrypt.hashpw(plainTextPassword, BCrypt.gensalt());
	}
	
	

}
