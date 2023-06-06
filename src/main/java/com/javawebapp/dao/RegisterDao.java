package com.javawebapp.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.javawebapp.ConnectionManager;
import com.javawebapp.Employee;

public class RegisterDao {
	
	
	
	public String insert(Employee employee) throws SQLException, ClassNotFoundException {
		Connection con = ConnectionManager.getConnection();
		String result = "Data entry successfull";
		String sql = "insert into employees(fname,lname,email,pass1,pass2,department,job,country,gender,question,answer) VALUES(?,?,?,?,?,?,?,?,?,?,?)";	
		PreparedStatement ps;
		
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, employee.getFname());
			ps.setString(2, employee.getLname());
			ps.setString(3, employee.getEmail());
			ps.setString(4, employee.getPass1());
			ps.setString(5, employee.getPass2());
			ps.setString(6, employee.getDepartment());
			ps.setString(7, employee.getJob());
			ps.setString(8, employee.getCountry());
			ps.setString(9, employee.getGender());
			ps.setString(10, employee.getQuestion());
			ps.setString(11, employee.getAnswer());
			
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
