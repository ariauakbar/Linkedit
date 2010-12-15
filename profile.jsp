<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@include file="connect.jsp"%>
<%@include file="css.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
	"http://www.w3.org/TR/html4/strict.dtd">
<html>
	<head>
		<meta http-equiv="Content-type" content="text/html; charset=utf-8">
		<title>profile</title>
		<%
				String userParam = request.getParameter("user");
				String username;
				if(session.getAttribute("usersession") == userParam){
					username = (String) session.getAttribute("usersession");
				}else {
					username = userParam;
				} 
		%>
	</head>
	<body id="profile" onload="">
	<div id="main_container">
		<div id="navigation">
			<a href="home.jsp">Home</a>
			<a href="profile.jsp">My Profile</a>
			<a href="logout.jsp">logout</a>
		</div>
	<div id="main_content">
		<p>My Profile<p>
		This is <%=username%> profile<br/>
		<h3>Status</h3>
			<form action="update_stat.jsp" method="post" accept-charset="utf-8">
				<label for="status">Status</label><input type="text" name="status" value="" id="status">
				<input type="submit" value="post">
			</form><br/>
		<%
			rs = st.executeQuery("SELECT * FROM MsStatus where username = '"+username+"' Order by id DESC LIMIT 0, 10");
			while(rs.next()) {
				
				String user = rs.getString("username");
				Integer id = rs.getInt("id");
				String usersession = (String) session.getAttribute("usersession");
		%>
				<a href="profile.jsp?user=<%=user%>"><%=rs.getString("username")%></a>
				<%=rs.getString("status")%> <br/>
					<% 
							rs = st.executeQuery("SELECT comments, username FROM MsComment where stat_id = "+id+"");
							while(rs.next()) {

								String comments = rs.getString("comments");
							//	out.print(comments);
					%>
							<%= rs.getString("username") %>
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