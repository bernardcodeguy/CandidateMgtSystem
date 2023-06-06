<%@ page import="java.sql.*" %>
<%@ page import="com.javawebapp.ConnectionManager" %>



<%
	int unappr_id = Integer.parseInt(request.getParameter("unappr_id"));

	
	String sql = "UPDATE employees SET is_approved = 0, salary=0.00 WHERE id=?";
	Connection con = ConnectionManager.getConnection();
	PreparedStatement ps = con.prepareStatement(sql);

	ps.setInt(1, unappr_id);
	
	ps.executeUpdate();
	
	con.close();
%>