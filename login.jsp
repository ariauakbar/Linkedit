<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="connect.jsp" %>

<%
	
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	
	if(username == "" || username == null || password == "" || password == null){
		response.sendRedirect("index.jsp");
	} else {
		rs = st.executeQuery("Select * from MsUsers where username = '"+username+"' and password = '"+password+"'");
		if(rs.next()){
			session.setAttribute("usersession", username);
			response.sendRedirect("home.jsp");
		} else {
			response.sendRedirect("index.jsp?err=error");
		}
	}

%>