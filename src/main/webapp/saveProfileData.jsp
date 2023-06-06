<%@page import="com.javawebapp.ConnectionManager"%>
<%@ page import="java.sql.*" %>


<%
	int empid = Integer.parseInt(request.getParameter("empid"));
	String fname = request.getParameter("fname");
	String lname = request.getParameter("lname");
	String department = request.getParameter("department");
	String job = request.getParameter("job");
	String country = request.getParameter("country");
	String gender = request.getParameter("gender");
	String question = request.getParameter("question");
	String answer = request.getParameter("answer");
	
	
	 
	String sql = "UPDATE employees SET fname=?, lname=?, department=?, job=?, country=?, gender=?,question=?,answer=? WHERE id=?";
	
	Connection con = ConnectionManager.getConnection();
	PreparedStatement ps = con.prepareStatement(sql);
	
	ps.setString(1, fname);
	ps.setString(2, lname);
	ps.setString(3, department);
	ps.setString(4, job);
	ps.setString(5, country);
	ps.setString(6, gender);
	ps.setString(7, question);
	ps.setString(8, answer);
	ps.setInt(9, empid);
	
	ps.executeUpdate(); 
	
%>

<%
	out.println(job);
%>


