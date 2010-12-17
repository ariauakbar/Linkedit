<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@include file="connect.jsp"%>

<%

	Integer id = Integer.parseInt(request.getParameter("id"));
	String source = request.getParameter("source");
	String userLogged = (String) session.getAttribute("usersession");
	
	st.executeUpdate("Delete from MsStatus where id = "+id+"");
	con.close();
	
	if(source.equals("profile")){
		response.sendRedirect("profile.jsp?user="+userLogged);
	}else{
		response.sendRedirect("home");
	}
%>