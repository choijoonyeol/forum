<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>JSP Forum</title>
</head>
<body>
	<%
		String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	%>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">JSP Forum</a>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">Main</a></li>
				<li class="active" ><a href="bbs.jsp">Board</a></li>
			</ul>
			<%
				if (userID == null) {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">メニュー<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">ログイン</a></li>
						<li><a href="join.jsp">会員登録</a></li>
					</ul>
			</ul>
			<%
				} else {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">メニュー<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">ログアウト</a></li>
					</ul>
			</ul>
			<%
				}
			%>

		</div>
	</nav>
	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd;">
				<thead>
					<tr>
						<th style="background-color: #eeeee; text-align: center;">No</th>
						<th style="background-color: #eeeee; text-align: center;">Title</th>
						<th style="background-color: #eeeee; text-align: center;">Writer</th>
						<th style="background-color: #eeeee; text-align: center;">Day</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>hey</td>
						<td>joon</td>
						<td>2020-12-25</td>
					</tr>
				</tbody>
			</table>
			<a href="write.jsp" class="btn btn-primary pull-right">Write</a>
		</div>
	</div> 
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>
