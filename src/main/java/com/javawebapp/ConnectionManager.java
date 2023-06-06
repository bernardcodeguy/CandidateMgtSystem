package com.javawebapp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionManager {
	
	
	public static Connection getConnection() throws SQLException, ClassNotFoundException {
		String url = "jdbc:mysql://eu-cdbr-west-03.cleardb.net/heroku_526313a38b560ae";
		String username = "b0c2a51540887e";
		String pass = "82fd3e43";
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection(url,username,pass);
		return con;
	}

}
