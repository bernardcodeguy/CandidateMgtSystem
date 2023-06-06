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
			    SELECT * FROM education WHERE emp_id=?
			    <sql:param value = "${empid}" />
				</sql:query>  
				
			 
				 
		 <ul class="collection">
           <li class="collection-item avatar">
             <i class="material-icons circle">school</i>
             <span class="title" style="font-weight: bold">Educational Background</span>
             <p>Your qualification</p>
             <a href="#modal1" class="btn-floating secondary-content waves-effect waves-circle modal-trigger" id="${empid}"><i class="material-icons">add</i></a>
           </li>
           
           
           <print:forEach items="${rs.rows}" var="education"> 
           		<print:set var="dateParts" value="${fx:split(education.start_date, '-')}" />   
				 <print:set var="year" value="${dateParts[0]}" />
				 <print:set var="month" value="${dateParts[1]}" />
				 <print:set var="day" value="${dateParts[2]}" />
				 
				 <print:set var="dateParts2" value="${fx:split(education.end_date, '-')}" />   
				 <print:set var="year2" value="${dateParts2[0]}" />
				 <print:set var="month2" value="${dateParts2[1]}" />
				 <print:set var="day2" value="${dateParts2[2]}" />
           
           	<li class="collection-item avatar">
             <p class="title"><span style="font-weight:bold">Institution:</span>  <print:out value="${education.institution}"></print:out></p>
             <p class="title"><span style="font-weight:bold">Program/Course:</span>  <print:out value="${education.program}"></print:out></p>
             <p class="title"><span style="font-weight: bold">Start Year: </span> 
             <print:out value="${day}-"></print:out><print:out value="${month}-"></print:out><print:out value="${year}"></print:out> 
             </p>
             <p class="title"><span style="font-weight: bold">End Year:</span> 
             <print:out value="${day2}-"></print:out><print:out value="${month2}-"></print:out><print:out value="${year2}"></print:out> 
             </p>
             <p class="title"><span style="font-weight: bold">Cerificate/Award: </span> <print:out value=" ${education.certificate}"></print:out></p>
             <p>
              <a href="#" class="secondary-content edit_data" id="${education.id}"><i class="material-icons">edit</i></a>
              <a href="#" class="secondary-content red-text del_data" style="margin-top: 30px;" id="${education.id}"><i class="material-icons">delete</i></a>
            </p>
           </li> 
           	
			    		    	
		   </print:forEach>
           
           
           
         </ul>
         
         
	</div>
	<div class="container">
		<div class="card-panel teal lighten-3">
            <div class="carousel carousel-slider center hide-on-med-and-down" style="max-height:15vh">
			   <div class="carousel-item white-text" href="#one!">
			     <h2 class="flow-text">Education is what remains after one has forgotten what one has learned in school.</h2>
			     <p class="white-text flow-text">Albert Einstein</p>
			   </div>
			   <div class="carousel-item  white-text" href="#two!">
			     <h2 class="flow-text">Live as if you were to die tomorrow. Learn as if you were to live forever.</h2>
			     <p class="white-text flow-text"> Mahatma Gandhi</p>
			   </div>
			   <div class="carousel-item white-text" href="#three!">
			     <h2 class="flow-text">Education is a better safeguard of liberty than a standing army.</h2>
			     <p class="white-text flow-text">Edward Everett </p>
			   </div>
			   <div class="carousel-item  white-text" href="#four!">
			     <h2 class="flow-text">Man can learn nothing except by going from the known to the unknown.</h2>
			     <p class="white-text flow-text">Claude Bernard</p>
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
		    <li><a class="btn-floating tooltipped yellow darken-1" data-position="left" data-delay="50" data-tooltip="Go to skills page" href="skill.jsp"><i class="material-icons">stars</i></a></li>
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

	
	<script type="text/javascript">
	
	document.addEventListener('DOMContentLoaded', function() {
	    var elems = document.querySelectorAll('.datepicker');
	    var instances = M.Datepicker.init(elems, options);
	  });
	
	document.addEventListener('DOMContentLoaded', function() {
	    var elems = document.querySelectorAll('.datepicker2');
	    var instances = M.Datepicker.init(elems, options);
	  });
	
	$(document).ready(function(){
		
		$('#modal1').modal({
		      dismissible: false, // Modal cannot be closed by clicking anywhere outside
		    });
		$('#modal2').modal({
		      dismissible: false, // Modal cannot be closed by clicking anywhere outside
		    });
		$('#modal3').modal({
		      dismissible: false, // Modal cannot be closed by clicking anywhere outside
		    });
		
		
        $(".button-collapse").sideNav();
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
       
        
        $('.datepicker').pickadate({
        	"format": "yyyy-mm-dd",
            selectMonths: true, // Creates a dropdown to control month
            selectYears: 200, // Creates a dropdown of 15 years to control year,
            today: 'Today',
            clear: 'Clear',
            close: 'Ok',
           
        });
        
        $('.datepicker2').pickadate({
        	"format": "yyyy-mm-dd",
            selectMonths: true, // Creates a dropdown to control month
            selectYears: 200, // Creates a dropdown of 15 years to control year,
            today: 'Today',
            clear: 'Clear',
            close: 'Ok',
           
        });
        
        $(document).on('click','#insert', function() {
			var emp_id = $("#emp_id").val(); 
            var institution = $("#institution").val();   
            var program = $("#program").val();
            var start_date = $("#start_date").val();
            var end_date = $("#end_date").val();
            var certificate = $("#certificate").val();
            
            

            if(institution == "" || program == "" || start_date == "" || end_date == ""|| certificate == "")  
            {  
            	
            	Materialize.toast('Empty field error!!', 4000, 'rounded');  
                 
             }  

         	else
            {
                  $.ajax({
                  url:"insertEduData.jsp",
                  type: "POST",
                  data:$("#add_form").serialize(),
                  success:function(data){
                   $('#modal1').modal('close');
                   window.location.href = "edu.jsp";
		           window.location.reload(true);
				

                  }
            });
        }
  	  });
        
        $(document).on('click','.edit_data', function() {
			
			 var edit_id = $(this).attr('id');
			 
			 $.ajax({

		          url: "editEduData.jsp",
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

		          url: "saveEduData.jsp",
		          type: "POST",
		          data:$("#update-edu_form").serialize(),
		          success:function(data){
		        	 $('#modal2').modal('close');
		        	 window.location.href = "edu.jsp";
		        	 //window.location.reload(true);
		          }
		     }); 
			 
			

		});
        
      	//Delete data
        $(document).on('click','.del_data', function() {


             var del_id = $(this).attr('id');
             
             
              $.ajax({

                  url: "delEduData.jsp",
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

                 url: "saveDelEdu.jsp",
                 type: "POST",
                 data:$("#del-edu_form").serialize(),
                 success:function(data){
                	 $('#modal3').modal('close');
                	 window.location.href = "edu.jsp";
		        	 //window.location.reload(true); 
                 }
            }); 


       });
        
      
        
		
})
	
	
	

	</script>
	
	
	
