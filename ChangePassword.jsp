<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String username= request.getParameter("username");
	String oldpassword= request.getParameter("oldpass");
	String newpassword= request.getParameter("newpass");

	 try {
		Class.forName("com.mysql.jdbc.Driver");
Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/flyaway", "root","root");
	Statement stmt=con.createStatement();
	ResultSet rs=stmt.executeQuery("Select * from admin");
		while(rs.next()){
			if(username.equalsIgnoreCase(rs.getString(1)) && oldpassword.equalsIgnoreCase(rs.getString(2)))
			{ 
				 try {
					Class.forName("com.mysql.jdbc.Driver");
			Connection connect= DriverManager.getConnection("jdbc:mysql://localhost:3306/flyaway", "root","root");
				PreparedStatement pstmt=connect.prepareStatement("update admin set password=? where username= ?");
				pstmt.setString(1, newpassword);
				pstmt.setString(2, username);
				pstmt.execute();
				pstmt.close();
				System.out.println("password updated");
				
				response.sendRedirect("PasswordChangeSuccess.html");
				} catch (Exception e) {
					System.out.println(e);
				} 
			  }else{
				System.out.println("Incorrect details");
				response.sendRedirect("ChangePassword.html");
			}
		}	
	} catch (Exception e) {
		System.out.println(e);
	} 

%>
</body>
</html>