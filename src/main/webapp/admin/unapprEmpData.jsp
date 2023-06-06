<%@ page import="java.sql.*" %>

<%!
	int unappr_id = 0;
	
%>


<% 
	if(request.getParameterMap().containsKey("unappr_id"))
	{
	     
		unappr_id = Integer.parseInt(request.getParameter("unappr_id")); 

	}



%>

  <input type="hidden" name="unappr_id" id="unappr_id"  value= "<%=unappr_id %>" />
                        
 <p>Are you sure you want to unapprove this employee?</p> 