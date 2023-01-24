<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Welcome</title>
</head>
<body>
	
<%
	String username= request.getParameter("username");
	String password= request.getParameter("upass");
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/flyaway", "root","root");
	Statement stmt=con.createStatement();
	ResultSet rs=stmt.executeQuery("Select * from admin");
		while(rs.next()){
			if(username.equalsIgnoreCase(rs.getString(1)) && password.equalsIgnoreCase(rs.getString(2)))
			{
				response.sendRedirect("AdminHome.html");
			}else{
				response.sendRedirect("Admin.html");
			}
		}	
	} catch (Exception e) {
		System.out.println(e);
	}
	
%>

</body>
</html>