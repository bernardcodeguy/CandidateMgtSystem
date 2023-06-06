<%@page import="com.javawebapp.ConnectionManager"%>
<%@ page import="java.sql.*" %>

<%!
	int del_id = 0;
	int id2 = 0;
	String ins = "";
%>


<% 
	if(request.getParameterMap().containsKey("del_id"))
	{
	     
		del_id = Integer.parseInt(request.getParameter("del_id")); 
	    
	    
		String sql = "SELECT * FROM education WHERE id="+del_id;
		
		Connection con = ConnectionManager.getConnection();
		
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(sql);
		rs.next();
		
		id2 = rs.getInt("id");
		ins = rs.getString("institution");
		
	}

	

%>

	<input type="hidden" name="del_id" id="del_id"  value= "<%=id2%>" />
                        
     <p>Are you sure you want to delete record?</p> 