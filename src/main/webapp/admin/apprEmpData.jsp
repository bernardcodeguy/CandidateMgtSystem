<%@ page import="java.sql.*" %>

<%!
	int appr_id = 0;
	
%>


<% 
	if(request.getParameterMap().containsKey("appr_id"))
	{
	     
		appr_id = Integer.parseInt(request.getParameter("appr_id"));
		
		

	}

%>

 <input type="hidden" name="appr_id" id="appr_id"  value="<%=appr_id %>" />
 
 <div class="col s12 m12 l12">
	<div class=input-field>
		<label>Add Salary($)</label><br>
		<input type="text" id="salary" name="salary" class="validate" required>
	</div>
</div>
  
                
 <p style="margin-top:40px;">Are you sure you want to approve this employee?</p>  
