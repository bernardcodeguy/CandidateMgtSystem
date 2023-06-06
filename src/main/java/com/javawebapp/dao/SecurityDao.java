package com.javawebapp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.javawebapp.ConnectionManager;
import com.javawebapp.Employee;

public class SecurityDao {
	
	public String insert(String email,String question,String answer) throws SQLException, ClassNotFoundException {
		Connection con = ConnectionManager.getConnection();
		
		String sql = "SELECT pass1 FROM employees WHERE email=? AND question=? AND answer=?";	
		PreparedStatement ps;
		ResultSet rs;
		
		String password = "";
		
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, question);
			ps.setString(3, answer);
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
				password = rs.getString("pass1");
			}else {
				password = "Not Found";
			}
			
			con.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
		
		return password;
		
	}

}
