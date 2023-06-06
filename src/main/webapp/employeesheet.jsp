<%@page import="com.javawebapp.ConnectionManager"%>
<%@ include file="header.jsp" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.LocalTime" %>
<%@ page import="java.time.format.*" %>

<%@ page import="java.util.List" %>
<%@ page import="com.javawebapp.*" %>
<%@ page import="com.javawebapp.dao.*" %>

<%!
	int emp_id;

	int pageid;
	int total;
	List<TimeSheet> list;
	int count;
	int pages;
	
	int pageNumber;
	
	String formattedDate;
	
	String timeFormat;
	
	String am_pm;

%>
	
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
	
	pageid = Integer.parseInt(request.getParameter("page"));  
    
    pageNumber = Integer.parseInt(request.getParameter("page"));  
    
    total=5;
    
    if(pageid==1){
    }else{  
        pageid=pageid-1;  
        pageid=pageid*total+1;  
    } 
    
    String ids = String.valueOf(session.getAttribute("emp_id"));
    
    int emp_id = Integer.parseInt(ids);
    
    count = TimeSheetDao.getTimeSheetCount(emp_id);
    
    double a = ((double) count)/total;
    pages = (int)Math.ceil(a);   

    list=TimeSheetDao.getTimeSheet(emp_id, pageid, total);
    
    
	
%>

