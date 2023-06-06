<%@ include file="header.jsp" %>


	<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		
		if(session.getAttribute("email") == null){
			response.sendRedirect("index.jsp");
		}
		
		
	
	%>
	
	
	<header>
	<!-- Navigation Bar -->	
	<div class="navbar">
 	<nav>
        <div class="nav-wrapper teal lighten-3">
        	<div class="container">
        	<a href="#!" class="brand-logo">EMS</a>
            <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>
            <ul class="right hide-on-med-and-down">
                <li><a href="profile.jsp">Profile</a></li>
                 <li><a href="sheet.jsp?page=1">Time Sheet</a></li>
                <li><a href="logout">Log out</a></li>
            </ul>
            <ul class="side-nav" id="mobile-demo">
                <li><a href="profile.jsp">Profile</a></li>
                <li><a href="sheet.jsp?page=1">Time Sheet</a></li>
                <li><a href="logout">Logout</a></li>
            </ul>
        	
        	</div>
            
        </div>
    </nav>
    </div>
    
     <section class="jumbotron" style="margin-top:20px">
        
        <div class="container grey lighten-5  z-depth-2" style="margin-top: 5px">
            <div class="row">
                <div class="col s12 desc">
                    <p class="teal-text small">
                    		<a href="dashboard.jsp">Dashboard</a>
                    <p>
                </div>
            </div>
        </div>
    </section>

</header>

