<%@ include file="header.jsp" %>

<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.LocalTime" %>
<%@ page import="java.time.format.*" %>

<%@ page import="java.util.List" %>
<%@ page import="com.javawebapp.*" %>
<%@ page import="com.javawebapp.dao.*" %>


<%!
	
	LocalDate  now;
	LocalTime timeNow;

	Holiday holiday;
	
	String country;
	
	String email;
	
	String time;
	
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
	
	if(session.getAttribute("email") == null){
		response.sendRedirect("index.jsp");
	}
	
	
	email = String.valueOf(session.getAttribute("email"));
	
	
	pageid = Integer.parseInt(request.getParameter("page"));  
    
    pageNumber = Integer.parseInt(request.getParameter("page"));  
    
    total=5;
    
    if(pageid==1){
    }else{  
        pageid=pageid-1;  
        pageid=pageid*total+1;  
    } 
    
    int id = TimeInDao.getUserId(email);
    
    count = TimeSheetDao.getTimeSheetCount(id);
    
    double a = ((double) count)/total;
    pages = (int)Math.ceil(a);   

    list=TimeSheetDao.getTimeSheet(id, pageid, total);
    
    

	now = LocalDate.now();
	timeNow = LocalTime.now();
	
	formattedDate = now.format(DateTimeFormatter
		    .ofLocalizedDate(FormatStyle.FULL));
	
	String timeNowString = timeNow.toString();
	
	String [] times = timeNowString.split("\\.");
	
	
	country = UserCountryDao.getUserCountry(email);
	holiday = HolidayDao.getHoliday(country);

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
                    		<a href="sheet.jsp">Time Sheet</a>
                    <p>
                </div>
            </div>
        </div>
    </section>
</header>

<main>
	<div class="container">

	<div class="row">
	
		<div class="card-panel">
			<div class="row">
				<div class="col s6 m6 l3">
					<p class="teal-text text-lighten-2" style="font-size: 1.2em;">Today: <span class="black-text" ><%=formattedDate %></span></p>
				</div>
				<div class="col s6 m6 l3">
					<p class="teal-text text-lighten-2" style="font-size: 1.2em;">Holiday: <span class="black-text" ><%=holiday.getHolidayName() %></span></p>
				</div>
				<div class="col s6 m6 l3">
				<%if(country.equals("IN")){ %>
					<p class="teal-text text-lighten-2" style="font-size: 1.2em;">Country: <span class="black-text" >India</span></p>
				<%}else if(country.equals("DE")) { %>
					<p class="teal-text text-lighten-2" style="font-size: 1.2em;">Country: <span class="black-text" >Germany</span></p>					
				<%}else{ %>
					<p class="teal-text text-lighten-2" style="font-size: 1.2em;">Country: <span class="black-text" >United Kingdom</span></p>
				<%}%>
				</div>
				<div class="col s6 m6 l3">
					<p class="teal-text text-lighten-2" style="font-size: 1.2em;">Holiday Type: <span class="black-text" ><%=holiday.getHolidayType() %></span></p>
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
		              		<td>N/A <a class="btn-small btn-floating waves-effect waves-light teal lighten-3 add_break" id="<%=t.getId() %>-"><i class="material-icons">create</i></a></td>
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
		              		  <a class="btn-small btn-floating waves-effect waves-light teal lighten-3 add_break_over" id="<%=t.getId() %>-"><i class="material-icons">create</i></a>
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
		              		N/A <a class="btn-small btn-floating waves-effect waves-light teal lighten-3 add_time_out" id="<%=t.getId() %>-"><i class="material-icons">create</i></a>
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
		              <th>Total Pro Duration</th>
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
		              		<td>N/A <a class="btn-small btn-floating waves-effect waves-light teal lighten-3 add_break" id="<%=t.getId() %>-"><i class="material-icons">create</i></a></td>
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
		              		 <a class="btn-small btn-floating waves-effect waves-light teal lighten-3 add_break_over" id="<%=t.getId() %>-"><i class="material-icons">create</i></a>
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
		              		<a class="btn-small btn-floating waves-effect waves-light teal lighten-3 add_time_out" id="<%=t.getId() %>-"><i class="material-icons">create</i></a>
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
	
	<div class="fixed-action-btn">
		  <a class="btn-floating btn-large black">
		    <i class="large material-icons">menu</i>
		  </a>
		  <ul>
		  	<li><a class="btn-floating tooltipped green" data-position="left" data-delay="50" data-tooltip="Go to dashboard page" href="dashboard.jsp"><i class="material-icons">dashboard</i></a></li>
		    <li><a class="btn-floating tooltipped green" data-position="left" data-delay="50" data-tooltip="Go to education page" href="edu.jsp"><i class="material-icons">school</i></a></li>
		    <li><a class="btn-floating tooltipped yellow darken-1" data-position="left" data-delay="50" data-tooltip="Go to skills page" href="skill.jsp"><i class="material-icons">stars</i></a></li>
		  </ul>
		</div>
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
    
    var pageNo = "<%=pageNumber%>";
    
    
    
    
    $('#'+pageNo).attr('class','waves-effect  teal lighten-2'); 
    
    $(document).on('click','.add_break', function() {
    	
    	var id = $(this).attr('id');
    	
    	$.ajax({

            url: "updateBreakData.jsp",
            type: "POST",
            data:{id:id},
            success:function(data){
                 $("#del-creds").html(data);
                 $('#modal1').modal('open');
            }


       }); 
    	
    	
    	
    });
    
    
    $(document).on('click', '#upd', function(){
    	
		
    	//alert('Hello');
    	
        $.ajax({

            url: "saveUpdateBreak.jsp",
            type: "POST",
            data:$("#del-edu_form").serialize(),
            success:function(data){
           	 $('#modal1').modal('close');          	 
	         window.location.reload(true); 
            }
       });  


  });
    
    
