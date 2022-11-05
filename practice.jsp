package com.uniquedeveloper.registration;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//import com.sun.jdi.connect.spi.Connection;

/**
 * Servlet implementation class login
 */
@WebServlet("/home")
public class home extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String city=request.getParameter("Location");
		
		HttpSession session=request.getSession();
		//RequestDispatcher dispatcher=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/assignment?useSSL=false","root","Himanshu");
			PreparedStatement ps=conn.prepareStatement("select  English,maths,Chemistry,Physics,Biology,History,Geography from student");
			
			
			
			ResultSet rs=ps.executeQuery();
			int sum=0;
			float avg=0;
			int pass=0;
			int fail=0;
			int count=0;
			while(rs.next())
			{
				count++;
				sum=0;
				avg=0;
				int eng=rs.getInt(1);
				int math=rs.getInt(2);
				int che=rs.getInt(3);
				int phy=rs.getInt(4);
				int bio=rs.getInt(5);
				int his=rs.getInt(6);
				int gio=rs.getInt(7);
				
				sum=eng+math+che+phy+bio+his+gio;
				avg=sum/7;
				
				if(avg >=3.5) {
					pass++;
				}else {
					fail++;
				}	
			}
			
			int passPercentage=(pass*100)/count;
			int failPercentage=(100-passPercentage);
			
			
			
			request.setAttribute("pass",passPercentage);
			request.setAttribute("fail",failPercentage);
			
			RequestDispatcher rd = 
		             request.getRequestDispatcher("NewFile.jsp");
			rd.forward(request,response);
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
			
	}

}
