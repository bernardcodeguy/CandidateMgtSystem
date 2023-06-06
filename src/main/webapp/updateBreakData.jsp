<%@page import="com.javawebapp.ConnectionManager"%>
<%@ page import="java.sql.*" %>

<%!
	int id = 0;
	
%>


<% 
	if(request.getParameterMap().containsKey("id"))
	{
	    String ids = request.getParameter("id");
	    
	    String i [] = ids.split("-");
		
		id = Integer.parseInt(i[0]); 
	    
		
	}

	

%>

	<input type="hidden" name="id" id="id"  value= "<%=id%>" />
                        
     <p>Are you sure you want to insert break time?</p> 