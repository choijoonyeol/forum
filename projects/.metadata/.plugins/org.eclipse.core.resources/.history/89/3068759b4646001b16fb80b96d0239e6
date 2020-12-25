<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Forum</title>
</head>
<body>
	<%
		UserDAO userDAO = new UserDAO();
	int result = userDAO.login(user.getUserID(), user.getUserPassword());
	PrintWriter script = response.getWriter();

	if (result == 1) {
		script.println("<script>");
		script.println("location.href='main.jsp'");
		script.println("</script>");
	}

	else if (result == -1) {
		script.println("<script>");
		script.println("alert('there is no id')");
		script.println("history.back()");
		script.println("</script>");
	}

	else if (result == -2) {
		script.println("<script>");
		script.println("alert('password is not matched')");
		script.println("history.back()");
		script.println("</script>");
		
	} else if (result == 0) {
		script.println("<script>");
		script.println("alert('password is not matched')");
		script.println("history.back()");
		script.println("</script>");
	}
	
	%>

</body>
</html>
