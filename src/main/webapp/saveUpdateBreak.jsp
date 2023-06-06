<%@page import="com.javawebapp.ConnectionManager"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.time.LocalTime" %>
<%@ page import="java.time.format.*" %>

<%


	int id = Integer.parseInt(request.getParameter("id"));
	

	LocalTime timeNow = LocalTime.now();
	
	String timeNowString = timeNow.toString();
	
	String [] times = timeNowString.split("\\.");
	
	String sql = "UPDATE time_sheet SET break_time=? WHERE id=?";
	
	Connection con = ConnectionManager.getConnection();
	PreparedStatement ps = con.prepareStatement(sql);

	ps.setString(1, times[0]);
	ps.setInt(2, id);
	
	ps.executeUpdate();
	
	con.close();
%>
