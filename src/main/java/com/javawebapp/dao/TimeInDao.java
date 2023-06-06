package com.javawebapp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalTime;

import com.javawebapp.ConnectionManager;

public class TimeInDao {
	
	
	public static int getUserId(String email) throws ClassNotFoundException, SQLException {
		String sql = "SELECT id FROM employees WHERE email=?";
		
		Connection con = ConnectionManager.getConnection();
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, email);
		
		ResultSet rs = ps.executeQuery();
		
		int id = 0;
		
		if(rs.next()) {
			id = rs.getInt("id");
		}
		
		con.close();
		
		return id;
	}
	
	
	public static void signIn(int id) throws ClassNotFoundException, SQLException {
		
		String sql = "INSERT INTO time_sheet(emp_id,working_date,time_in) SELECT * FROM (SELECT ? AS emp_id, ? AS working_date, ? AS time_in) AS new_value WHERE NOT EXISTS (SELECT working_date,emp_id FROM time_sheet WHERE working_date = ? AND emp_id=?) LIMIT 1";
		//String sql = "INSERT INTO time_sheet(emp_id,working_date,time_in) VALUES(?,?,?)";
		
		Connection con = ConnectionManager.getConnection();
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		String now = LocalDate.now().toString();
		LocalTime timeNow = LocalTime.now();
		
		String timeNowString = timeNow.toString();
		
		String [] times = timeNowString.split("\\.");
		
		ps.setInt(1, id);
		ps.setString(2, now);
		ps.setString(3, times[0]);
		ps.setString(4, now);
		ps.setInt(5, id);
		
		ps.executeUpdate();
		
		con.close();
	}

}
