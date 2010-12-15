<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%

	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8889/fb2", "root", "root");

	Statement st = con.createStatement(1004,1008);
	ResultSet rs;

%>