package com.javawebapp.dao;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.javawebapp.ConnectionManager;
import com.javawebapp.Employee;

public class SaveImgDao {
	
	
	
	public String insert(int id, InputStream img) throws SQLException, ClassNotFoundException {
		Connection con = ConnectionManager.getConnection();
		String result = "Data entry successfull";
		String sql = "UPDATE employees SET img=? WHERE id=? ";	
		PreparedStatement ps;
		
		try {
			ps = con.prepareStatement(sql);
			ps.setBlob(1, img);
			ps.setInt(2, id);
		
			ps.executeUpdate();
			
			con.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result = "Data entry unsuccessfull";
		}
		
		return result;	
	}
}
