<%@page import="com.javawebapp.ConnectionManager"%>
<%@ page import="java.sql.*" %>

<%!
	int edit_id = 0;
	int id = 0;
	String institution = "";
	String program = "";
	String start_date = "";
	String end_date = "";
	String certificate = "";
%>


<% 
	if(request.getParameterMap().containsKey("edit_id"))
	{
	     
		edit_id = Integer.parseInt(request.getParameter("edit_id")); 
	    
	    
		String sql = "SELECT institution,program,start_date,end_date,certificate FROM education WHERE id="+edit_id;
		
		Connection con = ConnectionManager.getConnection();
		
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(sql);
		rs.next();
		
		
		institution = rs.getString("institution");
		program = rs.getString("program");
		start_date = rs.getString("start_date");
		end_date = rs.getString("end_date");
		certificate = rs.getString("certificate");
		
	}

%>

	


			<div class="col s12">
				<div class=input-field>		
					<input type="hidden" id="emp_id" name="edit_id" value="<%=edit_id %>">
				</div>
		     </div> 
		       			
	
				 <div class="col s12">
					<div class=input-field>
						<label for="program">Institution</label><br>
						<input type="text" id="institution" name="institution" class="validate" value="<%=institution %>">
					</div>
				</div>
					
				<div class="col s12">
					<div class=input-field>
						<label for="program">Program</label><br>
						<input type="text" id="program" name="program" value="<%=program %>">	
					</div>
				</div>
				
				
				
				<div class="col s12">
					<div class=input-field>
					<label for="start_date1" class="active">Year Started</label>
					<input id="start_date1" type="text" class="datepicker validate" name="start_date" value="<%=start_date %>">
					</div>
			     </div>
			     
				<div class="col s12">
					<div class=input-field>
					<label for="end_date1" class="active" data-error="wrong" data-success="right">Year Ended</label>
					<input id="end_date1" type="text" class="datepicker validate" name="end_date" value="<%=end_date %>">
					</div>
			     </div>
				
					
				<div class="col s12">
					<div class=input-field>
						<label for="certificate">Certificate</label><br>
						<input type="text" id="certificate" name="certificate" value="<%=certificate %>">
						
					</div>
				</div> 