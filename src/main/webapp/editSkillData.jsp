<%@page import="com.javawebapp.ConnectionManager"%>
<%@ page import="java.sql.*" %>

<%!
	int edit_id = 0;
	String skill_name = "";
	String yr_exp = "";
	
%>


<% 
	if(request.getParameterMap().containsKey("edit_id"))
	{
	     
		edit_id = Integer.parseInt(request.getParameter("edit_id")); 
	    
	   
		String sql = "SELECT skill_name,yr_exp FROM skill WHERE id="+edit_id;
		
		Connection con = ConnectionManager.getConnection();
		
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(sql);
		rs.next();
		
		
		skill_name = rs.getString("skill_name");
		yr_exp = rs.getString("yr_exp"); 
		
		
	}

%>




	<div class="col s12">
		<div class=input-field>		
			<input type="hidden" id="edit_id" name="edit_id" value="<%=edit_id%>">
		</div>
     </div>
			        			
		
	  <div class="col s12">
		<div class=input-field>
			<label for="skill_name" class="active">Skill</label><br>
			<input type="text" id="skill_name" name="skill_name" class="validate" value="<%=skill_name%>">
		</div>
	</div>
			
	<div class="col s12">
		<div class=input-field>
			<label for="yr_exp" class="active">Years of Experience</label><br>
			<input type="text" id="yr_exp" name="yr_exp" class="validate" value="<%=yr_exp%>">	
		</div>
	</div> 

