package com.javawebapp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

import com.javawebapp.ConnectionManager;
import com.javawebapp.TimeSheet;

public class TimeSheetDao {
	
	
	
	
	public static List<TimeSheet> getTimeSheet(int emp_id,int start,int total) throws ClassNotFoundException, SQLException{
		
		String sql = "SELECT id,emp_id,DATE_FORMAT(working_date,\"%e %M, %Y\") AS working_date,time_in,break_time,break_time_out,time_out,total_hours,break_hours,total_pro_hours FROM time_sheet WHERE emp_id="+emp_id+" ORDER BY working_date DESC LIMIT "+(start-1)+","+total;
		
		Connection con = ConnectionManager.getConnection();
		
		Statement st = con.createStatement();
		
		ResultSet rs = st.executeQuery(sql);
		
		List<TimeSheet> list = new ArrayList<>();
		
		while(rs.next()) {
			TimeSheet t = new TimeSheet();
			
			t.setId(rs.getInt("id"));
			t.setEmp_id(rs.getInt("emp_id"));
			t.setWorking_date(rs.getString("working_date"));
			t.setTime_in(rs.getString("time_in"));
			
			t.setBreak_time(rs.getString("break_time"));
		
		
		
			t.setBreak_time_out(rs.getString("break_time_out"));
		
		
		
			t.setTime_out(rs.getString("time_out"));
		
		
		
			t.setTotal_hours(rs.getString("total_hours"));
		
		
		
			t.setBreak_hours(rs.getString("break_hours"));
		
		
		
			t.setTotal_pro_hours(rs.getString("total_pro_hours"));
			
		
			
			list.add(t);
			
		}
		
		con.close();
		
		return list;
		
	}
	
public static int getTimeSheetCount(int emp_id) throws ClassNotFoundException, SQLException{
		
		String sql = "SELECT COUNT(*) FROM time_sheet WHERE emp_id="+emp_id;
		
		Connection con = ConnectionManager.getConnection();
		
		Statement st = con.createStatement();
		
		ResultSet rs = st.executeQuery(sql);
		
		int count = 0;
		
		if(rs.next()) {
			
			count = rs.getInt(1);
		}
		
		con.close();
		
		return count;
		
	}


public static String getBreakTime(int emp_id) throws ClassNotFoundException, SQLException{
	String now = LocalDate.now().toString();
	
	String sql = "SELECT break_time FROM time_sheet WHERE emp_id="+emp_id+" AND working_date=?";;
	
	Connection con = ConnectionManager.getConnection();
	
	PreparedStatement ps = con.prepareStatement(sql);
	
	ps.setString(1, now);
	
	ResultSet rs = ps.executeQuery();
	
	String break_time = "";
	
	if(rs.next()) {
		
		break_time = rs.getString("break_time");
	}
	
	con.close();
	return break_time;
	
}


public static String getBreakOver(int emp_id) throws ClassNotFoundException, SQLException{
	String now = LocalDate.now().toString();
	
	String sql = "SELECT break_time_out FROM time_sheet WHERE emp_id="+emp_id+" AND working_date=?";
	
	Connection con = ConnectionManager.getConnection();
	
	PreparedStatement ps = con.prepareStatement(sql);
	
	ps.setString(1, now);
	
	ResultSet rs = ps.executeQuery();
	
	String break_time_out = "";
	
	if(rs.next()) {
		
		break_time_out = rs.getString("break_time_out");
	}else {
		break_time_out = "N/A";
	}
	
	con.close();
	
	return break_time_out;
	
}

public static String getTimeIn(int emp_id) throws ClassNotFoundException, SQLException{
	String now = LocalDate.now().toString();
	
	String sql = "SELECT time_in FROM time_sheet WHERE emp_id="+emp_id+" AND working_date=?";
	
	Connection con = ConnectionManager.getConnection();
	
	PreparedStatement ps = con.prepareStatement(sql);
	
	ps.setString(1, now);
	
	ResultSet rs = ps.executeQuery();
	
	String time_in = "";
	
	if(rs.next()) {
		
		time_in = rs.getString("time_in");
	}else {
		time_in = "N/A";
	}
	
	con.close();
	
	return time_in;
	
}

public static String getTimeOut(int emp_id) throws ClassNotFoundException, SQLException{
	
	String now = LocalDate.now().toString();
	
	
	String sql = "SELECT time_out FROM time_sheet WHERE emp_id="+emp_id+" AND working_date=?";
	
	Connection con = ConnectionManager.getConnection();
	
	PreparedStatement ps = con.prepareStatement(sql);
	
	ps.setString(1, now);
	
	ResultSet rs = ps.executeQuery();
	
	String time_out = "";
	
	if(rs.next()) {
		
		time_out = rs.getString("time_out");
	}else {
		time_out = "N/A";
	}
	
	con.close();
	
	return time_out;
	
}


}