<main>
	<div class="container">
		<sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://eu-cdbr-west-03.cleardb.net/heroku_526313a38b560ae" user="b0c2a51540887e" password="82fd3e43"/>
	    <sql:query var="rs" dataSource="${db}">
	    SELECT * FROM employees WHERE email=?
	    <sql:param value = "${email}" />
	    </sql:query>
	    
	    <sql:query var="cnt" dataSource="${db}">
	    SELECT COUNT(*) FROM employees WHERE email=?
	    <sql:param value = "${email}" />
	    </sql:query>
	    
	    <print:forEach items="${rs.rows}" var="employee"> 
	    	<print:set var = "empid" scope = "session" value = "${employee.id}"/>
	    	<print:set var = "fname" scope = "session" value = "${employee.fname}"/>
	    	<print:set var = "lname" scope = "session" value = "${employee.lname}"/>
	    	<print:set var = "email" scope = "session" value = "${employee.email}"/>
	    	<print:set var = "department" scope = "session" value = "${employee.department}"/>
	    	<print:set var = "job" scope = "session" value = "${employee.job}"/>
	    	<print:set var = "country" scope = "session" value = "${employee.country}"/>
			<print:set var = "gender" scope = "session" value = "${employee.gender}"/>
			<print:set var = "question" scope = "session" value = "${employee.question}"/>
			<print:set var = "answer" scope = "session" value = "${employee.answer}"/>
	    	<print:set var = "salary" scope = "session" value = "${employee.salary}"/>
	    	<print:set var = "is_approved" scope = "session" value = "${employee.is_approved}"/>
	    	<print:set var = "img" scope = "session" value = "${employee.img}"/>
	    </print:forEach>
		
		
		<div class="row c-row">
			<div class="col c-col s12 m12 l4">
			
				<div class="card-panel c-card">
					<div class="row">
						<div class="col s6">
						<print:choose>
							<print:when test="${img == null}">
								<div class="con" style="width:100px; height:100px">
									<a href="#" class="" id="upload-img"><img src="images/placeholder.png" alt="image not found" class="responsive-img circle" id="dp"></a>
								</div>
							</print:when>
							<print:otherwise>
							
								<div class="con" style="width:100px; height:100px">
									<a href="#" id="upload-img" onMouseOver="" ><img src=saveimage?id=<print:out value="${empid}"></print:out> alt="image not found" class="responsive-img circle" id="dp"></a>
								</div>	
							</print:otherwise>
						
						</print:choose>
											
						</div>
						<div class="col s6" style="margin-top:10px;">
							<p style="font-weight:bold;font-size:1.3em">
							<print:out value="${fname}"></print:out> <print:out value="${lname}"></print:out><br>
							<span style="font-weight:normal; font-size:0.7em"><print:out value="${job}"></print:out></span>
							</p>									
						</div>
					</div>
					<br>
					<br>
					<hr>
					
					
					<div class="row">
						<div class="col s4" style="font-weight:bold">
							Email Address:					
						</div>
						<div class="col s8">		
							<print:out value="${email}"></print:out><br>				
						</div>
						
					</div>
					<hr>
					<div class="row">
						<div class="col s4" style="font-weight:bold">
							Department:					
						</div>
						<div class="col s8">		
							<print:out value="${department}"></print:out><br> 				
						</div>
						
					</div>
					<hr>
					<div class="row">
						<div class="col s4" style="font-weight:bold">
							Job Title:					
						</div>
						<div class="col s8" >		
							<print:out value="${job}"></print:out><br> 				
						</div>
						
					</div>
					<hr>
					<div class="row">
						<div class="col s4" style="font-weight:bold">
							Country:					
						</div>
						<div class="col s8" >		
							<print:out value="${country}"></print:out><br> 				
						</div>
						
					</div>
					<hr>
					<div class="row">
						<div class="col s4" style="font-weight:bold">
							Gender:					
						</div>
						<div class="col s8" >		
							<print:out value="${gender}"></print:out><br> 				
						</div>
						
					</div>
					<hr>					
					<div class="row">
						<div class="col s4" style="font-weight:bold">
							Salary:					
						</div>
						<div class="col s8" >			
							<print:choose>
								<print:when test="${salary < 1}">
									<div style="font-style:italic">
										<print:out value="N/A"></print:out><br>
									</div>
								</print:when>
								<print:otherwise>
									<fmt:formatNumber value="${salary}" type="currency"></fmt:formatNumber>
								</print:otherwise>
							</print:choose> 				
						</div>
						
					</div>
					<hr>

					<div class="row">
						<div class="col s4" style="font-weight:bold">
							Status:					
						</div>
						<div class="col s8">		
							<print:choose>
								<print:when test="${is_approved <1}">
									<div style="font-style:italic">
										<print:out value="Unapproved"></print:out><br>
									</div>
								</print:when>
								<print:otherwise>
									<print:out value="Approved"></print:out><br>
								</print:otherwise>
							</print:choose>  				
						</div>
						
					</div>
					<hr>
					
				</div>
				
			</div>
			
			
			<div class="col s12 m12 l8 c-col">
				<ul class="collapsible c-card" class="active">
				  <li >
				    <div class="collapsible-header"><i class="material-icons">settings</i>Password Settings</div>
				    <div class="collapsible-body">
				    	<form action="" method="post" id="update-pass">
					       	<div class="row center-align">
									
									<div class="col s12">
					       				<div class=input-field>
					       					<input type="hidden" id="empid" class="validate" name="empid"  value="${empid}" required>
					       				</div>
					       			</div>
									
					       			<div class="col s12">
					       				<div class=input-field>
					       					<i class="material-icons prefix">https</i>
					       					<input type="password" id="pass1" class="validate" name="pass1"  required>
					       					<label for="pass1" class="active">New Password</label>
					       				</div>
					       			</div>
					       			
					       			<!-- Password -->
					       			
					       			<div class="col s12">
					       				<div class=input-field>
					       					<i class="material-icons prefix">https</i>
					       					<input type="password" id="pass2" class="validate" name="pass2"  required>
					       					<label for="pass2" class="active">Confirm Password</label>
					       				</div>
					       			</div>
					       				       			
					       			
					       			<div class="col s12">
					       				<div class=input-field>	       					
					       					<a href="#" class="submit btn" id="save-pass"> Save Changes</a>		       					
					       				</div>
					       			</div>
					       	</div>      	
		     		</form>
				    </div>
				    
				  </li>
				  <li>
				    <div class="collapsible-header active"><i class="material-icons">person</i>Profile Settings</div>
				    <div class="collapsible-body">
				    
				    	<form action="register" method="post" id="update-pro">
		       			<div class="row center-align">
		       			
		       			<div class="col s12">
		       				<div class=input-field>
		       					<input type="hidden" id="empid" class="validate" name="empid"  value="${empid}" required>
		       				</div>
					    </div>
		       			
		       			<div class="col s12 m6 l6">
		       				<div class=input-field>
		       					<i class="material-icons prefix">create</i>
		       					<input type="text" id="fname" name="fname" class="validate"  value="${fname}" required>
		       					<label for="fname" class="active">First Name</label>
		       				</div>
		       			</div>
		       			
		       			<div class="col s12 m6 l6">
		       				<div class=input-field>
		       					<i class="material-icons prefix">create</i>
		       					<input type="text" id="lname" name="lname" class="validate" value="${lname}"required>
		       					<label for="lname" class="active">Last Name</label>
		       				</div>
		       			</div>
		       			
		       			
		       			<!-- Department/Role -->
		       			
		       			<div class="col s12 m6 l6">
		       				<div class=input-field>
		       					<i class="material-icons prefix">domain</i>
		       					<input type="text" id="department" name="department" class="validate" value="${department}" required>
		       					<label for="depart" class="active">Department</label>
		       				</div>
		       			</div>
		       			
		       			<div class="col s12 m6 l6">
		       				<div class=input-field>
		       					<i class="material-icons prefix">create</i>
		       					<input type="text" id="job" name="job" value="${job}" required>
		       					<label for="job" class="active">Job Title</label>
		       				</div>
		       			</div>
		       			
		       			
		       			<div class="col s12 m6 l6">
                                        
                                <div class="row">
                                 <div class="col s1" style="margin-top: 15px;">                                           
                                     <i class="small material-icons prefix">location_on</i>                                             
                                 </div>
                                 <div class="col s11 ">
                                    <div class=input-field>
                                    
                                    <print:choose>
                                    	<print:when test="${country eq 'Germany'}">
                                    	
                                    		<select class="browser-default grey lighten-2" id="country" name="country" required>
			                                    <option value="Germany" selected>Germany</option>
			                                    <option value="India">India</option>
			                                    <option value="UK">UK</option>
			                                </select>
                                    	
                                    	</print:when>                                    
                                    </print:choose>
                                    <print:choose>
                                    	<print:when test="${country eq 'India'}">
                                    	
                                    		<select class="browser-default grey lighten-2" id="country" name="country" required>
			                                    <option value="Germany" >Germany</option>
			                                    <option value="India" selected>India</option>
			                                    <option value="UK">UK</option>
			                                </select>
                                    	
                                    	</print:when>                                    
                                    </print:choose>
                                     <print:choose>
                                    	<print:when test="${country eq 'UK'}">
                                    	
                                    		<select class="browser-default grey lighten-2" id="country" name="country" required>
			                                    <option value="Germany" >Germany</option>
			                                    <option value="India" >India</option>
			                                    <option value="UK" selected>UK</option>
			                                </select>
                                    	
                                    	</print:when>                                    
                                    </print:choose>
                                    
                                    <print:choose>
                                    	<print:when test="${country eq null}">
                                    	
                                    		<select class="browser-default grey lighten-2" id="country" name="country" required>
                                    			<option value="" disabled selected>Country</option>
			                                    <option value="Germany" >Germany</option>
			                                    <option value="India" >India</option>
			                                    <option value="UK">UK</option>
			                                </select>
                                    	
                                    	</print:when>                                    
                                    </print:choose>
	                                  
                            		</div>     
                                 </div> 
                                    
                                    
                                </div>                                         
                       </div>
                       
                       <div class="col s12 m6 l6">
                                        
                                <div class="row">
                                 <div class="col s1" style="margin-top: 15px;">                                           
                                     <i class="small material-icons prefix">wc</i>                                             
                                 </div>
                                 <div class="col s11 ">
                                    <div class=input-field>
                                    
                                    <print:choose>
                                    	<print:when test="${gender eq 'Male'}">
                                    	
                                    		<select class="browser-default grey lighten-2" id="gender" name="gender" required>
			                                    <option value="Male" selected>Male</option>
			                                    <option value="Female">Female</option>
			                                    <option value="Other">Other</option>
			                                </select>
                                    	
                                    	</print:when>                                    
                                    </print:choose>
                                    <print:choose>
                                    	<print:when test="${gender eq 'Female'}">
                                    	
                                    		<select class="browser-default grey lighten-2" id="gender" name="gender" required>
			                                    <option value="Male" >Male</option>
			                                    <option value="Female" selected>Female</option>
			                                    <option value="Other">Other</option>
			                                </select>
                                    	
                                    	</print:when>                                    
                                    </print:choose>
                                     <print:choose>
                                    	<print:when test="${gender eq 'Other'}">
                                    	
                                    		<select class="browser-default grey lighten-2" id="gender" name="gender" required>
			                                    <option value="Male" >Male</option>
			                                    <option value="Female" >Female</option>
			                                    <option value="Other" selected>Other</option>
			                                </select>
                                    	
                                    	</print:when>                                    
                                    </print:choose>
                                    <print:choose>
                                    	<print:when test="${gender eq null}">
                                    	
                                    		<select class="browser-default grey lighten-2" id="gender" name="gender" required>
                                    			<option value="" disabled selected>Gender</option>
			                                    <option value="Male" >Male</option>
			                                    <option value="Female" >Female</option>
			                                    <option value="Other">Other</option>
			                                </select>
                                    	
                                    	</print:when>                                    
                                    </print:choose>
	                                  
                            		</div>     
                                 </div> 
                                    
                                    
                                </div>                                         
                       		</div>
                       		<div class="col s12 m6 l6">
                                        
                                <div class="row">
                                 <div class="col s1" style="margin-top: 15px;">                                           
                                     <i class="small material-icons prefix">battery_unknown</i>                                             
                                 </div>
                                 <div class="col s11 ">
                                    <div class=input-field>
                                    
                                    <print:choose>
                                    	<print:when test="${question eq 'What is the name of your uncle?'}">
                                    	
                                    		<select class="browser-default grey lighten-2" id="question" name="question" >
                                              <option value="What is the name of your uncle?" selected>What is the name of your uncle?</option>
                                              <option value="What high school did you attend?">What high school did you attend?</option>
                                              <option value="What was your favorite food as a child?">What was your favorite food as a child?</option>
                                            </select>
                                    	
                                    	</print:when>                                    
                                    </print:choose>
                                    <print:choose>
                                    	<print:when test="${question eq 'What high school did you attend?'}">
                                    	
                                    		<select class="browser-default grey lighten-2" id="question" name="question" >
                                              <option value="What is the name of your uncle?">What is the name of your uncle?</option>
                                              <option value="What high school did you attend?" selected>What high school did you attend?</option>
                                              <option value="What was your favorite food as a child?">What was your favorite food as a child?</option>
                                            </select>
                                    	
                                    	</print:when>                                    
                                    </print:choose>
                                     <print:choose>
                                    	<print:when test="${question eq 'What was your favorite food as a child?'}">
                                    	
                                    		<select class="browser-default grey lighten-2" id="question" name="question" >
                                              <option value="What is the name of your uncle?">What is the name of your uncle?</option>
                                              <option value="What high school did you attend?" >What high school did you attend?</option>
                                              <option value="What was your favorite food as a child?" selected>What was your favorite food as a child?</option>
                                            </select>
                                    	
                                    	</print:when>                                    
                                    </print:choose>
                                    
                                    <print:choose>
                                    	<print:when test="${question eq null}">
                                    	
                                    		<select class="browser-default grey lighten-2" id="question" name="question" required>
                                              <option value="" disabled selected>Security Question</option>
                                              <option value="What is the name of your uncle?">What is the name of your uncle?</option>
                                              <option value="What high school did you attend?">What high school did you attend?</option>
                                              <option value="What was your favorite food as a child?">What was your favorite food as a child?</option>
                                            </select>
                                    	
                                    	</print:when>                                    
                                    </print:choose>
	                                  
                            		</div>     
                                 </div> 
                                    
                                    
                                </div>                                         
                       </div>
                       
                       <div class="col s12 m6 l6">
                           
                                    
                               <print:choose>
                               	<print:when test="${answer eq ''}">
                               	
                               		
				       				<div class=input-field>
				       					<i class="material-icons prefix">check</i>
				       					<input type="text" id="answer" name="answer" class="validate" value="Not Provided"required>
				       					<label for="answer" class="active">Answer</label>
				       				</div>
		       			
                               		
                               	</print:when> 
                               	<print:otherwise>
                               		<div class=input-field>
				       					<i class="material-icons prefix">check</i>
				       					<input type="text" id="answer" name="answer" class="validate" value="${answer}"required>
				       					<label for="answer" class="active">Answer</label>
				       				</div>
                               	
                               	</print:otherwise>                                   
                               </print:choose>
                                                 
	                                  
                         </div>     
                                
                                    
                                    
                                                                     
                       		
		       			
		       			<div class="col s12">
		       				<div class=input-field>	       					
		       					<a href="#" class="submit btn" id="save-profile"> Save Changes</a>		       					
		       				</div>
					   </div>
		       		</div>
		       			       	
		     	</form>

		</div>
			
			</ul>
				
		</div>
	  </div>

	</div>

	<div class="fixed-action-btn">
		  <a class="btn-floating btn-large black">
		    <i class="large material-icons">menu</i>
		  </a>
		  <ul>
		    <li><a class="btn-floating tooltipped green" data-position="left" data-delay="50" data-tooltip="Go to education page" href="edu.jsp"><i class="material-icons">school</i></a></li>
		    <li><a class="btn-floating tooltipped yellow darken-1" data-position="left" data-delay="50" data-tooltip="Go to skill page" href="skill.jsp"><i class="material-icons">stars</i></a></li>
		  </ul>
	</div>