$(document).on('click','.add_break_over', function() {
    	
    	var id = $(this).attr('id');
    	
    	$.ajax({

            url: "updateBreakOverData.jsp",
            type: "POST",
            data:{id:id},
            success:function(data){
                 $("#over-creds").html(data);
                 $('#modal2').modal('open');
            }


       }); 
    	
    	
    	
    });
    
    
    $(document).on('click', '#upd_over', function(){
    	

    	
        $.ajax({

            url: "saveUpdateBreakOver.jsp",
            type: "POST",
            data:$("#over-edu_form").serialize(),
            success:function(data){
           	 $('#modal2').modal('close');          	 
	         window.location.reload(true); 
            }
       });  


  });
    
    
$(document).on('click','.add_time_out', function() {
    	
    	var id = $(this).attr('id');
    	
    	var emp_id = '<%=list.get(0).getEmp_id()%>';
    	
    	$.ajax({

            url: "updateTimeOutData.jsp",
            type: "POST",
            data:{id:id,emp_id:emp_id},
            success:function(data){
                 $("#out-creds").html(data);
                 $('#modal3').modal('open');
            }


       }); 
    	
    	
    	
    });
    
    
    $(document).on('click', '#upd_out', function(){
    	

    	
        $.ajax({

            url: "saveUpdateTimeOut.jsp",
            type: "POST",
            data:$("#out-edu_form").serialize(),
            success:function(data){
           	  $('#modal3').modal('close');          	 
	        	window.location.reload(true);
            }
       });  


  });
    
    
    
    
});
</script>
	

<%@ include file="footer.jsp" %>



<!-- Modal for Deleting Employee Education Credentials-->
		  <div id="modal1" class="modal modal-fixed-footer" style="width: 30%; height:20%">
		  	<form method="POST" id="del-edu_form" action="#">
		    <div class="modal-content" >
		      <h4 class="center-align">Confirmation</h4>
		      
		      	<div class="row center-align" id="del-creds">
		      	
		      	</div>
		      
		    </div>
		    <div class="modal-footer">
		      <a href="#" class="modal-close waves-effect waves-light btn-flat teal white-text">No</a>
		      <a href="#" class="waves-effect waves-light btn-flat red white-text" id="upd">Yes</a>
		    </div>
		    </form>
		  </div>
		  
<!-- Modal for Deleting Employee Education Credentials-->
		  <div id="modal2" class="modal modal-fixed-footer" style="width: 30%; height:20%">
		  	<form method="POST" id="over-edu_form" action="#">
		    <div class="modal-content" >
		      <h4 class="center-align">Confirmation</h4>
		      
		      	<div class="row center-align" id="over-creds">
		      	
		      	</div>
		      
		    </div>
		    <div class="modal-footer">
		      <a href="#" class="modal-close waves-effect waves-light btn-flat teal white-text">No</a>
		      <a href="#" class="waves-effect waves-light btn-flat red white-text" id="upd_over">Yes</a>
		    </div>
		    </form>
		  </div>
		  
<!-- Modal for Deleting Employee Education Credentials-->
		  <div id="modal3" class="modal modal-fixed-footer" style="width: 30%; height:20%">
		  	<form method="POST" id="out-edu_form" action="#">
		    <div class="modal-content" >
		      <h4 class="center-align">Confirmation</h4>
		      
		      	<div class="row center-align" id="out-creds">
		      	
		      	</div>
		      
		    </div>
		    <div class="modal-footer">
		      <a href="#" class="modal-close waves-effect waves-light btn-flat teal white-text">No</a>
		      <a href="#" class="waves-effect waves-light btn-flat red white-text" id="upd_out">Yes</a>
		    </div>
		    </form>
		  </div>		  
		  