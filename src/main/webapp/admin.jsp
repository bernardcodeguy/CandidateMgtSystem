<%@page import="com.javawebapp.ConnectionManager"%>
<%@ include file="header.jsp" %>
<%@ page import="java.sql.*" %>
	
<%	
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		
	if(session.getAttribute("key") == null){
			response.sendRedirect("index.jsp");
	}



	
	String sql = "SELECT SUM(salary) FROM employees";
	
	Connection con = ConnectionManager.getConnection();
	Statement ps = con.createStatement();
	ResultSet rs = ps.executeQuery(sql);
	rs.next();
	
	double sum = rs.getDouble(1);
	
	String currencyForm = String.format("$%,.2f", sum);
	
%>

<!-- Navigation Bar -->	
	<div class="navbar">
 	<nav>
        <div class="nav-wrapper teal lighten-3">
        	<div class="container">
        	<a href="#!" class="brand-logo">EMS</a>
            <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>
            <ul class="right hide-on-med-and-down">
                <li><a href="adminlogout">Log out</a></li>
            </ul>
            <ul class="side-nav" id="mobile-demo">
                <li><a href="adminlogout">Logout</a></li>
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
                    		<a href="admin.jsp">Admin Panel</a>
                    <p>
                </div>
            </div>
        </div>
    </section>
	
	<div class="container">
	<sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://eu-cdbr-west-03.cleardb.net/heroku_526313a38b560ae" user="b0c2a51540887e" password="82fd3e43"/>
	<sql:query var="rowemp" dataSource="${db}">
	    SELECT * FROM employees ORDER BY fname ASC
	  </sql:query>
	  
	  <sql:query var="rowappr" dataSource="${db}">
	    SELECT * FROM employees WHERE is_approved > 0 ORDER BY fname ASC
	  </sql:query>
	  
	  <sql:query var="rownotappr" dataSource="${db}">
	    SELECT * FROM employees WHERE is_approved < 1 ORDER BY fname ASC
	  </sql:query>
	  
	  
	  
	  
	  <sql:query var="salaries" dataSource="${db}">
	    SELECT SUM(salary) FROM employees
	  </sql:query>
	
		<div class="row c-row">
			<div class="col s6 m6 l3 c-col">
				<div class="card-panel c-card">
					<div class="row">
						<div class="col s12">
							<p class="center-align" style="font-size:0.9em">No. of Employees</p>
						</div>
						<div class="col s12">
							<h4 class="center-align flow-text" style="font-weight: bold;"><print:out value="${rowemp.rowCount}"></print:out></h4>
						</div>
					</div>   		
      			</div> 
			</div>
			<div class="col s6 m6 l3 c-col">
				<div class="card-panel c-card">
            		<div class="row">
						<div class="col s12">
							<p class="center-align" style="font-size:0.9em">Approved</p>
						</div>
						<div class="col s12">
							<h4 class="center-align flow-text" style="font-weight: bold;"><print:out value="${rowappr.rowCount}"></print:out></h4>
						</div>
					</div>
      			</div> 
			</div>
			<div class="col s6 m6 l3 c-col">
				<div class="card-panel c-card">
            		<div class="row">
						<div class="col s12">
							<p class="center-align" style="font-size:0.9em">Pending approval</p>
						</div>
						<div class="col s12">
							<h4 class="center-align flow-text" style="font-weight: bold;"><print:out value="${rownotappr.rowCount}"></print:out></h4>
						</div>
					</div>
      			</div> 
			</div>
			<div class="col s6 m6 l3 c-col">
				<div class="card-panel c-card">
            		<div class="row">
						<div class="col s12">
							<p class="center-align" style="font-size:0.9em">Total Salaries</p>
						</div>
						<div class="col s12">
							<h4 class="center-align flow-text" style="font-weight: bold;"> <%= currencyForm %> </h4>
						</div>
					</div>
      			</div> 
			</div>
		</div>
		
		<div class="row">
	    <div class="col s12">
	      <ul id="tabs-swipe-demo" class="tabs">
		    <li class="tab col s4"><a href="#test-swipe-1" class="black-text active">All Employees</a></li>
		    <li class="tab col s4"><a class="black-text" href="#test-swipe-2">List of approved</a></li>
		    <li class="tab col s4"><a href="#test-swipe-3" class="black-text">List of Unapproved</a></li>
		    
		  </ul>
	    </div>
	    
	    <div id="test-swipe-1" class="col s12" style="height: 50vh;overflow-y: auto; scrollbar-width: auto;" onmouseover="this.style.overflow='auto'" onmouseout="this.style.overflow='hidden'">
	    
	    	<div class="card-panel">
	    		<table class="">
			        <thead>
			          <tr>
			          	  <th>#</th>
			              <th>Employee Name</th>
			              <th>Job Title</th>
			              <th>Status</th>
			              <th>Action</>
			          </tr>
			        </thead>
			        <tbody>
			        
			        	<print:set var="count_emp" value="${1}" scope="session"/>								
	      				<print:forEach items="${rowemp.rows}" var="employee" >
	      					<tr>
	      						<td>
	      							<print:out value="${count_emp}"></print:out>
	      						</td>
	      						<td>
	      							<print:out value="${employee.fname} "></print:out>
	      							<print:out value="${employee.lname}"></print:out>
	      							
	      						</td>
	      						<td>
	      							<print:out value="${employee.job}"></print:out>
	      						</td>
	      						<td style="font-style:italic">
	      							<print:choose>
	      								<print:when test="${employee.is_approved < 1}">
	      									<print:out value="Pending approval"></print:out>
	      								</print:when>
	      								<print:otherwise>
	      									<print:out value="Approved"></print:out>
	      								</print:otherwise>
	      							</print:choose>
	      							
	      						</td>
	      						<td>
	      							
	      							<a class="btn-small btn-floating waves-effect waves-light teal lighten-3 view" id="${employee.id}"><i class="material-icons">remove_red_eye</i></a>
	      							<a href="sheet?emp_id=${employee.id}" class="btn-small btn-floating waves-effect waves-light teal lighten-3" ><i class="material-icons">today</i></a>
	      							<a class="btn small btn-floating waves-effect waves-light red del_emp" id="${employee.id}"><i class="material-icons">delete</i></a>
	      						</td>
	      					</tr>
	      					<print:set var="count_emp" value="${count_emp + 1}" />
						</print:forEach>
			        </tbody>
	        	</table>
	    	</div>
	    </div>
	    
	    
  		<div id="test-swipe-2" class="col s12">
  			<div class="card-panel">
	    		<table class="centered">
			        <thead>
			          <tr>
			          	  <th>#</th>
			              <th>Employee Name</th>
			              <th>Salary</th>
			              <th>Action</th>
			          </tr>
			        </thead>
			        <tbody>
			        	<print:set var="count_appr" value="${1}" scope="session"/>								
	      				<print:forEach items="${rowappr.rows}" var="appr" >
	      					<tr>
	      						<td>
	      							<print:out value="${count_appr}"></print:out>
	      						</td>
	      						<td>
	      							<print:out value="${appr.fname} "></print:out>
	      							<print:out value="${appr.lname}"></print:out>
	      							
	      						</td>
	      						<td>
	      							<fmt:formatNumber value="${appr.salary}" type="currency"></fmt:formatNumber>
	      						</td>
	      						<td>
	      							<a class="btn small btn-floating tooltipped waves-effect waves-light red unappr" data-position="left" data-delay="50" data-tooltip="Unapprove" id="${appr.id}"><i class="material-icons">clear</i></a>
	      						</td>
	      					</tr>
	      					<print:set var="count_appr" value="${count_appr + 1}" />
						</print:forEach>
			        	
			        </tbody>

	        	</table>
	    	</div>
  		
  		</div>
  		<div id="test-swipe-3" class="col s12">
  			<div class="card-panel">
	    		<table class="centered">
			        <thead>
			          <tr>
			          	  <th>#</th>
			              <th>Employee Name</th>
			              <th>Salary</th>
			              <th>Action</th>
			          </tr>
			        </thead>
			        <tbody>
			        	
			        	<print:set var="count_unappr" value="${1}" scope="session"/>								
	      				<print:forEach items="${rownotappr.rows}" var="unappr" >
	      					<tr>
	      						<td>
	      							<print:out value="${count_unappr}"></print:out>
	      						</td>
	      						<td>
	      							<print:out value="${unappr.fname} "></print:out>
	      							<print:out value="${unappr.lname}"></print:out>
	      							
	      						</td>
	      						<td style="font-style:italic">
	      							<print:out value="Undecided"></print:out>
	      						</td>
	      						<td>
	      							<a class="btn small btn-floating tooltipped waves-effect waves-light green appr" data-position="left" data-delay="50" data-tooltip="Approve" id="${unappr.id}"><i class="material-icons">check</i></a>
	      						</td>
	      					</tr>
	      					<print:set var="count_unappr" value="${count_unappr + 1}" />
						</print:forEach>
			        	
			        </tbody>

	        	</table>
	    	</div>
  		
  		</div>
	  
	  </div>
 
	</div>

	
	<div class="fixed-action-btn">
	  <a class="btn-floating btn-large black">
	    <i class="large material-icons">menu</i>
	  </a>
	  <ul>
	    <li><a href="adminlogout" class="btn-floating tooltipped red" data-position="left" data-delay="50" data-tooltip="Log out" href="edu.jsp"><i class="material-icons">logout</i></a></li>
	  </ul>
