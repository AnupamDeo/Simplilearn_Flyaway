<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Available Flight</title>
<style type="text/css">
	body{
		background-image: url("Available_flights1.jpg");
		background-repeat: no-repeat;
		background-size: cover;
}
</style>
</head>
<body>
<%!
Connection con;
PreparedStatement pstmt;
%>
<%
	
	String source=request.getParameter("source");
	String dest= request.getParameter("dest");
	String date= request.getParameter("date");

	if(source.equalsIgnoreCase(dest) || date.equals("")){
		response.sendRedirect("Homepage.html");
	}
	

	try{
		Class.forName("com.mysql.jdbc.Driver");
		con= DriverManager.getConnection("jdbc:mysql://localhost:3306/anupam","root","admin123");
		pstmt=con.prepareStatement("insert into intial_details values(?,?,?)");
		pstmt.setString(1, source);
		pstmt.setString(2, dest);
		pstmt.setString(3, date);

		pstmt.execute();
		System.out.println("Storing initial details into DB...");
	}
	catch(Exception e)
	{
		System.out.println(e);

	}
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		con= DriverManager.getConnection("jdbc:mysql://localhost:3306/anupam","root","admin123");
		PreparedStatement pstmt = con.prepareStatement("SELECT * FROM Flyaway_flights WHERE source = ? AND destination = ? AND date = ?");
		pstmt.setString(1, source);
		pstmt.setString(2, dest);
		pstmt.setString(3, date);
		ResultSet rs = pstmt.executeQuery();
	
		while(rs.next()){
			out.println("Source: "+rs.getString("source"));
			out.print("<br/>");
			out.print("<br/>");
			out.println("Destination: "+rs.getString("destination"));
			out.print("<br/>");
			out.print("<br/>");
			out.println("Airline: "+rs.getString("airline_name"));
			out.print("<br/>");
			out.print("<br/>");
			out.println("Ticket Price: "+rs.getInt("price"));
			out.print("<br/>");
			out.print("<br/>");
			out.println("Date: "+rs.getString("date"));
			out.print("<br/>");
			out.print("<br/>");
			out.println("Departure: "+rs.getString("departure_time"));

		}
	}
catch(Exception e)
		{
			System.out.println(e);

		}
	%>

		
	