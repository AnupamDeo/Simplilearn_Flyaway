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
<center>
<h1>Available Flights</h1>
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
		Statement stmt=con.createStatement();
		ResultSet rs=stmt.executeQuery("Select * from _Flyaway_flights");
		while(rs.next()){
			if(source.equalsIgnoreCase(rs.getString(1)) && dest.equalsIgnoreCase(rs.getString(2))){
				out.println("Source: "+rs.getString(1));
				out.print("<br/>");
				out.print("<br/>");
				out.println("Destination: "+rs.getString(2));
				out.print("<br/>");
				out.print("<br/>");
				out.println("Airline: "+rs.getString(3));
				out.print("<br/>");
				out.print("<br/>");
				out.println("Ticket Price: "+rs.getInt(4));
				out.print("<br/>");
				out.print("<br/>");
				out.println("Date: "+date);
				out.print("<br/>");
				out.print("<br/>");
				out.println("Departure: "+rs.getString(5));
				out.print("<br/>");
				out.print("<br/>");
			}
		
		}
		System.out.println("Displaying flights...");
	}
	catch(Exception e)
	{
		System.out.println(e);

	}
%>
<form action="Book.html">
<input type="submit" value="Book Flight">
</form>
</center>
</body>
</html>