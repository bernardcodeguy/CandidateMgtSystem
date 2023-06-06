<%@page import="com.javawebapp.ConnectionManager"%>
<%@ page import="java.sql.*" %>
<%@ page import ="org.mindrot.jbcrypt.BCrypt" %>


<%
	int empid = Integer.parseInt(request.getParameter("empid"));
	String passPlain1 = request.getParameter("pass1");
	String passPlain2 = request.getParameter("pass2");
	
	
	
	String pass1 = BCrypt.hashpw(passPlain1, BCrypt.gensalt());
	String pass2 = BCrypt.hashpw(passPlain2, BCrypt.gensalt());
	
	
	String sql = "UPDATE employees SET pass1=?, pass2=? WHERE id=?";
	
	Connection con = ConnectionManager.getConnection();
	PreparedStatement ps = con.prepareStatement(sql);
	
	ps.setString(1, pass1);
	ps.setString(2, pass2);
	ps.setInt(3, empid);
	
	ps.executeUpdate();  
	
%>

