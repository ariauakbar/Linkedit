<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@include file="connect.jsp"%>

<%
	
	String message  = request.getParameter("message");
	String usernameTo = request.getParameter("to");
	String subject = request.getParameter("subject");
	String usernameFrom = (String) session.getAttribute("usersession");
	// Insert all message's data to MsMessage
	st.executeUpdate("INSERT INTO MsMessage (message, subject, usernameFrom, usernameTo) VALUES('"+message+"','"+subject+"','"+usernameFrom+"','"+usernameTo+"')");
	st.close(); // close the current statement
%>

	<%
		// Select the very last message stored by id (newest message)
		
		Statement stQuery = con.createStatement(1004, 1008); // create new statement
		rs = stQuery.executeQuery("SELECT * FROM MsMessage");
		rs.last();
		Integer message_id = rs.getInt("id");
	%>
	
<%
	Statement st2 = con.createStatement(1004, 1008);
	st2.executeUpdate("INSERT INTO DetailMessage (message_id, username) VALUES("+message_id+", '"+usernameFrom+"')");
	st2.close();
	
%>

<%
	Statement st3 = con.createStatement(1004, 1008);
	st3.executeUpdate("INSERT INTO DetailMessage (message_id, username) VALUES("+message_id+", '"+usernameTo+"')");
	st3.close();
	
	con.close();
	response.sendRedirect("message.jsp");
%>

