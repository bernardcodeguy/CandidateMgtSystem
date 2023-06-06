<%@page import="com.javawebapp.ConnectionManager"%>
<%@ page import="java.sql.*" %>


<%


	int del_id = Integer.parseInt(request.getParameter("del_id"));

	
	String sql = "DELETE FROM education WHERE id=?";
	
	Connection con = ConnectionManager.getConnection();
	PreparedStatement ps = con.prepareStatement(sql);

	ps.setInt(1, del_id);
	
	ps.executeUpdate();
%>
