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
	<!-- First container -->
	<div class="container" style="height: 40vh;overflow-y: auto; scrollbar-width: auto;" onmouseover="this.style.overflow='auto'" onmouseout="this.style.overflow='hidden'">
		<sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://eu-cdbr-west-03.cleardb.net/heroku_526313a38b560ae" user="b0c2a51540887e" password="82fd3e43"/>
		<sql:query var="rs" dataSource="${db}">
		SELECT * FROM employees WHERE email=?
		<sql:param value = "${email}" />
		</sql:query>
			
		<print:forEach items="${rs.rows}" var="employee"> 
			<print:set var = "empid" scope = "session" value = "${employee.id}"/>	    	
		</print:forEach>
				
		<sql:query var="rs" dataSource="${db}">
		SELECT * FROM skill WHERE emp_id=?
		<sql:param value = "${empid}" />
		</sql:query> 
		
		<ul class="collection">
		<li class="collection-item avatar">
			<i class="material-icons circle">stars</i>
			<span class="title" style="font-weight: bold">SKILLS</span>
			<p>Your expertise</p>
			<a href="#modal1" class="btn-floating secondary-content waves-effect waves-circle modal-trigger" id="${empid}"><i class="material-icons">add</i></a>
		</li>
		
		
		<print:forEach items="${rs.rows}" var="skill"> 
		
		<li class="collection-item avatar">
			<p class="title"><span style="font-weight:bold">Skill:</span>  <print:out value="${skill.skill_name}"></print:out></p>
			<p class="title"><span style="font-weight:bold">Years of Experience:</span>  <print:out value="${skill.yr_exp}"></print:out></p>
			<a href="#" class="secondary-content edit_data" id="${skill.id}"><i class="material-icons">edit</i></a>
			<a href="#" class="secondary-content red-text del_data" style="margin-top: 30px;" id="${skill.id}"><i class="material-icons">delete</i></a>
		</li> 
				
		</print:forEach>
		
		</ul>
		
		 
	</div>
	
	<div class="container">
		<div class="card-panel teal lighten-3">
            <div class="carousel carousel-slider center hide-on-med-and-down" style="max-height:15vh">
			   <div class="carousel-item white-text" href="#one!">
			     <h2 class="flow-text">When love and skill work together, expect a masterpiece.</h2>
			     <p class="white-text flow-text">John Ruskin</p>
			   </div>
			   <div class="carousel-item  white-text" href="#two!">
			     <h2 class="flow-text">It is possible to fly without motors, but not without knowledge and skill.</h2>
			     <p class="white-text flow-text"> Wilbur Wright</p>
			   </div>
			   <div class="carousel-item white-text" href="#three!">
			     <h2 class="flow-text">Every skill you acquire doubles your odds of success.</h2>
			     <p class="white-text flow-text">Scott Adams </p>
			   </div>
			   <div class="carousel-item  white-text" href="#four!">
			     <h2 class="flow-text">Skill and confidence are an unconquered army.</h2>
			     <p class="white-text flow-text">George Herbert</p>
			   </div>
  		</div>
  		
  			<div class="hide-on-large-only">
  				<h5 class="white-text center-align">Education is what remains after one has forgotten what one has learned in school.</h5>
			     <p class="white-text center-align">Albert Einstein</p>
  			</div>
      </div> 
      
	</div>
	
	<div class="fixed-action-btn">
		  <a class="btn-floating btn-large black">
		    <i class="large material-icons">menu</i>
		  </a>
		  <ul>
		    <li><a class="btn-floating tooltipped green" data-position="left" data-delay="50" data-tooltip="Go to dashboard page" href="dashboard.jsp"><i class="material-icons">dashboard</i></a></li>
		    <li><a class="btn-floating tooltipped yellow darken-1" data-position="left" data-delay="50" data-tooltip="Go to education page" href="edu.jsp"><i class="material-icons">school</i></a></li>
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


<!-- Javascript dependency file -->
<%@ include file="med.jsp" %>


<script type="text/javascript">
	