<!-- Navigation Bar -->	
	<div class="navbar">
 	<nav>
        <div class="nav-wrapper teal lighten-3">
        	<div class="container">
        	<a href="#!" class="brand-logo">EMS</a>
            <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>
            <ul class="right hide-on-med-and-down">
            <li><a href="admin.jsp">Dashboard</a></li>
                <li><a href="adminlogout">Log out</a></li>
            </ul>
            <ul class="side-nav" id="mobile-demo">
            <li><a href="admin.jsp">Dashboard</a></li>
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
		
		
	<div class="row hide-on-med-and-down">    
	   	<div class="card-panel" style="height: 40vh;">
	   		<table class="">
		        <thead>
		          <tr>
		          	  <th>Date</th>
		              <th>Time In</th>
		              <th>Break Start</th>
		              <th>Break End</th>
		              <th>Time Out</th>
		              <th>Total Duration</th>
		              <th>Total Break Duration</th>
		              <th>Total Productive Duration</th>
		          </tr>
		        </thead>
		        <tbody>
		        	
		        	<%for(TimeSheet t: list){ %>
		        	  <tr>
		        	  <td><%=t.getWorking_date() %></td>
	        	  
		              <td>
		              
		               <%
		        	  	
		        	  String [] timeIn = t.getTime_in().split(":");
		        	  
		        	  int hr = Integer.parseInt(timeIn[0]);
		        	  int mm = Integer.parseInt(timeIn[1]);
		        	  
		        	  String sm = String.valueOf(mm);
		        	  String sh = String.valueOf(hr);
		        	  
		        	  String preffix = "";
		        	  String preffix1 = "";
		        	  
		        	  if(hr > 12){
		        		  am_pm = "PM";
		        		  hr = hr - 12;
		        	  }else if(hr == 12){
		        		  am_pm = "PM";
		        	  }else{
		        		  am_pm = "AM";
		        	  }
		        	  
		        	  if(sm.length() < 2){
		        		  preffix = "0";
		        	  }
		        	  
		        	  if(sh.length() < 2){
		        		  preffix1 = "0";
		        	  }
		        	  
		        	  	
		        	  timeFormat = preffix1+hr+":"+preffix+mm+" "+am_pm;
		        	  %>
		              
		              <%=timeFormat %>
		              
		              </td>
		              
		              <% if(t.getBreak_time() == null){ %>
		              		<td>N/A </td>
		              <% }else{ %>
		              		<td>
		              		
				              <%
				        	  	
						        	  String [] timeIn1 = t.getBreak_time().split(":");
						        	  
						        	  int hr1 = Integer.parseInt(timeIn1[0]);
						        	  int mm1 = Integer.parseInt(timeIn1[1]);
						        	  
						        	  String sm1 = String.valueOf(mm1);
						        	  String sh1 = String.valueOf(hr1);
						        	  
						        	  String preffix2 = "";
						        	  String preffix3 = "";
						        	  
						        	  if(hr1 > 12){
						        		  am_pm = "PM";
						        		  hr1 = hr1 - 12;
						        	  }else if(hr1 == 12){
						        		  am_pm = "PM";
						        	  }else{
						        		  am_pm = "AM";
						        	  }
						        	  
						        	  if(sm1.length() < 2){
						        		  preffix2 = "0";
						        	  }
						        	  
						        	  if(sh1.length() < 2){
						        		  preffix3 = "0";
						        	  }
						        	  
						        	  	
						        	  timeFormat = preffix3+hr1+":"+preffix2+mm1+" "+am_pm;
						        	  
						        	  
						        	  if(t.getBreak_time().equals("00:00:00")){
						        		  timeFormat = "No Break";
		              					}
				        	  %>
		              
		              	<%=timeFormat %>
		              		
		              		</td>
		              <% } %>
		              
		              <% if(t.getBreak_time_out() == null){ %>
		              		<td>
		              		N/A
		              		 <% if(t.getBreak_time() != null){ %>
		              		  
		              		<% }%>
		              		
		              		</td>
		              <% }else{ %>
		              		<td>
		              		
		              		<%
				        	  	
						        	  String [] timeIn2 = t.getBreak_time_out().split(":");
						        	  
						        	  int hr2 = Integer.parseInt(timeIn2[0]);
						        	  int mm2 = Integer.parseInt(timeIn2[1]);
						        	  
						        	  String sm2 = String.valueOf(mm2);
						        	  String sh2 = String.valueOf(hr2);
						        	  
						        	  String preffix4 = "";
						        	  String preffix5 = "";
						        	  
						        	  if(hr2 > 12){
						        		  am_pm = "PM";
						        		  hr2 = hr2 - 12;
						        	  }else if(hr2 == 12){
						        		  am_pm = "PM";
						        	  }else{
						        		  am_pm = "AM";
						        	  }
						        	  
						        	  if(sm2.length() < 2){
						        		  preffix4 = "0";
						        	  }
						        	  
						        	  if(sh2.length() < 2){
						        		  preffix5 = "0";
						        	  }
						        	  
						        	  	
						        	  timeFormat = preffix5+hr2+":"+preffix4+mm2+" "+am_pm;
						        	  
						        	  if(t.getBreak_time().equals("00:00:00")){
						        		  timeFormat = "No Break";
		              					}
				        	  %>
		              
		              	<%=timeFormat %>
		              		</td>
		              <% } %>
		              
		              <% if(t.getTime_out() == null && t.getBreak_time() == null && t.getBreak_time_out() == null){ %>
		              		<td>
		              		N/A
		              		
		              		</td>
		              		
		              	<%}else if(t.getTime_out() == null && t.getBreak_time() != null && t.getBreak_time_out() == null){ %>	
		              		<td>
		              		N/A
		              		</td>
		              <%}else if(t.getTime_out() == null && t.getBreak_time() != null && t.getBreak_time_out() != null){ %>	
		              		<td>
		              		N/A 
		              		</td>
		              <% }else{ %>
		              		<td>
		              		<%
				        	  	
						        	  String [] timeIn3 = t.getTime_out().split(":");
		              		
		              		
		              					
						        	  
						        	  int hr3 = Integer.parseInt(timeIn3[0]);
						        	  int mm3 = Integer.parseInt(timeIn3[1]);
						        	  
						        	  String sm3 = String.valueOf(mm3);
						        	  String sh3 = String.valueOf(hr3);
						        	  
						        	  String preffix6 = "";
						        	  String preffix7 = "";
						        	  
						        	  if(hr3 > 12){
						        		  am_pm = "PM";
						        		  hr3 = hr3 - 12;
						        	  }else if(hr3 == 12){
						        		  am_pm = "PM";
						        	  }else{
						        		  am_pm = "AM";
						        	  }
						        	  
						        	  if(sm3.length() < 2){
						        		  preffix6 = "0";
						        	  }
						        	  
						        	  if(sh3.length() < 2){
						        		  preffix7 = "0";
						        	  }
						        	  
						        	  	
						        	  timeFormat = preffix7+hr3+":"+preffix6+mm3+" "+am_pm;
						        	  
						        	  
						        	  
				        	  %>
		              
		              	<%=timeFormat %>
		              		</td>
		              <% } %>
		              
		              <% if(t.getTotal_hours() == null){ %>
		              		<td>N/A</td>
		              <% }else{ %>
		              <%
		              String [] h = t.getTotal_hours().split(":");
		        	  
		        	  int hrTotal = Integer.parseInt(h[0]);
		        	  int mmTotal = Integer.parseInt(h[1]);
		        	  
		        	 
		        	  String hours = "";
		        	 if(hrTotal < 1){
		        		 hours = mmTotal+" minute(s)"; 
		        	 }else{
		        		 hours = hrTotal+"hr(s) "+mmTotal+"minute(s)";
		        	 }	
		              %>
		              		
		              		<td><%=hours %></td>
		              <% } %>
		              
		               <% if(t.getBreak_hours() == null){ %>
		              		<td>N/A</td>
		              <% }else{ %>
		              		<%
				              String [] h = t.getBreak_hours().split(":");
				        	  
				        	  int hrTotal = Integer.parseInt(h[0]);
				        	  int mmTotal = Integer.parseInt(h[1]);
				        	  
				        	 
				        	  String hours = "";
				        	 if(hrTotal < 1){
				        		 hours = mmTotal+" minute(s)"; 
				        	 }else{
				        		 hours = hrTotal+"hr(s) "+mmTotal+"minute(s)";
				        	 }	
				            %>
		              		
		              		<td><%=hours %></td>
		              		
		              <% } %>
		              
		              <% if(t.getTotal_pro_hours() == null){ %>
		              		<td>N/A</td>
		              <% }else{ %>
		              		<%
				              String [] h = t.getTotal_pro_hours().split(":");
				        	  
				        	  int hrTotal = Integer.parseInt(h[0]);
				        	  int mmTotal = Integer.parseInt(h[1]);
				        	  
				        	 String hours = "";
				        	 if(hrTotal < 1){
				        		 hours = mmTotal+" minute(s)"; 
				        	 }else{
				        		 hours = hrTotal+"hr(s) "+mmTotal+"minute(s)";
				        	 }	
				        	  
				            %>
		              		
		              		<td><%=hours %></td>
		              <% } %>
		              
		             
		        	</tr>
		        	<%} %>
		              
		             
		        	
		          
		        	
		        </tbody>
	       	</table>
	   	</div>
	   	
	    <% if(total >= count){%>
            
            <% }else{ %>
                
                <div class="col s12 center-align">
                 <ul class="pagination">
                 <% if(pageNumber-1 < 1){%>
                 <li class="disabled"><a href="#" ><i class="material-icons">chevron_left</i></a></li>
                 <% }else{ %>
                 <li class="waves-effect" id="1"><a href="employeesheet.jsp?page=<%= pageNumber-1%>" ><i class="material-icons">chevron_left</i></a></li>
                 <% } %>
                 
                <% for(int i=1; i<=pages; i++) {%>
                    
                 <li class="waves-effect" id="<%=i%>"><a href="employeesheet.jsp?page=<%=i%>" ><%=i%></a></li>   
                
                <% } %>
                
                <% if(pageNumber+1 > pages){%>
                 <li class="disabled"><a href="#"><i class="material-icons">chevron_right</i></a></li>
                 <% }else{ %>
                 <li class="waves-effect"><a href="employeesheet.jsp?page=<%= pageNumber+1%>"><i class="material-icons">chevron_right</i></a></li>
                 <% } %>
                 </ul>
               </div>
            
            
            <% } %> 
  
	</div>
	<div class="row hide-on-large-only">    
	   	<div class="card-panel" style="height: 90vh;">
	   		<table class="">
		        <thead>
		          <tr>
		          	  <th>Date</th>
		              <th>Time In</th>
		              <th>Break Start</th>
		              <th>Break End</th>
		              <th>Time Out</th>
		              <th>Total Duration</th>
		              <th>Total Break Duration</th>
		              <th>Total Productive Duration</th>
		          </tr>
		        </thead>
		        <tbody>
		        	
		        	<%for(TimeSheet t: list){ %>
		        	  <tr>
		        	  <td><%=t.getWorking_date() %></td>
	        	  
		              <td>
		              
		               <%
		        	  	
		        	  String [] timeIn = t.getTime_in().split(":");
		        	  
		        	  int hr = Integer.parseInt(timeIn[0]);
		        	  int mm = Integer.parseInt(timeIn[1]);
		        	  
		        	  String sm = String.valueOf(mm);
		        	  String sh = String.valueOf(hr);
		        	  
		        	  String preffix = "";
		        	  String preffix1 = "";
		        	  
		        	  if(hr > 12){
		        		  am_pm = "PM";
		        		  hr = hr - 12;
		        	  }else if(hr == 12){
		        		  am_pm = "PM";
		        	  }else{
		        		  am_pm = "AM";
		        	  }
		        	  
		        	  if(sm.length() < 2){
		        		  preffix = "0";
		        	  }
		        	  
		        	  if(sh.length() < 2){
		        		  preffix1 = "0";
		        	  }
		        	  
		        	  	
		        	  timeFormat = preffix1+hr+":"+preffix+mm+" "+am_pm;
		        	  %>
		              
		              <%=timeFormat %>
		              
		              </td>
		              
		              <% if(t.getBreak_time() == null){ %>
		              		<td>N/A </td>
		              <% }else{ %>
		              		<td>
		              		
				              <%
				        	  	
						        	  String [] timeIn1 = t.getBreak_time().split(":");
						        	  
						        	  int hr1 = Integer.parseInt(timeIn1[0]);
						        	  int mm1 = Integer.parseInt(timeIn1[1]);
						        	  
						        	  String sm1 = String.valueOf(mm1);
						        	  String sh1 = String.valueOf(hr1);
						        	  
						        	  String preffix2 = "";
						        	  String preffix3 = "";
						        	  
						        	  if(hr1 > 12){
						        		  am_pm = "PM";
						        		  hr1 = hr1 - 12;
						        	  }else if(hr1 == 12){
						        		  am_pm = "PM";
						        	  }else{
						        		  am_pm = "AM";
						        	  }
						        	  
						        	  if(sm1.length() < 2){
						        		  preffix2 = "0";
						        	  }
						        	  
						        	  if(sh1.length() < 2){
						        		  preffix3 = "0";
						        	  }
						        	  
						        	  	
						        	  timeFormat = preffix3+hr1+":"+preffix2+mm1+" "+am_pm;
						        	  
						        	  
						        	  if(t.getBreak_time().equals("00:00:00")){
						        		  timeFormat = "No Break";
		              					}
				        	  %>
		              
		              	<%=timeFormat %>
		              		
		              		</td>
		              <% } %>
		              
		              <% if(t.getBreak_time_out() == null){ %>
		              		<td>
		              		N/A
		              		 <% if(t.getBreak_time() != null){ %>
		              		 
		              		<% }%>
		              		
		              		</td>
		              <% }else{ %>
		              		<td>
		              		
		              		<%
				        	  	
						        	  String [] timeIn2 = t.getBreak_time_out().split(":");
						        	  
						        	  int hr2 = Integer.parseInt(timeIn2[0]);
						        	  int mm2 = Integer.parseInt(timeIn2[1]);
						        	  
						        	  String sm2 = String.valueOf(mm2);
						        	  String sh2 = String.valueOf(hr2);
						        	  
						        	  String preffix4 = "";
						        	  String preffix5 = "";
						        	  
						        	  if(hr2 > 12){
						        		  am_pm = "PM";
						        		  hr2 = hr2 - 12;
						        	  }else if(hr2 == 12){
						        		  am_pm = "PM";
						        	  }else{
						        		  am_pm = "AM";
						        	  }
						        	  
						        	  if(sm2.length() < 2){
						        		  preffix4 = "0";
						        	  }
						        	  
						        	  if(sh2.length() < 2){
						        		  preffix5 = "0";
						        	  }
						        	  
						        	  	
						        	  timeFormat = preffix5+hr2+":"+preffix4+mm2+" "+am_pm;
						        	  
						        	  if(t.getBreak_time().equals("00:00:00")){
						        		  timeFormat = "No Break";
		              					}
				        	  %>
		              
		              	<%=timeFormat %>
		              		</td>
		              <% } %>
		              
		              <% if(t.getTime_out() == null){ %>
		              		<td>
		              		N/A
		              		
		              		</td>
		              <% }else{ %>
		              		<td>
		              		<%
				        	  	
						        	  String [] timeIn3 = t.getTime_out().split(":");
		              		
		              		
		              					
						        	  
						        	  int hr3 = Integer.parseInt(timeIn3[0]);
						        	  int mm3 = Integer.parseInt(timeIn3[1]);
						        	  
						        	  String sm3 = String.valueOf(mm3);
						        	  String sh3 = String.valueOf(hr3);
						        	  
						        	  String preffix6 = "";
						        	  String preffix7 = "";
						        	  
						        	  if(hr3 > 12){
						        		  am_pm = "PM";
						        		  hr3 = hr3 - 12;
						        	  }else if(hr3 == 12){
						        		  am_pm = "PM";
						        	  }else{
						        		  am_pm = "AM";
						        	  }
						        	  
						        	  if(sm3.length() < 2){
						        		  preffix6 = "0";
						        	  }
						        	  
						        	  if(sh3.length() < 2){
						        		  preffix7 = "0";
						        	  }
						        	  
						        	  	
						        	  timeFormat = preffix7+hr3+":"+preffix6+mm3+" "+am_pm;
						        	  
						        	  
						        	  
				        	  %>
		              
		              	<%=timeFormat %>
		              		</td>
		              <% } %>
		              
		              <% if(t.getTotal_hours() == null){ %>
		              		<td>N/A</td>
		              <% }else{ %>
		              		<td><%=t.getTotal_hours() %></td>
		              <% } %>
		              
		               <% if(t.getBreak_hours() == null){ %>
		              		<td>N/A</td>
		              <% }else{ %>
		              		<td><%=t.getBreak_hours() %></td>
		              <% } %>
		              
		              <% if(t.getTotal_pro_hours() == null){ %>
		              		<td>N/A</td>
		              <% }else{ %>
		              		 <td><%=t.getTotal_pro_hours() %></td>
		              <% } %>
		              
		             
		        	</tr>
		        	<%} %>
		          
		        	
		        </tbody>
	       	</table>
	   	</div>
	   	
	    <% if(total >= count){%>
            
            <% }else{ %>
                
                <div class="col s12 center-align">
                 <ul class="pagination">
                 <% if(pageNumber-1 < 1){%>
                 <li class="disabled"><a href="#" ><i class="material-icons">chevron_left</i></a></li>
                 <% }else{ %>
                 <li class="waves-effect" id="1"><a href="sheet.jsp?page=<%= pageNumber-1%>" ><i class="material-icons">chevron_left</i></a></li>
                 <% } %>
                 
                <% for(int i=1; i<=pages; i++) {%>
                    
                 <li class="waves-effect" id="<%=i%>"><a href="sheet.jsp?page=<%=i%>" ><%=i%></a></li>   
                
                <% } %>
                
                <% if(pageNumber+1 > pages){%>
                 <li class="disabled"><a href="#"><i class="material-icons">chevron_right</i></a></li>
                 <% }else{ %>
                 <li class="waves-effect"><a href="sheet.jsp?page=<%= pageNumber+1%>"><i class="material-icons">chevron_right</i></a></li>
                 <% } %>
                 </ul>
               </div>
            
            
            <% } %> 
  
	</div>
	
	
	<%@ include file="med.jsp" %>
	
	<script type="text/javascript">



		$(document).ready(function(){
			$(".button-collapse").sideNav();
			var pageNo = "<%=pageNumber%>";
   
		    $('#'+pageNo).attr('class','waves-effect  teal lighten-2'); 
			
		}
	
	</script>
	<%@ include file="footer.jsp" %>	
		