</main>



<!-- The footer for the webpage -->
<footer class="page-footer teal lighten-3">
      <div class="container">
        <div class="row">
          <div class="col l6 s12">
            <h5 class="black-text">Social Media</h5>
            <i class="fa-brands fa-twitter-square fa-2xl"></i>
			<i class="fa-brands fa-facebook-square fa-2xl"></i>
			<i class="fa-brands fa-instagram-square fa-2xl"></i>
			<i class="fa-brands fa-github-square fa-2xl"></i>
          </div>
          <div class="col l4 offset-l2 s12">
            <h5 class="black-text">Contact</h5>
            <ul>
              <li><a class="black-text text-lighten-3" href="#">Kmtech Ltd</a></li>
              <li><a class="black-text text-lighten-3" href="#">128 City Rd, London EC1V 2NX</a></li>
              <li><a class="black-text text-lighten-3" href="#">Email: kmohideen@kmtec.co.uk</a></li>
              <li><p>Website: <a href="https://www.kmtec.co.uk">www.kmtec.co.uk</a></p></li>
              <li class="">
            	<div class="" style="width:50px; height:50px; margin-left:60px">
	<img src="images/kmtec_logo.png" class="responsive-img circle">
	</div>
            </li>
            </ul>
          </div>
        </div>
      </div>
      <div class="footer-copyright">
        <div class="container center-align black-text">
        © 2022 Copyright
        </div>
      </div>
