<%@page import="com.javawebapp.ConnectionManager"%>
<%@ page import="java.sql.*" %>


<%
	int edit_id = Integer.parseInt(request.getParameter("edit_id"));
	
	String skill_name = request.getParameter("skill_name");
	String yr_exp = request.getParameter("yr_exp");
	
	 
	String sql = "UPDATE skill SET skill_name=?, yr_exp=? WHERE id=?";
	
	Connection con = ConnectionManager.getConnection();
	PreparedStatement ps = con.prepareStatement(sql);
	
	ps.setString(1, skill_name);
	ps.setString(2, yr_exp);
	ps.setInt(3, edit_id);
	
	ps.executeUpdate(); 
	
%>

<%

	out.println(skill_name);
%>