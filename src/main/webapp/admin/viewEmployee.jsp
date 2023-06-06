<%@ page import="java.sql.*" %>
<%@ page import="com.javawebapp.ConnectionManager" %>
<%@ taglib prefix="print" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fx" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%!
	int id;
	String fname = "";
	String lname = "";
	String email = "";
	String department = "";
	String job = "";
	String country = "";
	String gender = "";
	Double salary = 0.00;
	int is_approved;
	String institution = "";
	
	String approvalStatus = "";
	String salaryString = "";	
	
%>


<% 
	if(request.getParameterMap().containsKey("id"))
	{
	     
	    id = Integer.parseInt(request.getParameter("id")); 
	    
	    request.setAttribute("id", id);
	    
	    
		String sql = "SELECT fname,lname,email,department,job,country,gender,salary,is_approved FROM employees WHERE id="+id;
		
		Connection con = ConnectionManager.getConnection();
		
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(sql);
		rs.next();
		
		fname = rs.getString("fname");
		lname = rs.getString("lname");
		email = rs.getString("email");
		department = rs.getString("department");
		job = rs.getString("job");
		country = rs.getString("country");
		gender = rs.getString("gender");
		salary = rs.getDouble("salary");
		is_approved = rs.getInt("is_approved");
		con.close();
		
		if(is_approved < 1){
			approvalStatus = "Pending Approval";
		}else{
			approvalStatus = "Approved";
		}
		
		if(salary < 1){
			salaryString = "N/A";
		}else{
			salaryString = String.format("$%,.2f", salary);
		}
		
		
		
	}
	
%>



	 <sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://eu-cdbr-west-03.cleardb.net/heroku_526313a38b560ae" user="b0c2a51540887e" password="82fd3e43"/>
	    <sql:query var="rss" dataSource="${db}">
	    SELECT * FROM education WHERE emp_id=?
	    <sql:param value = "${id}" />
	    </sql:query>
	    
	    <sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://eu-cdbr-west-03.cleardb.net/heroku_526313a38b560ae" user="b0c2a51540887e" password="82fd3e43"/>
	    <sql:query var="rsss" dataSource="${db}">
	    SELECT * FROM skill WHERE emp_id=?
	    <sql:param value = "${id}" />
	    </sql:query>
	    
	    <sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://eu-cdbr-west-03.cleardb.net/heroku_526313a38b560ae" user="b0c2a51540887e" password="82fd3e43"/>
	    <sql:query var="rsimg" dataSource="${db}">
	    SELECT img FROM employees WHERE id=?
	    <sql:param value = "${id}" />
	    </sql:query>
	    
	    <print:forEach items="${rsimg.rows}" var="emp"> 
	    	<print:set var = "img" scope = "session" value = "${emp.img}"/>
	    </print:forEach>

		
	<div class="hide-on-med-and-down" style="margin-left:45%;">
		<print:choose>
			<print:when test="${img == null}">
				<div class="con" style="width:100px; height:100px">
					<img src="images/placeholder.png" alt="image not found" class="responsive-img circle" id="dp">
				</div>
			</print:when>
			<print:otherwise>
			
				<div class="con" style="width:100px; height:100px">
					<img src=saveimage?id=<print:out value="${id}"></print:out> alt="image not found" class="responsive-img circle" id="dp">
				</div>	
			</print:otherwise>
		
		</print:choose>
	</div>
	<div class="hide-on-large-only" style="margin-left:40%;">
		<print:choose>
			<print:when test="${img == null}">
				<div class="con" style="width:100px; height:100px">
					<img src="images/placeholder.png" alt="image not found" class="responsive-img circle" id="dp">
				</div>
			</print:when>
			<print:otherwise>
			
				<div class="con" style="width:100px; height:100px">
					<img src=saveimage?id=<print:out value="${id}"></print:out> alt="image not found" class="responsive-img circle" id="dp">
				</div>	
			</print:otherwise>
		
		</print:choose>
	</div>									
	 <br>
	 <br>
	<div>
		
		<p style="font-weight:bold">Full Name: <span style="font-weight:normal"> <%=fname %> <%=lname %></span></p>
		<p style="font-weight:bold">Email Address: <span style="font-weight:normal"><%=email %></span></p>
		<p style="font-weight:bold">Department: <span style="font-weight:normal"><%=department %></span></p>
		<p style="font-weight:bold">Job Title: <span style="font-weight:normal"><%=job %></span></p>
		<p style="font-weight:bold">Country: <span style="font-weight:normal"><%=country %></span></p>
		<p style="font-weight:bold">Gender: <span style="font-weight:normal"><%=gender %></span></p>
		<p style="font-weight:bold">Salary: <span style="font-weight:normal"><%=salaryString %></span></p>
		<p style="font-weight:bold">Approval Status: <span style="font-style: italic; font-weight:normal"><%=approvalStatus %></span> </p>
		
		<br>
	 	<br>
		<ul class="collection">
           <li class="collection-item avatar">
             <i class="material-icons circle">school</i>
             <span class="title" style="font-weight: bold">Educational Background</span>
             <p>Qualification</p>
           </li>
           
           
           <print:forEach items="${rss.rows}" var="education"> 
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
           </li> 	    		    	
		   </print:forEach> 
         </ul>
         
         <ul class="collection">
		<li class="collection-item avatar">
			<i class="material-icons circle">stars</i>
			<span class="title" style="font-weight: bold">SKILLS</span>
			<p>Expertise</p>
		</li>
		
		
		<print:forEach items="${rsss.rows}" var="skill"> 
		
		<li class="collection-item avatar">
			<p class="title"><span style="font-weight:bold">Skill:</span>  <print:out value="${skill.skill_name}"></print:out></p>
			<p class="title"><span style="font-weight:bold">Years of Experience:</span>  <print:out value="${skill.yr_exp}"></print:out></p>
		</li> 
				
		</print:forEach>
		
		</ul>
		
		
		
		
		
	</div>


