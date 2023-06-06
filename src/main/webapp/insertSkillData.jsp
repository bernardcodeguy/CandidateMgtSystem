<%@page import="com.javawebapp.ConnectionManager"%>
<%@ page import="java.sql.*" %>


<%
	int emp_id = Integer.parseInt(request.getParameter("emp_id"));
	String skill_name = request.getParameter("skill_name");
	String yr_exp = request.getParameter("yr_exp");
	
	
	
	
	
	String sql = "INSERT INTO skill(emp_id,skill_name,yr_exp) VALUES(?,?,?)";
	
	Connection con = ConnectionManager.getConnection();
	PreparedStatement ps = con.prepareStatement(sql);
	
	ps.setInt(1, emp_id);
	ps.setString(2, skill_name);
	ps.setString(3, yr_exp);

 	ps.executeUpdate();
	
%>