</footer>
		
	
<%@ include file="med.jsp" %>

	<script>
	
	
		$(document).ready(function(){
			$(".button-collapse").sideNav();
			$('.collapsible').collapsible();
 			
			$('#modal1').modal();

			 $(document).on('click', '#save-pass', function(){
				 
				 var id = $("#empid").val();
				 var pass1 = $("#pass1").val();
				 var pass2 = $("#pass2").val();
				 
				 if(pass1 != pass2){
					 alert("Password mismatches");
				 }else{
					 
					  $.ajax({

			          url: "savePassData.jsp",
			          type: "POST",
			          data:$("#update-pass").serialize(),
			          success:function(data){
			        	 window.location.href = "profile.jsp";
			        	 //window.location.reload(true);
			          }
			     });
					  
			    }
			});
			 
			 $(document).on('click', '#save-profile', function(){
				 
				 var id = $("#empid").val();
				 var fname = $("#fname").val();
				 var lname = $("#lname").val();
				 var department = $("#department").val();
				 var job = $("#job").val();
				 var country = $("#country").val();
				 var gender = $("#gender").val();
				 var question = $("#question").val();
				 var answer = $("#answer").val();
				 
				 
				  if(fname == '' ||lname == '' || department == '' ||job == '' || question == '' ||answer == ''){
					 alert("Field(s) Empty error!!");
				 }else{
					 
					  $.ajax({

			          url: "saveProfileData.jsp",
			          type: "POST",
			          data:$("#update-pro").serialize(),
			          success:function(data){			        	 
			        	 window.location.href = "profile.jsp";
			        	 //window.location.reload(true);
			          }
			     });
					  
			    } 
			});
			
			
			 
			$(document).on('click', '#upload-img', function(){
				$('#modal1').modal('open');			    
			}); 
			 			 
		})
        
    </script>


