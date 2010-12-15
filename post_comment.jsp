<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="connect.jsp"%>

<%
	
	Integer id = Integer.parseInt(request.getParameter("id"));
	String comment = request.getParameter("comment");
	String username = request.getParameter("username");
	
	
	st.executeUpdate("INSERT INTO MsComment (stat_id, username, comments) values("+id+", '"+username+"', '"+comment+"')");
	con.close();
	
	response.sendRedirect("home.jsp");

%>