</div>
    	
    



	
<%@ include file="med.jsp" %>

<script type="text/javascript">
	$(document).ready(function(){
		$(".button-collapse").sideNav();
		
		$('#modal1').modal({
		      dismissible: false, // Modal cannot be closed by clicking anywhere outside
		    });
		$('#modal2').modal({
		      dismissible: false, // Modal cannot be closed by clicking anywhere outside
		    });
		$('#modal3').modal({
		      dismissible: false, // Modal cannot be closed by clicking anywhere outside
		    });
		$('#modal4').modal({
		      dismissible: false, // Modal cannot be closed by clicking anywhere outside
		    });
		
		$(document).on('click','.view', function() {
			
			 var id = $(this).attr('id');
			 
			 
			 //alert(id);
			 
			   $.ajax({

		          url: "admin/viewEmployee.jsp",
		          type: "POST",
		          data:{id:id},
		          success:function(data){
		        	  $('#mod-1').html(data);
		        	   $('#modal1').modal('open'); 
		          }


		     });  
	   });
		
		//Delete data
        $(document).on('click','.del_emp', function() {


             var del_id = $(this).attr('id');
             
              $.ajax({

                  url: "admin/delEmpData.jsp",
                  type: "POST",
                  data:{del_id:del_id},
                  success:function(data){
                       $("#del-emp").html(data);
                       $('#modal2').modal('open');
                  }


             });  

        });
		
        $(document).on('click', '#del', function(){
        	

            $.ajax({

                url: "admin/saveDelEmp.jsp",
                type: "POST",
                data:$("#del-edu_form").serialize(),
                success:function(data){
               	  $('#modal2').modal('close');
               	 window.location.href = "admin.jsp"; 
		        	 //window.location.reload(true); 
                }
           }); 
      });
        
      //Unapprove employee
        $(document).on('click','.unappr', function() {


             var unappr_id = $(this).attr('id');
             
              $.ajax({

                  url: "admin/unapprEmpData.jsp",
                  type: "POST",
                  data:{unappr_id:unappr_id},
                  success:function(data){
                	  
                       $("#unappr-emp").html(data);
                       $('#modal3').modal('open'); 
                  }


             });   

        });
      
		$(document).on('click', '#unappr_emp', function(){
        	

            $.ajax({

                url: "admin/saveUnapprEmp.jsp",
                type: "POST",
                data:$("#unappr-emp_form").serialize(),
                success:function(data){
                
               	 $('#modal3').modal('close');
               	 window.location.href = "admin.jsp"; 
		        	 //window.location.reload(true); 
                }
           }); 
      });
		
		//Approve employee
        $(document).on('click','.appr', function() {


             var appr_id = $(this).attr('id');
             
               $.ajax({

                  url: "admin/apprEmpData.jsp",
                  type: "POST",
                  data:{appr_id:appr_id},
                  success:function(data){
                       $("#appr-emp").html(data);
                       $('#modal4').modal('open'); 
                  }


             });   

        });
		
		 $(document).on('click', '#appr_emp', function(){
        	
			 var id = $("#appr_id").val();
			 var salary = $("#salary").val();
			 
			 var regExp = /[a-zA-Z]/g;
		        
		        if(regExp.test(salary) || salary == ''){
		        	alert('Input error or empty field');
		        }else{
		        	$.ajax({

		                url: "admin/saveapprEmp.jsp",
		                type: "POST",
		                data:$("#appr-emp_form").serialize(),
		                success:function(data){    
		               	  $('#modal4').modal('close');
		               	  window.location.href = "admin.jsp";   
				        	 //window.location.reload(true); 
		                }
		           });
		        	
		        }
			 
			
               
      }); 
		
        
        
		
	})
	

