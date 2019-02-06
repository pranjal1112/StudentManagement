<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*, java.util.Scanner" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student-DataRetrive</title>
</head>


<body>
	<%

	ResultSet rs=null;
	Connection con=null;
  try{
	
	String url="jdbc:mysql://localhost:3306/";
	String user="root";
	String pass="";
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection(url,user,pass);
	PreparedStatement pst=con.prepareStatement("");
	String sql ="select * from students";
	rs = pst.executeQuery(sql);
	con.close();
	 

 while(rs.next()){
%>
	<table border="1">
	<tr>
		<td> Name</td>
		<td> Id</td>
		<td> Branch</td>
		<td> </td>
    </tr>
	
	<tr>
	<td><%=rs.getString(1)  %></td>
	<td><%=rs.getString(2) %></td>
	<td><%=rs.getString(3) %></td>
	
	</tr>
	<%
 		}
  }catch(Exception e)
{
	e.printStackTrace();
}
     %>
	</table>  
</body>
</html>