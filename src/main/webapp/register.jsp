<%@ include file="header.jsp" %>

	 <div class="container" id="reg-container1"> 
		 <div class="card">
		       <div class="card-content">	       
		       	<div class="row center-align">
		       		<div class="col s12">
		       			<span class="card-title teal-text text-lighten-2">Sign Up</span>
		       		</div>
		       	</div>	
		       		       	
		       	<form action="register" method="post">
		       	<div class="row center-align">
		       		
		       			<div class="col s12 m6 l6">
		       				<div class=input-field>
		       					<i class="material-icons prefix">create</i>
		       					<input type="text" id="fname" name="firstname" class="validate"  required>
		       					<label for="fname" class="active">First Name</label>
		       				</div>
		       			</div>
		       			
		       			<div class="col s12 m6 l6">
		       				<div class=input-field>
		       					<i class="material-icons prefix">create</i>
		       					<input type="text" id="lname" name="lastname" class="validate" required>
		       					<label for="lname" class="active">Last Name</label>
		       				</div>
		       			</div>
		       			
		       			<div class="col s12">
		       				<div class=input-field>
		       					<i class="material-icons prefix">email</i>
		       					<input type="email" id="email" name="email" class="validate" required>
		       					<label for="email" data-error="input error" data-success="" class="active">Email</label>
		       				</div>
		       			</div>
		       			
		       			<!-- Password -->
		       			
		       			<div class="col s12 m6 l6">
		       				<div class=input-field>
		       					<i class="material-icons prefix">https</i>
		       					<input type="password" id="pass1" name="pass1" class="validate" required>
		       					<label for="pass1" class="active">Password</label>
		       				</div>
		       			</div>
		       			
		       			<div class="col s12 m6 l6">
		       				<div class=input-field>
		       					<i class="material-icons prefix">https</i>
		       					<input type="password" id="pass2" name="pass2" class="validate" required>
		       					<label for="pass2" class="active">Confirm Password</label>
		       				</div>
		       			</div>
		       			
		       			<div class="col s12">
		       				<div class=input-field>
		       					<i class="material-icons prefix">phone</i>
		       					<input type="tel" id="phone" name="phone" class="validate" required>
		       					<label for="phone" class="active">Phone Number</label>
		       				</div>
		       			</div>
		       			
		       			<div class="col s12">
		       				<div class=input-field>
		       					<i class="material-icons prefix">flag</i>
		       					<input type="text" id="country" name="country" class="validate" required>
		       					<label for=""country"" class="active">Nationality</label>
		       				</div>
		       			</div>
		       			
		       			<div class="col s12 m6 l6">
		       				<div class=input-field>
		       					<i class="material-icons prefix">card_travel</i>
		       					<input type="text" id="visa" name="visa" class="validate" required>
		       					<label for="visa" class="active">Visa Status</label>
		       				</div>
		       			</div>
		       			
		       			<div class="col s12 m6 l6">
		       			
							<div class=input-field>
							<i class="material-icons prefix">date_range</i>
							<input id="valid" type="text" class="datepicker" name="valid">
							<label for="valid">Valid Until</label>
							</div>
					     </div>
		       			
		       			
		       			
		       			<!-- Department/Role -->
		       			
		       			<div class="col s12 m6 l6">
		       				<div class=input-field>
		       					<i class="material-icons prefix">domain</i>
		       					<input type="text" id="depart" name="department" class="validate" required>
		       					<label for="depart" class="active">Domain</label>
		       				</div>
		       			</div>
		       			
		       			<div class="col s12 m6 l6">
		       				<div class=input-field>
		       					<i class="material-icons prefix">create</i>
		       					<input type="text" id="job" name="job" required>
		       					<label for="job" class="active">Job Title</label>
		       				</div>
		       			</div>
		       			
		       			<div class="col s12">
							<div class = "file-field input-field" >
			                  <div class = "btn">
			                     <span>Browse</span>
			                     <input type = "file" name="resume" />
			                  </div>                  
			                  <div class = "file-path-wrapper">
			                     <input class = "file-path validate" type = "text"
			                        placeholder = "Upload Resume" name="resume" required/>
			                  </div>
			               </div>   
						</div>  
		       			
		       		
		       			
		       			<div class="col s12">
                                        
                                <div class="row">
                                 <div class="col s1" style="margin-top: 15px;">                                           
                                     <i class="small material-icons prefix">wc</i>                                             
                                 </div>
                                 <div class="col s11 ">
                                    <div class=input-field> 
                                            <select class="browser-default grey lighten-2" id="gender" name="gender" required>
                                              <option value="" disabled selected>Gender</option>
                                              <option value="Male">Male</option>
                                              <option value="Female">Female</option>
                                              <option value="Other">Other</option>
                                            </select>
                                   </div>     
                                 </div> 
                                    
                                    
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
                       
                       <div class="col s12" id="typetwo">
                       	
                       		<div class=input-field>
		       					<i class="material-icons prefix">check</i>
		       					<input type="text" id="answer" name="answer" required>
		       					<label for="answer" class="active">Answer</label>
		       				</div>
                              
                       </div>
		       			
		       			
		       			<div class="col s12">
		       				<div class=input-field>	       					
		       					<input type="submit" id="submit-btn" class="btn" value="Register">		       					
		       				</div>
		       			</div>
		       	</div>
		       			       	
		     </form>
		     
		     	<div class="row center-align">
		     	
		     		<p>Already a member? Login <a href="login.jsp">here</a></p>
		     		<p>Back to <a href="index.jsp">homepage</a></p>
		     	</div>
		     
		         	       	         
		       </div>
		     
		</div>	 
	 
	 </div>



<%@ include file="med.jsp" %>

	<script>
	
		$(document).ready(function(){
			//M.updateTextFields();
			$("#typetwo").hide();
			$('.datepicker').pickadate({
	        	"format": "yyyy-mm-dd",
	            selectMonths: true, // Creates a dropdown to control month
	            selectYears: 200, // Creates a dropdown of 15 years to control year,
	            today: 'Today',
	            clear: 'Clear',
	            close: 'Ok',
	           
	        });
			
			
			$("#question").change(function(){
				var q = $("#question").val();
				if(q != ''){
					$("#typetwo").show();
				}else{
					$("#typetwo").hide();
			}
				
				$(document).on('click','#submit-btn', function() {


		             var answer = $("#answer").val();
		             if(answer == ''){
		            	 alert("Security answer not given");
		             }		             
		             
		        });
				
					
				 	
		});
        
		});
    </script>


<%@ include file="footer.jsp" %>