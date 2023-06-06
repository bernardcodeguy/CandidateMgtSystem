package com.javawebapp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.javawebapp.ConnectionManager;

public class UserCountryDao {
	
	
	public static String getUserCountry(String email) throws Exception {
		
		String sql = "SELECT country FROM employees WHERE email=?";
		
		
		Connection con = ConnectionManager.getConnection();
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, email);
		
		ResultSet rs = ps.executeQuery();
		
		String country = "";
		
		if(rs.next()) {
			if(rs.getString("country").contains("Germany")) {
				country = "DE";
			}else if(rs.getString("country").contains("India")) {
				country = "IN";
			}else {
				country = "GB";
			}
		}
		
		con.close();
		
		return country;
		
	}

}
