<%@ include file="header.jsp" %>

 	<div class="container" id="reg-container"> 
		 <div class="card">
		       <div class="card-content">	       
		       	<div class="row center-align">
		       		<div class="col s12">
		       			<span class="card-title teal-text text-lighten-2">Log In</span>
		       		</div>
		       	</div>	
		       		       	
		       	<form action="login" method="post">
		       	<div class="row center-align">

		       			<div class="col s12">
		       				<div class=input-field>
		       					<i class="material-icons prefix">email</i>
		       					<input type="email" id="email" class="validate" name="email" data-length="50" required>
		       					<label for="email" data-error="input error" data-success="" class="active">Email</label>
		       				</div>
		       			</div>
		       			
		       			<!-- Password -->
		       			
		       			<div class="col s12">
		       				<div class=input-field>
		       					<i class="material-icons prefix">https</i>
		       					<input type="password" id="pass1" class="validate" name="pass1"  required>
		       					<label for="pass1" class="active">Password</label>
		       				</div>
		       			</div>
		       				       			
		       			
		       			<div class="col s12">
		       				<div class=input-field>	       					
		       					<input type="submit" class="btn" value="Log in">		       					
		       				</div>
		       			</div>
		       	</div>
		       			       	
		     </form>
		     
		     	<div class="row center-align">
		     	
		     		<p>Not a member yet? Signup <a href="register.jsp">here</a></p>
		     		<p>Back to <a href="index.jsp">homepage</a></p>
		     		
		     		<p>Forgot Password? Click<a href="forgotpass.jsp"> here</a></p>
		     	</div>
		     
		         	       	         
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