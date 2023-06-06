<%@ include file="header.jsp" %>
<%@ page import="com.javawebapp.dao.TimeInDao" %>

	<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		
		if(session.getAttribute("email") == null){
			response.sendRedirect("index.jsp");
		}
		
		
		String email = String.valueOf(session.getAttribute("email"));
		
		int id = TimeInDao.getUserId(email);
		
		
		TimeInDao.signIn(id);
	
	%>


	<!-- Navigation Bar -->	
	<div class="navbar">
 	<nav>
        <div class="nav-wrapper teal lighten-3">
        	<div class="container">
        	<a href="#!" class="brand-logo">CMS</a>
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
    
    
    <div class="container">
    	<div class="row c-row">
    		<div class="col s12 l4 c-col">
    			<div class="card c-card">
    			
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
				    	<print:set var = "salary" scope = "session" value = "${employee.salary}"/>
				    	<print:set var = "is_approved" scope = "session" value = "${employee.is_approved}"/>
				    </print:forEach>
				    
    				<div class="card-image">
			         <img src="images/bg.jpg">
			         <span class="card-title white-text">
			         		       		
	      					<print:out value="${fname} "></print:out>
		         			<print:out value="${lname} "></print:out>
		         			
		         							
						   		         	
			         </span>
			         <a class="btn-floating halfway-fab waves-effect waves-light teal lighten-3 edit_data" id="${empid}"><i class="material-icons">edit</i></a>
			       </div>
			       <div class="card-content">
			         	<p class=" black-text">
			         	<i class="material-icons small">person</i> 
			         	<print:out value="${fname} "></print:out> 
			         	<print:out value="${lname} "></print:out>
			         	 </p>
			         	
			         	<p class=" black-text">
			         	<i class="material-icons small">email</i> 
			         	<print:out value="${email} "></print:out>
			            </p>
			         	
			         	<p class=" black-text">
			         	<i class="material-icons small">domain</i> 
			         	<print:out value="${department} "></print:out>
			         	 </p>
			         	
			         	<p class=" black-text">
			         	<i class="material-icons small">work</i> 
			         	<print:out value="${job} "></print:out>
			         	 </p>
			         	 
			         	 <p class=" black-text">
			         	<i class="material-icons small">location_on</i> 
			         	<print:out value="${country} "></print:out>
			         	 </p>
			         	 
			         	  <p class=" black-text">
			         	<i class="material-icons small">wc</i> 
			         	<print:out value="${gender} "></print:out>
			         	 </p>
			         	
			         	<p class=" black-text">
			         	<i class="material-icons small">monetization_on</i> 
			         	<fmt:formatNumber value="${salary}" type="currency"></fmt:formatNumber>			         	
			         	 </p>
			         	
			         	<print:choose>
			         		<print:when test="${is_approved>0}">
			         			<p class=" green-text center-align">
					         	<print:out value="Approved">
					         	</print:out> </p>
			         		
			         		</print:when>
			         		<print:otherwise>
			         			<p class="center-align red-text" style="font-style: italic">
					         	<print:out value="Pending approval">
					         	</print:out> </p>
			         		</print:otherwise>
			         	</print:choose>         			         	
			       </div>
    			
    			</div>
    		
    		</div>
    		
    		<div class="col s12 l8 c-col" style="height: 70vh;overflow-y: hide;scrollbar-width: thin;" onmouseover="this.style.overflow='auto'" onmouseout="this.style.overflow='hidden'">
    
				   <ul class="collapsible c-card">
				    <li>
				    <sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://eu-cdbr-west-03.cleardb.net/heroku_526313a38b560ae" user="b0c2a51540887e" password="82fd3e43"/>
				    <sql:query var="rs" dataSource="${db}">
				    SELECT * FROM education WHERE emp_id=?
				    <sql:param value="${empid}" />
				    </sql:query>
				      <div class="collapsible-header teal lighten-3"><i class="material-icons">school</i>Education</div>
				      <div class="collapsible-body">
				            		
				      		<table>
						        <thead>
						          <tr>
						          	  <th>#</th>
						              <th>Institution</th>
						              <th>Start Date</th>
						              <th>End Date</>
						              <th>Certificate/Award</th>
						          </tr>
						        </thead>
						
				      			<tbody>
				      				<print:choose>
								        <print:when test="${rs.rowCount < 1}">
								        	<tr>
								        		<td style="font-style:italic"> <print:out value="Nothing added yet"></print:out></td>
								        		<td  style="font-style:italic"> <print:out value="Nothing added yet"></print:out></td>
								        		<td  style="font-style:italic"> <print:out value="Nothing added yet"></print:out></td>
								        		<td  style="font-style:italic"> <print:out value="Nothing added yet"></print:out></td>
								        		<td  style="font-style:italic"> <print:out value="Nothing added yet"></print:out></td>
								        	</tr>
									           
								        </print:when>
								        <print:otherwise>							        	
						      				<print:set var="count" value="${1}" scope="session"/>
						      				<print:forEach items="${rs.rows}" var="education">
						      					<tr>
						      						<td>
						      							<print:out value="${count}"></print:out>
						      						</td>
						      						<td>
						      							<print:out value="${education.institution}"></print:out>
						      						</td>
						      						<td>
						      							<print:out value="${education.start_date}"></print:out>
						      						</td>
						      						<td>
						      							<print:out value="${education.end_date}"></print:out>
						      						</td>
						      						<td>
						      							<print:out value="${education.certificate}"></print:out>
						      						</td>
						      					</tr>
						      					<print:set var="count" value="${count + 1}" />
						      				</print:forEach>
								        </print:otherwise>
								     </print:choose>
				      			</tbody>
				      			</table>			      	
				      
				      </div>
				    </li>
				     <!-- Second Collapse toggle -->
				     <li>
				     	<sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://eu-cdbr-west-03.cleardb.net/heroku_526313a38b560ae" user="b0c2a51540887e" password="82fd3e43"/>
					    <sql:query var="rs" dataSource="${db}">
					    SELECT * FROM skill WHERE emp_id=?
					    <sql:param value="${empid}" />
					    </sql:query>
					    <div class="collapsible-header active teal lighten-3"><i class="material-icons">create</i>Skill</div>
					    <div class="collapsible-body">
					    
					    <table >
						        <thead>
						          <tr>
						          	  <th>#</th>
						              <th>Skill</th>
						              <th>Years of Experience</th>
						          </tr>
						        </thead>					
				      			<tbody>
				      				
										<print:choose>
								        <print:when test="${rs.rowCount < 1}">
								        	<tr>
								        		<td style="font-style:italic"> <print:out value="Nothing added yet"></print:out></td>
								        		<td  style="font-style:italic"> <print:out value="Nothing added yet"></print:out></td>
								        		<td  style="font-style:italic"> <print:out value="Nothing added yet"></print:out></td>
								        	</tr>
								        	
								           
								        </print:when>
								        <print:otherwise>
								            <print:set var="coun" value="${1}" scope="session"/>								
						      				<print:forEach items="${rs.rows}" var="skill" >
						      					<tr>
						      						<td>
						      							<print:out value="${coun}"></print:out>
						      						</td>
						      						<td>
						      							<print:out value="${skill.skill_name}"></print:out>
						      						</td>
						      						<td>
						      							<print:out value="${skill.yr_exp} years"></print:out>
						      						</td>
						      					</tr>
						      					<print:set var="coun" value="${coun + 1}" />
						      				</print:forEach>
								        </print:otherwise>
								    </print:choose>
				      			</tbody>
				      	</table>
					    
					    </div>
					  </li>
					  </ul>
    		
    		</div>    		
    	</div>
    	
    	<div class="fixed-action-btn">
		  <a class="btn-floating btn-large black">
		    <i class="large material-icons">menu</i>
		  </a>
		  <ul>
		    <li><a class="btn-floating tooltipped green" data-position="left" data-delay="50" data-tooltip="Go to education page" href="edu.jsp"><i class="material-icons">school</i></a></li>
		    <li><a class="btn-floating tooltipped yellow darken-1" data-position="left" data-delay="50" data-tooltip="Go to skills page" href="skill.jsp"><i class="material-icons">stars</i></a></li>
		  </ul>
		</div>
    	
    </div>
    
    
     		 
    
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
	document.addEventListener('DOMContentLoaded', function() {
	    var elems = document.querySelectorAll('.fixed-action-btn');
	    var instances = M.FloatingActionButton.init(elems, options);
	  });
	
		$(document).ready(function(){
			$(".button-collapse").sideNav();
			$('.collapsible').collapsible();
			$('#modal1').modal();
 			
			 
			 $(document).on('click','.edit_data', function() {
				
				 var edit_id = $(this).attr('id');
				 $.ajax({

			          url: "editData.jsp",
			          type: "POST",
			          data:{edit_id:edit_id},
			          success:function(data){
			        	  
			        	  $('#edit-creds').html(data);
			        	   $('#modal1').modal('open');
			          }


			     });
 
				 
			});
			 
			 $(document).on('click', '#update', function(){
				 $.ajax({

			          url: "saveData.jsp",
			          type: "POST",
			          data:$("#update_form").serialize(),
			          success:function(data){
			        	 $('#modal1').modal('close');
			        	 window.location.href = "dashboard.jsp";
			        	 //window.location.reload(true);
			          }
			     });
				 
				

			});
			 
			 
		})
        
    </script>

<%@ include file="footer.jsp" %>


<!-- Modal for Editing Employee Credentials-->
		  <div id="modal1" class="modal modal-fixed-footer" style="width: 50%; height:40%">
		  	<form method="POST" id="update_form" action="#">
		    <div class="modal-content" >
		      <h4 class="center-align">EDIT DETAILS</h4>
		      	<div class="row center-align" id="edit-creds">
		      	
		      	
		      	</div>
		      
		    </div>
		    <div class="modal-footer">
		      <a href="" class="modal-close waves-effect waves-light btn-flat red-text">Close</a>
		      <a href="" class="waves-effect waves-light btn-flat" id="update">Update</a>
		    </div>
		    </form>
		  </div>


