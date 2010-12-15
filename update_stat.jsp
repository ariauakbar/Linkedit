<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="connect.jsp"%>

<%

	String status = request.getParameter("status");
	String admin = "admin";
	String sess = (String) session.getAttribute("usersession");
	
	st.executeUpdate("INSERT INTO MsStatus (username, status) VALUES('"+sess+"', '"+status+"')");
	con.close();
	response.sendRedirect("home.jsp");

%>