<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="connect.jsp" %>

<%

	session.invalidate();
	response.sendRedirect("index.jsp");

%>
