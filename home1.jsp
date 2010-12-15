<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@include file="connect.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
	"http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
	<meta http-equiv="Content-type" content="text/html; charset=utf-8">
	<title>home</title>
	
</head>
<body id="home" onload="">
<%
	if(session.getAttribute("usersession") == null){
		
		response.sendRedirect("index.jsp?err=Login First");
	}
 	out.print("hello,<br/>");
	out.print(session.getAttribute("usersession"));
%>
<br/>
<a href="home.jsp">Home</a>
<a href="profile.jsp">My Profile</a>
<a href="logout.jsp">logout</a>

<form action="update_stat.jsp" method="post" accept-charset="utf-8">
	<label for="status">Status</label><input type="text" name="status" value="" id="status">
	<input type="submit" value="post">
</form><br/>

<%
	rs = st.executeQuery("SELECT MsStatus.id, MsStatus.status, MsStatus.username, MsComment.comments FROM MsStatus LEFT JOIN MsComment ON MsStatus.id = MsComment.stat_id GROUP BY MsStatus.status, MsComment.comments ORDER BY id DESC LIMIT 0, 5");
	
	while(rs.next())
	{
		String username = rs.getString("username"); // tampung variable untuk link. rs.getString gak bisa ditulis 2x
		Integer id = rs.getInt("id");
		String usersession = (String) session.getAttribute("usersession");
%>
		<a href="profile.jsp?user=<%=rs.getString("username")%>"><%=rs.getString("username")%><a/>
		<%=rs.getString("status")%>
		<a href="delete_stat.jsp?id=<%=id%>">Delete</a><br/>
			<% if(rs.getString("comments") == null) { %>
					<%=""%>
			<% } else {%>
					Comment<br/>
					<%= rs.getString("comments")%>
			<% } %>
		<form action="post_comment.jsp" method="post">
			<input type="hidden" name="id" value="<%=id%>" id="id">
			<input type="hidden" name="username" value="<%=usersession%>" id="username">
			<input type="text" name="comment" value="" id="comment">
			<input type="submit" value="post">
		</form>
<%
	}
%>
</body>
</html>