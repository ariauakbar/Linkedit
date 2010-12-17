<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@include file="connect.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
	"http://www.w3.org/TR/html4/strict.dtd">
<html>
	<head>
		<meta http-equiv="Content-type" content="text/html; charset=utf-8">
		<title>profile</title>
		<%
				String userParam = request.getParameter("user");
				String userlogged;
				if(session.getAttribute("usersession") == userParam){
					userlogged = (String) session.getAttribute("usersession");
				}else {
					userlogged = userParam;
				}
				String userNow = (String) session.getAttribute("usersession");
		%>
		<link rel="stylesheet" href="style.css" type="text/css" media="screen" title="no title" charset="utf-8">
	</head>
<body id="profile" onload="">
	<div id="main_container">
		<div id="navigation">
			<a href="home.jsp">Home</a>
			<a href="profile.jsp?user=<%= (String) session.getAttribute("usersession")%>">My Profile</a>
			<a href="logout.jsp">logout</a>
		</div>
	<div id="main_content">
		<p>My Profile<p>
		This is <%=userlogged%> profile<br/>
		<%if(!userNow.equals(userParam)){%>
		<a href="new_message.jsp?to=<%=userParam%>">Send message</a>
		<%}%>
		<h3>Status</h3>
			<div id="main_content">
				<form action="update_stat.jsp" method="post" accept-charset="utf-8">
					<label for="status">Status</label><input type="text" name="status" value="" id="status">
					<input type="submit" value="post">
				</form><br/>
				<%	// nested query for Status + Comment
					Statement st2 = con.createStatement(1004, 1008);
					rs = st.executeQuery("SELECT * FROM MsStatus where username = '"+userlogged+"' Order by id DESC LIMIT 0, 5"); // first Query
					ResultSet rs2 = null;
					while(rs.next()) {

						String username = rs.getString("username"); // tampung variable untuk link. rs.getString gak bisa ditulis 2x
						Integer id = rs.getInt("id");
						String usersession = (String) session.getAttribute("usersession");
						rs2 = st2.executeQuery("SELECT * FROM MsComment where stat_id = "+id+""); // 2nd Query

				%>
							<a href="profile.jsp?user=<%=rs.getString("username")%>"><%=rs.getString("username")%><a/>
							<div id="status_box">
								<%=rs.getString("status")%>
								<% if(usersession.equals(username)){ %>
								<a href="delete_stat.jsp?id=<%=id%>&source=profile">delete</a><br/>
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
							<a href="delete_comment.jsp?id=<%=comment_id%>&source=profile">delete</a>
							<%} else {}%>
							</div>
					<%
						} 
					%>
					<div id= "comment_status">
					<form action="post_comment.jsp" method="post" id="comment">
						<input type="hidden" name="id" value="<%=id%>" id="id">
						<input type="hidden" name="username" value="<%=usersession%>" id="username">
						<input type="hidden" name="source" value="profile">
						<input type="text" name="comment" value="" id="comment">
						<input type="submit" value="post">
					</form>
					</div>
					</div>
			<%
				}
			%>
			</div>
			</div>
			</div>
	</body>
</html>