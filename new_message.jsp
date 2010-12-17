<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@include file="connect.jsp"%>
<html>
<head>
	<meta http-equiv="Content-type" content="text/html; charset=utf-8">
	<title>new_message</title>
	<link rel="stylesheet" href="style.css" type="text/css" media="screen" title="no title" charset="utf-8">
	<%
		String userlogged = (String) session.getAttribute("usersession");
		String to = request.getParameter("to");
	%>
</head>
<body id="new_message" onload="">
<div id="main_container">
	
<div id="navigation"> 
	<a href="home.jsp">Home</a>
	<a href="profile.jsp">My Profile</a>
	<a href="logout.jsp">logout</a>
</div>	
	
	<div id="new_message_box">
	<a href="message.jsp"><input type="button" name="back_to_message" value="Back" id="back_to_message"></a><br/>
	<form id="new_message_form" action="post_message.jsp" method="post" accept-charset="utf-8">
		<p align="left">		
		<% if(to != null) {%>
		<label for="to">To</label><input type="text" name="to" value="<%=to%>" id="to"><br/>
		<%} else {%>
		<label for="to">To</label><input type="text" name="to" value="" id="to"><br/>
		<%}%>
		<label for="subject">Subject:</label><input type="text" name="subject" value="" id="subject"><br/>
		<label for="message">Message</label>
		<textarea name="message" rows="8" cols="40"></textarea>
		<p><input type="submit" value="send"></p>
		</p>
	</form>
	</div>
</div>
</body>
</html>