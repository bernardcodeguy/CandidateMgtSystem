package com.javawebapp.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.mindrot.jbcrypt.BCrypt;

import com.javawebapp.ConnectionManager;

public class LoginDao {

	public Boolean checkCredentials(String email,String password) {
		
		try {
			
			String sql = "SELECT * FROM employees WHERE email=?";
			
			Connection con = ConnectionManager.getConnection();
			
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, email);
			ResultSet rs = st.executeQuery();
			
			if(rs.next()) {
				
				String pass1 = rs.getString("pass1");
				Boolean match = BCrypt.checkpw(password, pass1);
				con.close();
				if(match || password.equals(pass1)) {
					return true;
				}
			}
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return false;
		
	}

}
