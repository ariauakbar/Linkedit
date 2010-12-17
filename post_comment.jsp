<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="connect.jsp"%>

<%
	
	Integer id = Integer.parseInt(request.getParameter("id"));
	String comment = request.getParameter("comment");
	String username = request.getParameter("username");
	String source = request.getParameter("source");
	String userlogged = (String) session.getAttribute("usersession");
	
	
	st.executeUpdate("INSERT INTO MsComment (stat_id, username, comments) values("+id+", '"+username+"', '"+comment+"')");
	con.close();

	if(source.equals("profile")){
		response.sendRedirect("profile.jsp?user="+userlogged);
	}else if(source.equals("home")){
		response.sendRedirect("home.jsp");
	}
%>