$(document).ready(function(){
	//M.updateTextFields();
	
	$('#modal1').modal({
	      dismissible: false, // Modal cannot be closed by clicking anywhere outside
	    });
	
	$('#modal2').modal({
	      dismissible: false, // Modal cannot be closed by clicking anywhere outside
	    });
	
	$('#modal3').modal({
	      dismissible: false, // Modal cannot be closed by clicking anywhere outside
	    });
	
	// Mobile view nav initialization
	$(".button-collapse").sideNav();
	
	// The carousel initialization
	$('.carousel.carousel-slider').carousel({
        fullWidth: true,
        indicators: true
      });
	
	var autoplay = true;

    setInterval(function() { 
        if(autoplay) $('.carousel.carousel-slider').carousel('next');
    }, 4000);

    $('.carousel.carousel-slider').hover(function(){ 
         autoplay = false; 
    }, function(){ 
         autoplay = true; 
    });
    
    // Inserting into the skill database for a particular user
    $(document).on('click','#insert', function() {
    	var emp_id = $("#emp_id").val(); 
        var skill_name = $("#skill_name").val();   
        var yr_exp = $("#yr_exp").val();
        
        var regExp = /[a-zA-Z]/g;
        
        
         if(regExp.test(yr_exp) || skill_name == '' || yr_exp == '' ){
        	
        	 alert("Input error (Field empty or type mismatch)");
             
         } else{
        	 
        	 $.ajax({
				url:"insertSkillData.jsp",
				type: "POST",
				data:$("#add_form").serialize(),
				success:function(data){
				$('#modal1').modal('close');
				window.location.href = "skill.jsp";
	        	 //window.location.reload(true);		
				}
			});
        	 
         }  

    });
    
    $(document).on('click','.edit_data', function() {
		
		 var edit_id = $(this).attr('id');
		 
		 //alert(edit_id);
		 
		  $.ajax({

	          url: "editSkillData.jsp",
	          type: "POST",
	          data:{edit_id:edit_id},
	          success:function(data){
	        	  $('#edit-creds').html(data);
	        	   $('#modal2').modal('open');
	          }


	     }); 
   });
    
    $(document).on('click', '#update-edu', function(){
		  $.ajax({

	          url: "saveSkillData.jsp",
	          type: "POST",
	          data:$("#update-edu_form").serialize(),
	          success:function(data){
	        	  $('#modal2').modal('close');
	        	  window.location.href = "skill.jsp";
		        	 //window.location.reload(true);
	        	  
	          }
	     }); 
		 
		

	});
    
  //Delete data
    $(document).on('click','.del_data', function() {

         var del_id = $(this).attr('id');
         
           $.ajax({

              url: "delSkillData.jsp",
              type: "POST",
              data:{del_id:del_id},
              success:function(data){
                   $("#del-creds").html(data);
                   $('#modal3').modal('open');
              }
         });  

    });
  
    $(document).on('click', '#del', function(){
        $.ajax({

            url: "saveDelSkill.jsp",
            type: "POST",
            data:$("#del-edu_form").serialize(),
            success:function(data){
           	 $('#modal3').modal('close');
           	 window.location.href = "skill.jsp";
       	 	//window.location.reload(true); 
            }
       }); 


  	});
    
    
	
})
	

</script>


<%@ include file="footer.jsp" %>


<!-- Modal for Adding Skill Credentials-->
	  <div id="modal1" class="modal modal-fixed-footer" style="height:40%; width:40%">
	  	<form method="POST" id="add_form" action="#">
		    <div class="modal-content" >
		      <h4 class="center-align">ADD SKILL</h4>
		      	<div class="row center-align" id="">  
		      	 
		      	<div class="col s12">
					<div class=input-field>		
						<input type="hidden" id="emp_id" name="emp_id" value="${empid}">
					</div>
			     </div>   			
		
					 <div class="col s12">
						<div class=input-field>
							<label for="skill_name">Skill</label><br>
							<input type="text" id="skill_name" name="skill_name">
						</div>
					</div>
						
					<div class="col s12">
						<div class=input-field>
							<label for="yr_exp">Years of Experience</label><br>
							<input type="text" id="yr_exp" name="yr_exp" class="validate">	
						</div>
					</div>
				     	
		      	</div>
		      
		    </div>
		    <div class="modal-footer">
		      <a href="" class="modal-close waves-effect waves-light btn-flat red white-text">Close</a>
		      <a href="" class="waves-effect waves-light btn-flat teal white-text" id="insert">Add</a>
		    </div>
	    </form>
 	</div>
 	
 	
<!-- Modal for Editing Employee Skills Credentials-->

		<div id="modal2" class="modal modal-fixed-footer" style="height:40%; width:40%" >
		  	<form method="POST" id="update-edu_form" action="#">
		    <div class="modal-content" >
		      <h4 class="center-align">EDIT SKILL</h4>
		      	<div class="row center-align" id="edit-creds">
		      	
		      	</div>
		      
		    </div>
		    <div class="modal-footer">
		      <a href="" class="modal-close waves-effect waves-light btn-flat red white-text">Close</a>
		      <a href="" class="waves-effect waves-light btn-flat teal white-text" id="update-edu">Update</a>
		    </div>
		    </form>
		</div>
		
<!-- Modal for Deleting Employee Skill Credentials-->

	  <div id="modal3" class="modal modal-fixed-footer" style="width: 30%; height:30%">
	  	<form method="POST" id="del-edu_form" action="#">
	    <div class="modal-content" >
	      <h4 class="center-align">CONFIRMATION</h4>
	      
	      	<div class="row center-align" id="del-creds">
	      	
	      	</div>
	      
	    </div>
	    <div class="modal-footer">
	      <a href="" class="modal-close waves-effect waves-light btn-flat teal white-text">No</a>
	      <a href="" class="waves-effect waves-light btn-flat red white-text" id="del" id="del">Yes</a>
	    </div>
	    </form>
	  </div>



