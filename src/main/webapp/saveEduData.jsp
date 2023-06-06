<%@page import="com.javawebapp.ConnectionManager"%>
<%@ page import="java.sql.*" %>


<%
	int edit_id = Integer.parseInt(request.getParameter("edit_id"));
	
	String institution = request.getParameter("institution");
	String program = request.getParameter("program");
	String start_date = request.getParameter("start_date");
	String end_date = request.getParameter("end_date");
	String certificate = request.getParameter("certificate");
	
	
	
	String sql = "UPDATE education SET institution=?, program=?, start_date=?, end_date=?,certificate=? WHERE id=?";
	
	Connection con = ConnectionManager.getConnection();
	PreparedStatement ps = con.prepareStatement(sql);
	
	ps.setString(1, institution);
	ps.setString(2, program);
	ps.setString(3, start_date);
	ps.setString(4, end_date);
	ps.setString(5, certificate);
	ps.setInt(6, edit_id);
	
	ps.executeUpdate();  
	
%>


