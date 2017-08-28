<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="reply.ReplyDAO" %> <!--회원데이터베이스 테이블에 접근할 수 있도록 돕는 클래스 데이터베이스 데이터 넣고 빼기  -->
<%@ page import="java.io.PrintWriter" %> <!--자바스크립트 문장을 작성하기 위한 문장  -->
<% request.setCharacterEncoding("UTF-8"); %> <!-- 건너오는 데이터를 UTF-8로 받을 수 있도록 -->
<jsp:useBean id="reply" class="reply.Reply" scope="page" />
<jsp:setProperty name="reply" property="replyContent" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%int itemNum =0; %>

</head>
<body>

<%
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	if( userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요.')");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");
	} else {
		ReplyDAO replyDAO =  new ReplyDAO();
		itemNum= Integer.parseInt(request.getParameter("itemNum"));
		int result = replyDAO.write(itemNum, reply.getReplyContent(), userID);
		if( result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('댓글쓰기에 실패했습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else {
			PrintWriter script = response.getWriter();
					
			script.println("<body onload='ok()'>");
			script.println("</body>");
		}
	}
%>
<script>
	function ok()
	{
		location.href='read.jsp?itemNum=<%=itemNum %>';
	}	
</script>

</body>
</html>