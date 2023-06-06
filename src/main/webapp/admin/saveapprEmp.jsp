
<%@ page import="java.sql.*" %>
<%@ page import="com.javawebapp.ConnectionManager" %>


<%
	int appr_id = Integer.parseInt(request.getParameter("appr_id"));
	double salary = Double.parseDouble(request.getParameter("salary"));	

	
	String sql = "UPDATE employees SET is_approved=1,salary=? WHERE id=?";
	Connection con = ConnectionManager.getConnection();
	PreparedStatement ps = con.prepareStatement(sql);

	ps.setDouble(1, salary);
	ps.setInt(2, appr_id);
	
	ps.executeUpdate(); 
	
	con.close();
%>