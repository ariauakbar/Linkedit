<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@include file="connect.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
	"http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
	<meta http-equiv="Content-type" content="text/html; charset=utf-8">
	<title>home</title>
	<link rel="stylesheet" href="style.css" type="text/css" media="screen" title="no title" charset="utf-8">
</head>
<body id="" onload="">
<div id="main_container">
	
<%
	if(session.getAttribute("usersession") == null){
		
		response.sendRedirect("index.jsp?err=Login First");
	}
 	out.print("hello,<br/>");
	out.print(session.getAttribute("usersession"));
%>
<br/>
<div id="navigation"> 
	<a href="home.jsp">Home</a>
	<a href="profile.jsp">My Profile</a>
	<a href="logout.jsp">logout</a>
</div>

<div id="home-nav">
	<a href="#">News Feed</a><br/>
	<a href="#">Messages</a>
</div>

<div id="main_content">
	<form action="update_stat.jsp" method="post" accept-charset="utf-8">
		<label for="status">Status</label><input type="text" name="status" value="" id="status">
		<input type="submit" value="post">
	</form><br/>
	<%	
		rs = st.executeQuery("SELECT * FROM MsStatus Order by id DESC LIMIT 0, 10");
	
		while(rs.next()) {
		
			String username = rs.getString("username"); // tampung variable untuk link. rs.getString gak bisa ditulis 2x
			Integer id = rs.getInt("id");
			String usersession = (String) session.getAttribute("usersession");
	%>
			<a href="profile.jsp?user=<%=rs.getString("username")%>"><%=rs.getString("username")%><a/>
				<%=rs.getString("status")%>
				<% if(usersession.equals(username)){ %>
					<a href="delete_stat.jsp?id=<%=id%>">Delete</a><br/> // showing delete if the user match
				<% } else { out.print("<br/>"); } %>
		<% 
				rs = st.executeQuery("SELECT comments, username FROM MsComment where stat_id = "+id+"");
				
				while(rs.next()) {

					String comments = rs.getString("comments");
					String usernames = rs.getString("username");
				//	out.print(comments);
		%>
				<%= usernames %>
				<%= comments %><br/>
		<%
			}
		%>
		
		<form action="post_comment.jsp" method="post">
			<input type="hidden" name="id" value="<%=id%>" id="id">
			<input type="hidden" name="username" value="<%=usersession%>" id="username">
			<input type="text" name="comment" value="" id="comment">
			<input type="submit" value="post">
		</form>
<%
	}
%>
</div>
</div>
</body>
</html>

