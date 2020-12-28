<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
    request.setCharacterEncoding("UTF-8");
%>

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
	}

	int bbsID = 0;

	if (request.getParameter("bbsID") != null) {
	    bbsID = Integer.parseInt(request.getParameter("bbsID"));
	}

	if (bbsID == 0) {
	    script.println("<script>");
	    script.println("alert('invalidate')");
	    script.println("location.href='bbs.jsp'");
	    script.println("</script>");
	}
	Bbs bbs = new BbsDAO().getBbs(bbsID);
	if (!userID.equals(bbs.getUserID())) {
	    script.println("<script>");
	    script.println("alert('no ')");
	    script.println("location.href='bbs.jsp'");
	    script.println("</script>");
	} else {

	    if (request.getParameter("bbsTitle") == null || request.getParameter("bbsContent") == null
	    || request.getParameter("bbsContent").equals("") || request.getParameter("bbsContent").equals("")) {

		script.println("<script>");
		script.println("alert('please check your information')");
		script.println("history.back()");
		script.println("</script>");
	    }

	    else {

		BbsDAO bbsDAO = new BbsDAO();
		int result = bbsDAO.update(bbsID, request.getParameter("bbsTitle"), request.getParameter("bbsContent"));

		if (result == -1) {
	    script.println("<script>");
	    script.println("alert('fail to edit')");
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
