<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@include file="connect.jsp"%>
<%@include file="global.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
	"http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
	<meta http-equiv="Content-type" content="text/html; charset=utf-8">
	<title>home</title>
	<link rel="stylesheet" href="style.css" type="text/css" media="screen" title="no title" charset="utf-8">
</head>
<body id="" onload="">
	<div id="header">
	<div id="navigation"> 
		<a href="home.jsp">Home</a>
		<a href="profile.jsp?user=<%= (String) session.getAttribute("usersession")%>">My Profile</a>
		<a href="logout.jsp">logout</a>
	</div>
	</div>
<div id="main_container">
	
<%
	String isLogged = (String) session.getAttribute("usersession");
	
	if(session.getAttribute("usersession") == null){
		
		response.sendRedirect("index.jsp?err=Login First");
	}
 //	out.print("hello,<br/>");
//out.print(session.getAttribute("usersession"));
%>
<br/>


<div id="left_content">
<div id="home-nav">
	<a href="#">News Feed</a><br/>
	<a href="message.jsp">Messages</a>
</div>
</div>

<div id="main_content">
	<div id="update_box">
	<form action="update_stat.jsp" method="post" accept-charset="utf-8" id="status">
		<input type="text" name="status" value="" id="status">
		<input type="submit" value="post">
	</form><br/>
	</div>
	<%	// nested query for Status + Comment
		Statement st2 = con.createStatement(1004, 1008);
		rs = st.executeQuery("SELECT * FROM MsStatus Order by id DESC LIMIT 0, 5"); // first Query
		ResultSet rs2 = null;
		while(rs.next()) {
		
			String username = rs.getString("username"); // tampung variable untuk link. rs.getString gak bisa ditulis 2x
			Integer id = rs.getInt("id");
			String usersession = (String) session.getAttribute("usersession");
			
			rs2 = st2.executeQuery("SELECT * FROM MsComment where stat_id = "+id+""); // 2nd Query
			
	%>			<div id="status_box">
				<a href="profile.jsp?user=<%=rs.getString("username")%>"><%=rs.getString("username")%><a/>
					<%=rs.getString("status")%>
					<% if(usersession.equals(username)){ %>
					<a href="delete_stat.jsp?id=<%=id%>">delete</a><br/>
					<% }else{
					out.print("<br/>");
						} %>
		<% 	
				while(rs2.next()) {
					String comments = rs2.getString("comments");
					String usernames = rs2.getString("username");
					Integer comment_id = rs2.getInt("id");
		%>		
				<div class="comment">
				<a href="profile.jsp?user=<%= usernames %>"><%=usernames%></a>
				<%= comments %><br/>
				<% if(usersession.equals(usernames)) { %>
				<a href="delete_comment.jsp?id=<%=comment_id%>&source=home">delete</a>
				<%} else {}%>
				</div>
		<%
			} 
		%>
		
		<form action="post_comment.jsp" method="post">
			<input type="hidden" name="id" value="<%=id%>" id="id">
			<input type="hidden" name="username" value="<%=usersession%>" id="username">
			<input type="hidden" name="source" value="home" id="source">
			<input type="text" name="comment" value="" id="comment">
			<input type="submit" value="post">
		</form>
		</div>
<%
	}
%>
</div>
</div>
</body>
</html>

