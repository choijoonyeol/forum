<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="bbs" class="bbs.Bbs" scope="page" />
<jsp:setProperty name="bbs" property="bbsTitle" />
<jsp:setProperty name="bbs" property="bbsContent" />

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Forum</title>
</head>
<body>
	<%
		String userID = null;
	PrintWriter script = response.getWriter();
	if (session.getAttribute("userID") != null) {
	    userID = (String) session.getAttribute("userID");
	}
	if (userID == null) {
	    script.println("<script>");
	    script.println("alert('you need to login')");
	    script.println("location.href='login.jsp'");
	    script.println("</script>");
	} else {

	    if (bbs.getBbsTitle() == null || bbs.getBbsContent() == null) {

		script.println("<script>");
		script.println("alert('please check your information')");
		script.println("history.back()");
		script.println("</script>");
	    }

	    else {

		BbsDAO bbsDAO = new BbsDAO();
		int result = bbsDAO.write(bbs.getBbsTitle(), userID, bbs.getBbsContent());

		if (result == -1) {
		    script.println("<script>");
		    script.println("alert('fail to write')");
		    script.println("history.back()");
		    script.println("</script>");

		} else {

		    script.println("<script>");
		    script.println("location.href='bbs.jsp'");
		    script.println("</script>");
		}

	    }
	}
	%>

</body>
</html>
