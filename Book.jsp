<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Payment Page</title>
<style type="text/css">
	body{
		background-image: url("BookingConfirm.jpg");
		background-repeat: no-repeat;
		background-size: cover;
	}
</style>
</head>
<body>
<center>
<h1>Booking Confirmed</h1>
<%!
Connection con;
PreparedStatement pstmt;
%>
<%
	String source=request.getParameter("source");
	String dest= request.getParameter("dest");
	String fname=request.getParameter("fname");
	String lname= request.getParameter("lname");
	long mobile= Long.parseLong(request.getParameter("mobile"));
	String email= request.getParameter("email");
	int persons= Integer.parseInt(request.getParameter("persons"));
	String date= request.getParameter("date");
	
	if(source.equalsIgnoreCase(dest) || date.equals("") || fname.equals("") || lname.equals("") || email.equals(""))
	{
		response.sendRedirect("Book.html");
	}
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		con= DriverManager.getConnection("jdbc:mysql://localhost:3306/anupam","root","admin123");
		pstmt=con.prepareStatement("insert into user values(?,?,?,?,?)");
		pstmt.setString(1, fname);
		pstmt.setString(2, lname);
		pstmt.setLong(3, mobile);
		pstmt.setString(4, email);
		pstmt.setInt(5, persons);
		
		pstmt.execute();
		System.out.println("Added user details...");
	}
	catch(Exception e)
	{
		System.out.println(e);

	}
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
	Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/anupam", "root","admin123");
		Statement stmt=con.createStatement();
		ResultSet rs=stmt.executeQuery("Select * from available_flights");
			while(rs.next()){
				if(source.equalsIgnoreCase(rs.getString(1)) && dest.equalsIgnoreCase(rs.getString(2)))
				{
				
					out.println("Source: "+rs.getString(1));
					out.print("<br/>");
					out.println("Destination: "+rs.getString(2));
					out.print("<br/>");
					out.println("Airline: "+rs.getString(3));
					out.print("<br/>");
					out.println("Total Ticket Price: "+(rs.getInt(4))*persons);
					out.print("<br/>");
					out.println("Date: "+date);
					out.print("<br/>");
					out.println("Departure: "+rs.getString(5));
					out.print("<br/>"); 
					out.println("First Name: "+ fname); 
					out.print("<br/>");
					out.println("Last Name: "+ lname);
					out.print("<br/>");
					out.println("Mobile no: "+ mobile);
					out.print("<br/>");
					out.println("Email id: "+ email);
					out.print("<br/>");
					out.print("<br/>");
					
				}
			 }
		}
		catch(Exception e)
		{
			System.out.println(e);
		} 
		
		long card= Long.parseLong(request.getParameter("card"));
		String holder= request.getParameter("holder");
		int month= Integer.parseInt(request.getParameter("month"));
		int year= Integer.parseInt(request.getParameter("year"));
		int cvv= Integer.parseInt(request.getParameter("cvv"));
		
		if(holder.equals("")){
			response.sendRedirect("Book.html");
		}
		 try{
			Class.forName("com.mysql.jdbc.Driver");
			con= DriverManager.getConnection("jdbc:mysql://localhost:3306/flyaway","root","root");
			pstmt=con.prepareStatement("insert into payment values(?,?,?,?,?)");
			pstmt.setLong(1, card);
			pstmt.setString(2, holder);
			pstmt.setInt(3, month);
			pstmt.setInt(4, year);
			pstmt.setInt(5, cvv);
			
			pstmt.execute();
			System.out.println("Payment done");
		}
		catch(Exception e)
		{
			System.out.println(e);
		} 
%>
<form action="Welcome.html">
<input type="submit" value="Home">
</form>
</center>
</body>
</html>