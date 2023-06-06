<%@ include file="header.jsp" %>

 	<div class="container" id="reg-container"> 
		 <div class="card">
		       <div class="card-content">	       
		       	<div class="row center-align">
		       		<div class="col s12">
		       			<span class="card-title teal-text text-lighten-2">Confirm Identity</span>
		       		</div>
		       	</div>	
		       		       	
		       	<form action="security" method="post">
		       	<div class="row center-align">

		       			<div class="col s12">
		       				<div class=input-field>
		       					<i class="material-icons prefix">email</i>
		       					<input type="email" id="email" class="validate" name="email" data-length="50" required>
		       					<label for="email" data-error="input error" data-success="" class="active">Email(Your email used for registration)</label>
		       				</div>
		       			</div>
		       			
		       			<div class="col s12">
                                        
                                <div class="row">
                                 <div class="col s1" style="margin-top: 15px;">                                           
                                     <i class="small material-icons prefix">battery_unknown</i>                                             
                                 </div>
                                 <div class="col s11 ">
                                    <div class=input-field> 
                                            <select class="browser-default grey lighten-2" id="question" name="question" required>
                                              <option value="" disabled selected>Security Question</option>
                                              <option value="What is the name of your uncle?">What is the name of your uncle?</option>
                                              <option value="What high school did you attend?">What high school did you attend?</option>
                                              <option value="What was your favorite food as a child?">What was your favorite food as a child?</option>
                                            </select>
                                   </div>     
                                 </div> 
                                    
                                    
                                </div>                                         
                       		</div>
                       		<div class="col s12" >
                       	
                       		<div class=input-field>
		       					<i class="material-icons prefix">check</i>
		       					<input type="text" id="answer" name="answer" required>
		       					<label for="answer" class="active">Answer</label>
		       				</div>
                              
                       </div>
		       				       			
		       			
		       			<div class="col s12">
		       				<div class=input-field>	       					
		       					<input type="submit" class="btn" value="Confirm">		       					
		       				</div>
		       			</div>
		       	</div>
		       			       	
		     </form>
		     
		     	<div class="row center-align">
		     	
		     		<p>Back to <a href="login.jsp">login</a></p>
		     		<p>Back to <a href="index.jsp">homepage</a></p>
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