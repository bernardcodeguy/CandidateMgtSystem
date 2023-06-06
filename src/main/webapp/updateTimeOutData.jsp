<%@page import="com.javawebapp.ConnectionManager"%>
<%@ page import="java.sql.*" %>

<%!
	int id = 0;
	int emp_id = 0;
	
%>


<% 
	if(request.getParameterMap().containsKey("id"))
	{
	     
		String ids = request.getParameter("id");
	    
	    String i [] = ids.split("-");
		
		id = Integer.parseInt(i[0]); 
		
		emp_id = Integer.parseInt(request.getParameter("emp_id")); 
		
	}

	

%>

	<input type="hidden" name="id" id="id"  value= "<%=id%>" />
	<input type="hidden" name="emp_id" id="emp_id"  value= "<%=emp_id%>" />
                        
     <p>Are you sure you want to insert closing time?</p> 