<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@include file="connect.jsp"%>

<%

	Integer id = Integer.parseInt(request.getParameter("id"));
	
	st.executeUpdate("Delete from MsStatus where id = "+id+"");
	con.close();
	
	response.sendRedirect("home.jsp");

%>