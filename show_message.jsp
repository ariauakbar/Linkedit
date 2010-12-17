<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="connect.jsp"%>
<%@ include file="global.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
	"http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
	<meta http-equiv="Content-type" content="text/html; charset=utf-8">
	<title>message</title>
	<link rel="stylesheet" href="style.css" type="text/css" media="screen" title="no title" charset="utf-8">
	<%
		
		String userlogged = (String) session.getAttribute("usersession");
		Integer message_id = Integer.parseInt(request.getParameter("id"));
	
	%>
</head>
<body id="message" onload="">
<div id="main_container">
	<div id="navigation"> 
		<a href="home.jsp">Home</a>
		<a href="profile.jsp?user=<%=global_profile%>">My Profile</a>
		<a href="logout.jsp">logout</a>
	</div>	
	<div id="message_box">
		<a href="message.jsp"><input type="button" name="back_to_message" value="Back" id="back_to_message"></a><br/>
		<a href="new_message.jsp"><input type="button" name="new_message" value="New Message" id="new_message"></a><br/>
		<div class="message_list">
			<hr/>
	<%
	if(message_id != null){
		rs = st.executeQuery("SELECT * FROM MsMessage, DetailMessage WHERE MsMessage.id = DetailMessage.message_id AND DetailMessage.username = MsMessage.usernameTo AND DetailMessage.username = '"+userlogged+"' AND MsMessage.id = "+message_id+"");
		
		while(rs.next()) {
			
			String subject = rs.getString("subject");
			String usernameFrom = rs.getString("usernamefrom");
			Integer id = rs.getInt("message_id");
			String message = rs.getString("message");
	%>
		
		From: <a href="profile.jsp?user=<%=usernameFrom%>"><%= usernameFrom %></a><br/>
		Subject: <a href="show_message.jsp?id=<%=id%>"><%= subject %></a><br/>
		Message:<br/> <%=message%>
		<hr/>
	
	<%
		}
		con.close();
	}else{response.sendRedirect("home.jsp");}
	%>
		</div>
	</div>
</div>
	
</body>
</html>