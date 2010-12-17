<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@include file="connect.jsp"%>

<%
	
	Integer id = Integer.parseInt(request.getParameter("id"));
	String source = request.getParameter("source");
	String userlogged = (String) session.getAttribute("usersession");
	
	st.executeUpdate("delete from MsComment where id = "+id+"");
	con.close();
	
	if(source.equals("home")){
		response.sendRedirect("home.jsp");
	}else if(source.equals("profile")){
		response.sendRedirect("profile.jsp?user="+userlogged);
	}
	
%>