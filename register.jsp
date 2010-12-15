<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@include file="connect.jsp"%>
<%

	String firstname = request.getParameter("firstname");
	String lastname = request.getParameter("lastname");
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	String email = request.getParameter("email");
	String gender = request.getParameter("gender");
	//String birthdayYear = request.getParameter("birthday_year");
	//String birthdayMonth = request.getParameter("birthday_month");
	//String birthdayDate = request.getParameter("birthday_date");
	
	
	st.executeUpdate("INSERT INTO MsUsers (firstname, lastname, username, email, password, gender) VALUES('"+firstname+"','"+lastname+"','"+username+"','"+email+"', '"+password+"', '"+gender+"')");
	con.close();
	
	response.sendRedirect("index.jsp?err=Registrasi sukses silahkan login");
%>