package com.javawebapp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.javawebapp.ConnectionManager;

public class EmailExistDao {
	
	public static boolean userExist(String email) throws ClassNotFoundException, SQLException {
		String sql = "SELECT * FROM employees WHERE email=? LIMIT 1";
		
		Connection con = ConnectionManager.getConnection();
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, email);
		
		ResultSet rs = ps.executeQuery();
		
		
		
		if(rs.next()) {
			con.close();
			return true;
		}else {
			con.close();
			return false;
		}
		
		
	}

}
