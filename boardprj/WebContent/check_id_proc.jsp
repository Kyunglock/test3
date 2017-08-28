<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="user.UserDAO" %> <!--회원데이터베이스 테이블에 접근할 수 있도록 돕는 클래스 데이터베이스 데이터 넣고 빼기  -->
<%@ page import="java.io.PrintWriter" %> <!--자바스크립트 문장을 작성하기 위한 문장  -->
<% request.setCharacterEncoding("UTF-8"); %> <!-- 건너오는 데이터를 UTF-8로 받을 수 있도록 -->
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
<script>
	function ok() {
		document.register.submit();
	}
</script>
</head>
<body>
<%

	UserDAO userDAO = new UserDAO();
	boolean result = userDAO.check_id(user.getUserID());
	
	
	if (result == true) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 있는 아이디 입니다.')");
		script.println("history.back()"); //이전페이지로
		script.println("</script>");
	}
	
	else {
		PrintWriter script = response.getWriter();
		script.println("<script>");		
		script.println("alert('사용할 수 있는 아이디 입니다.')");
		
		script.println("</script>");
		script.println("<body onload='ok();'>");
		script.println("</body>");		
	}
%>

<form name="register" method="post" action="Enterprise.jsp">
<input name="userID2" type="hidden" value="<%=user.getUserID()%>">
<input name="idDuplication" type="hidden" value="ok">
</form>
</body>
</html>