<%@ include file="footer.jsp" %>


<!-- Modal for Adding Education Credentials-->
	  <div id="modal1" class="modal modal-fixed-footer" style="height:70%; width:40%">
	  	<form method="POST" id="add_form" action="#">
	    <div class="modal-content" >
	      <h4 class="center-align">Add Educational Background</h4>
	      	<div class="row center-align" id="">  
	      	 
	      		<div class="col s12">
				<div class=input-field>		
					<input type="hidden" id="emp_id" name="emp_id" value="${empid}">
				</div>
		     </div>   			
	
				 <div class="col s12">
					<div class=input-field>
						<label for="program">Institution</label><br>
						<input type="text" id="institution" name="institution">
					</div>
				</div>
					
				<div class="col s12">
					<div class=input-field>
						<label for="program">Program</label><br>
						<input type="text" id="program" name="program" >	
					</div>
				</div>
				
				
				
				<div class="col s12">
					<div class=input-field>
					<label for="start_date">Year Started</label>
					<input id="start_date" type="text" class="datepicker" name="start_date">
					</div>
			     </div>
			     
				<div class="col s12">
					<div class=input-field>
					<label for="end_date">Year Ended</label>
					<input id="end_date" type="text" class="datepicker" name="end_date">
					</div>
			     </div>
				
					
				<div class="col s12">
					<div class=input-field>
						<label for="certificate">Certificate</label><br>
						<input type="text" id="certificate" name="certificate" >
						
					</div>
				</div>
				      	
	      	</div>
	      
	    </div>
	    <div class="modal-footer">
	      <a href="" class="modal-close waves-effect waves-light btn-flat red-text">Close</a>
	      <a href="" class="waves-effect waves-light btn-flat teal-text" id="insert">Add</a>
	    </div>
	    </form>
	  </div>
	  
	  
	  
	  
	  
	  <!-- Modal for Editing Employee Education Credentials-->
		  <div id="modal2" class="modal modal-fixed-footer" style="width: 40%">
		  	<form method="POST" id="update-edu_form" action="#">
		    <div class="modal-content" >
		      <h4 class="center-align">Edit Credentials</h4>
		      	<div class="row center-align" id="edit-creds">
		      	
		      	</div>
		      
		    </div>
		    <div class="modal-footer">
		      <a href="" class="modal-close waves-effect waves-light btn-flat red-text">Close</a>
		      <a href="#" class="waves-effect waves-light btn-flat" id="update-edu">Update</a>
		    </div>
		    </form>
		  </div>
		  
		  
	 <!-- Modal for Deleting Employee Education Credentials-->
		  <div id="modal3" class="modal modal-fixed-footer" style="width: 30%; height:20%">
		  	<form method="POST" id="del-edu_form" action="#">
		    <div class="modal-content" >
		      <h4 class="center-align">Confirmation</h4>
		      
		      	<div class="row center-align" id="del-creds">
		      	
		      	</div>
		      
		    </div>
		    <div class="modal-footer">
		      <a href="#" class="modal-close waves-effect waves-light btn-flat teal white-text">No</a>
		      <a href="#" class="waves-effect waves-light btn-flat red white-text" id="del" id="del">Yes</a>
		    </div>
		    </form>
		  </div>