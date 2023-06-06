<%@page import="com.javawebapp.ConnectionManager"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.time.LocalTime" %>
<%@ page import="java.time.format.*" %>
<%@page import="com.javawebapp.dao.*"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.*" %>


<%!
public String timeDiff(String time1,String time2) throws Exception{
	 long differenceBreakInMilliSeconds = 0;
	 
	 long differenceInHours = 0;
	 
	 long differenceInMinutes = 0;
	 
	 long differenceInSeconds = 0;
	 	
	 SimpleDateFormat simpleDateFormat = new SimpleDateFormat("HH:mm");
	 
	 Date date = simpleDateFormat.parse(time1);
	 Date date1 = simpleDateFormat.parse(time2);
	
	 
	 differenceBreakInMilliSeconds = Math.abs(date.getTime() - date1.getTime());
	    
   	differenceInHours = (differenceBreakInMilliSeconds / (60 * 60 * 1000)) % 24;
    
    differenceInMinutes = (differenceBreakInMilliSeconds / (60 * 1000)) % 60;
    
    //differenceInSeconds = (differenceBreakInMilliSeconds / 1000) % 60; 
    
    String hr = String.valueOf(differenceInHours);
	String m = String.valueOf(differenceInMinutes);
	//String sec = String.valueOf(differenceInSeconds);
	
	String pre1="",pre2="",pre3="";
	
	
	
	if(hr.length() < 2){
		pre1 = "0";
	}
	
	if(m.length() < 2){
		pre2 = "0";
	}
	
	
	
	
    

	return pre1+differenceInHours+":"+pre2+differenceInMinutes;
} 






%>

<%


	int id = Integer.parseInt(request.getParameter("id"));
	
	int emp_id = Integer.parseInt(request.getParameter("emp_id"));
	

	 LocalTime timeNow = LocalTime.now();
	
	String timeNowString = timeNow.toString();
	
	String [] times = timeNowString.split("\\.");
	
	
	String time_in = TimeSheetDao.getTimeIn(emp_id);
	
	String break_in = TimeSheetDao.getBreakTime(emp_id);
	
	String break_out = TimeSheetDao.getBreakOver(emp_id);
	
	String time_out = times[0];
	
	
	 
	
	if(break_in == null){
		break_in = "00:00:00";
		break_out = "00:00:00";
	}
	
	
	
	
	 
	 
	
   

   
	
	String breakHours = timeDiff(break_in,break_out);

	
	String totalHours = timeDiff(time_in,time_out);
	

	  
	String totalProHours = timeDiff(breakHours,totalHours);
	

    
    
	String sql = "UPDATE time_sheet SET time_out=?,total_hours=?,break_hours=?,total_pro_hours=? WHERE id=?";
	
	Connection con = ConnectionManager.getConnection();
	PreparedStatement ps = con.prepareStatement(sql);

	
	ps.setString(1, time_out);
	ps.setString(2, totalHours);
	ps.setString(3, breakHours);
	ps.setString(4, totalProHours);
	ps.setInt(5, id);
	
	ps.executeUpdate(); 
	
	con.close();  
	
	//out.println(totalProHours);
	//out.println(emp_id);
	
%>