<%@ include file="footer.jsp" %>



<!-- Modal for Adding Profile Photo-->
	  <div id="modal1" class="modal modal-fixed-footer" style="height:40%; width:50%">
	  	<form action="saveimage" method="post" enctype="multipart/form-data">
		    <div class="modal-content" >
		      <h4 class="center-align">ADD PROFILE PHOTO</h4>
		      <p class="center-align red-text">Square and (512 * 512 or less dimension) Images are recommended for better display</p>
		      	<div class="row center-align" id="">  
		      	 
		      	<div class="col s12">
					<div class=input-field>		
						<input type="hidden" id="empid" name="empid" value="${empid}">
					</div>
			     </div>   						 
					<div class="col s12">
						<div class = "file-field input-field" >
		                  <div class = "btn">
		                     <span>Browse</span>
		                     <input type = "file" name="img" />
		                  </div>                  
		                  <div class = "file-path-wrapper">
		                     <input class = "file-path validate" type = "text"
		                        placeholder = "Upload file" name="img" required/>
		                  </div>
		               </div>   
					</div>  
					<div class="col s12">
				      <div class=input-field>	       					
				       	<input type="submit" class="btn" value="Save Changes">		       					
				     </div>  	
		      	</div>
		      
		    </div>
		    </div>
	    </form>
 	</div>