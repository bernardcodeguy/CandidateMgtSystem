


<%@ include file="header.jsp" %>

<%!

	String password="";
%>

<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		
		if(session.getAttribute("password") == null){
			response.sendRedirect("index.jsp");
		}
		
		password = String.valueOf(session.getAttribute("password"));
	
	%>

 	<div class="container" id="reg-container"> 
		 <div class="card">
		       <div class="card-content">	       
		       	<div class="row center-align">
		       		<div class="col s12">
		       			<span class="card-title teal-text text-lighten-2">Copy Password if any</span>
		       		</div>
		       	</div>	
		       		       	
		       	<form action="#" method="post">
		       	<div class="row center-align">
						<% if (password.equals("Not Found")){ %>
						
							<div class="col s12">
		       				<div class=input-field>
		       					<i class="material-icons prefix">email</i>
		       					<input type="text" id="password" class="validate" data-length="1000" readonly value="Sorry, user not found try again">
		       					<label for="password"  class="active">Your Password(encrypted)</label>
		       				</div>
		       			</div>
						<%}else{ %>
		       				
		       				<div class="col s12">
		       				<div class=input-field>
		       					<i class="material-icons prefix">email</i>
		       					<input type="text" id="password" class="validate" data-length="1000" readonly value="<%=password %>">
		       					<label for="password" data-error="input error" data-success="" class="active">Your Password(encrypted)</label>
		       				</div>
		       				</div>
		       			<%} %>
		       						
		       			
		       			<div class="col s12">
		       				<div class=input-field>	       					
		       					
		       					<a href="login.jsp" class="btn teal-lighten-2">Go to Login</a>
		       					<a href="forgotpass.jsp" class="btn teal-lighten-2">Back</a>		       					
		       				</div>
		       			</div>
		       	</div>
		       			       	
		     </form>
		    
		     
		         	       	         
		       </div>
		     
		</div>	 
	 
	 </div>


<%@ include file="med.jsp" %>

	<script>
	
		$(document).ready(function(){
			M.updateTextFields();
		})
        

    </script>

	

<%@ include file="footer.jsp" %>