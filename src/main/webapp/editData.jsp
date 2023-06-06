
<%@page import="com.javawebapp.ConnectionManager"%>
<%@ page import="java.sql.*" %>

<%!
	int edit_id;
	String fname = "";
	String lname = "";
	String email = "";
	String department = "";
	String job = "";
%>


<% 
	if(request.getParameterMap().containsKey("edit_id"))
	{
	     
	    edit_id = Integer.parseInt(request.getParameter("edit_id")); 
	    
	    
		String sql = "SELECT fname,lname,department,job FROM employees WHERE id="+edit_id;
		
		Connection con = ConnectionManager.getConnection();
		
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(sql);
		rs.next();
		
		fname = rs.getString("fname");
		lname = rs.getString("lname");
		department = rs.getString("department");
		job = rs.getString("job");
	}
%>
	
	
	
	<div class="col s12">
		<div class=input-field>		
			<input type="hidden" id="edit_id" name="edit_id" value="<%=edit_id%>">
		</div>
     </div>
	
	 <div class="col s12 m6 l6">
		<div class=input-field>
			<label>First Name</label><br>
			<input type="text" id="fname" name="fname" value="<%=fname%>">
		</div>
	</div>
		
	<div class="col s12 m6 l6">
		<div class=input-field>
			<label>Last Name</label><br>
			<input type="text" id="lname" name="lname" value="<%=lname%>">
			
		</div>
	</div>
	
	
	
	
	<div class="col s12 m6 l6">
		<div class=input-field>
			<label>Department</label><br>
			<input type="text" id="department" name="department" value="<%=department%>">
		</div>
	</div>
		
	<div class="col s12 m6 l6">
		<div class=input-field>
			<label>Job Title</label><br>
			<input type="text" id="job" name="job" value="<%=job%>">
			
		</div>
	</div>
	