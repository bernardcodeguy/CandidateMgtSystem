<%@page import="com.javawebapp.ConnectionManager"%>
<%@ page import="java.sql.*" %>


<%
	int emp_id = Integer.parseInt(request.getParameter("emp_id"));
	String institution = request.getParameter("institution");
	String program = request.getParameter("program");
	String start_date = request.getParameter("start_date");
	String end_date = request.getParameter("end_date");
	String certificate = request.getParameter("certificate");
	
	
	
	
	String sql = "INSERT INTO education(emp_id,institution,program,start_date,end_date,certificate) VALUES(?,?,?,?,?,?)";
	
	Connection con = ConnectionManager.getConnection();
	PreparedStatement ps = con.prepareStatement(sql);
	
	ps.setInt(1, emp_id);
	ps.setString(2, institution);
	ps.setString(3, program);
	ps.setString(4, start_date);
	ps.setString(5, end_date);
	ps.setString(6, certificate);
	
	
 	ps.executeUpdate();
	
%>