</script>

<%@ include file="footer.jsp" %>



<!-- Viewing Employee Credentials-->
	  <div id="modal1" class="modal modal-fixed-footer" style="height:40%; " >
	    <div class="modal-content" >
	      <h4 class="center-align">EMPLOYEE DETAILS</h4>
	      	<div class="row center-align" id="mod-1">  
	      	 
				      	
	      	</div>
	      
	    </div>
	    <div class="modal-footer">
	      <a href="" class="modal-close waves-effect waves-light btn-flat red-text">Close</a>
	    </div>
	  </div>

<!-- Modal for Deleting Employee-->
	  <div id="modal2" class="modal modal-fixed-footer" style="width: 30%; height:20%">
	  	<form method="POST" id="del-edu_form" action="#">
	    <div class="modal-content" >
	      <h4 class="center-align">Confirmation</h4>
	      
	      	<div class="row center-align" id="del-emp">
	      	
	      	</div>
	      
	    </div>
	    <div class="modal-footer">
	      <a href="#" class="modal-close waves-effect waves-light btn-flat teal white-text">No</a>
	      <a href="#" class="waves-effect waves-light btn-flat red white-text" id="del" id="del">Yes</a>
	    </div>
	    </form>
	  </div>
	  
	  
<!-- Modal for Unapproving Employee-->
	  <div id="modal3" class="modal modal-fixed-footer" style="width: 30%; height:20%">
	  	<form method="POST" id="unappr-emp_form" action="#">
	    <div class="modal-content" >
	      <h4 class="center-align">Confirmation</h4>
	      
	      	<div class="row center-align" id="unappr-emp">
	      	
	      	</div>
	      
	    </div>
	    <div class="modal-footer">
	      <a href="#" class="modal-close waves-effect waves-light btn-flat teal white-text">No</a>
	      <a href="#" class="waves-effect waves-light btn-flat red white-text" id="unappr_emp" id="del">Yes</a>
	    </div>
	    </form>
	  </div>

<!-- Modal for Unapproving Employee-->
	  <div id="modal4" class="modal modal-fixed-footer" style="width: 30%; height:35%">
	  	<form method="POST" id="appr-emp_form" action="#">
	    <div class="modal-content" >
	      <h4 class="center-align">Confirmation</h4>
	      
	      	<div class="row center-align" id="appr-emp">
	      	
	      	</div>
	      
	    </div>
	    <div class="modal-footer">
	      <a href="#" class="modal-close waves-effect waves-light btn-flat teal white-text">No</a>
	      <a href="#" class="waves-effect waves-light btn-flat red white-text submit" id="appr_emp" id="del">Yes</a>
	    </div>
	    </form>
	  </div>
	  
	  
