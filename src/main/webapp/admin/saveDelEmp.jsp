<%@ page import="java.sql.*" %>
<%@ page import="com.javawebapp.ConnectionManager" %>


<%
	int del_id = Integer.parseInt(request.getParameter("del_id"));

	
	String sql = "DELETE FROM employees WHERE id=?";
	Connection con = ConnectionManager.getConnection();
	PreparedStatement ps = con.prepareStatement(sql);

	ps.setInt(1, del_id);
	
	ps.executeUpdate(); 
	
	con.close();
	
%>

