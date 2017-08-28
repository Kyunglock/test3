<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="board.BoardDAO" %> <!--회원데이터베이스 테이블에 접근할 수 있도록 돕는 클래스 데이터베이스 데이터 넣고 빼기  -->
<%@ page import="java.io.PrintWriter" %> <!--자바스크립트 문장을 작성하기 위한 문장  -->
<% request.setCharacterEncoding("UTF-8"); %> <!-- 건너오는 데이터를 UTF-8로 받을 수 있도록 -->
<jsp:useBean id="board" class="board.Board" scope="page" />
<jsp:setProperty name="board" property="itemTitle" />
<jsp:setProperty name="board" property="ITEMCONTENT" />

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
	} else{
			BoardDAO boardDAO =  new BoardDAO();
			int itemNum=Integer.parseInt(request.getParameter("itemNum"));
			int result = boardDAO.deleteItem(itemNum);
			if( result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('삭제에 실패했습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
			else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('삭제되었습니다.')");
				script.println("location.href= 'userboard.jsp?itemRoom=0'");
				script.println("</script>");
			}
			
		}
	
	
%>

</body>
</html>