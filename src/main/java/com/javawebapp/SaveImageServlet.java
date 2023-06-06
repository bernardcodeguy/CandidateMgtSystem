package com.javawebapp;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.javawebapp.dao.SaveImgDao;

/**
 * Servlet implementation class SaveImageServlet
 */
@WebServlet("/saveimage")
@MultipartConfig(maxFileSize=161772150)
public class SaveImageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int empid = Integer.parseInt(request.getParameter("empid"));
	
		InputStream img = null ;
		
		SaveImgDao dao = new SaveImgDao();
		
		Part part = request.getPart("img");
		String result = "";
		if(!part.getContentType().contains("image")) {
			response.getWriter().print("Image type NOT supported!!");
			
		}else {
			img = part.getInputStream();
			
			try {
				result = dao.insert(empid, img);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			if(result.equals("Data entry successfull")) {
				response.sendRedirect("profile.jsp");
			}
			
			
		}
	
	}
	
	 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		  int id = Integer.parseInt(request.getParameter("id"));
		  
			String sql = "SELECT * FROM employees WHERE id=?";
			
			try {
			
			Connection con = ConnectionManager.getConnection();
			
			PreparedStatement ps;
		  
		   ps = con.prepareStatement(sql);
		   ps.setInt(1, id);
		   
		   ResultSet rs1 = ps.executeQuery();
		   if(rs1.next()){
		    byte [] imageData = rs1.getBytes("img"); // extract byte data from the resultset..
		    OutputStream os = response.getOutputStream(); // output with the help of outputStream 
		             os.write(imageData);
		             os.flush();
		             os.close();
		   }
		  } catch (Exception e) {
		   // TODO Auto-generated catch block
		   e.printStackTrace();
		   response.getOutputStream().flush();
		   response.getOutputStream().close();
		  }

	 }
}