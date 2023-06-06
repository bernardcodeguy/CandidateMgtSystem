package com.javawebapp.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.javawebapp.ConnectionManager;
import com.javawebapp.Employee;

public class DashboardDao {
	
	
	public Employee getEmployee(String email) {
		
		Employee employee = null;
		
		try {
			employee = new Employee();
			
			String sql = "SELECT * FROM employees WHERE email=?";
			Connection con = ConnectionManager.getConnection();
			
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, email);
			ResultSet rs = st.executeQuery();
			
			if(rs.next()) {
				employee.setId(rs.getInt("id"));
				employee.setFname(rs.getString("fname"));
				employee.setLname(rs.getString("lname"));
				employee.setEmail(rs.getString("email"));
				employee.setPass1(rs.getString("pass1"));
				employee.setPass2(rs.getString("pass2"));
				employee.setDepartment(rs.getString("department"));
				employee.setJob(rs.getString("job"));
				employee.setSalary(rs.getString("salary"));
				employee.setIs_approved(rs.getInt("is_approved"));
			}
			
			con.close();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return employee;
		
		
		
		
	}

}
