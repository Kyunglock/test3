<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="board.BoardDAO" %> <!--회원데이터베이스 테이블에 접근할 수 있도록 돕는 클래스 데이터베이스 데이터 넣고 빼기  -->
<%@ page import="user.UserInven" %> 
<%@ page import="card.CardDAO" %> 

<%@ page import="java.io.PrintWriter" %> <!--자바스크립트 문장을 작성하기 위한 문장  -->
<% request.setCharacterEncoding("UTF-8"); %> <!-- 건너오는 데이터를 UTF-8로 받을 수 있도록 -->

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
	function result(){
		
	}
</script>
<%
	CardDAO cardDAO = new CardDAO();
	String userID = null;
	int cardNum = Integer.parseInt(request.getParameter("cardNum"));
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	if( userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요.')");
		script.println("location.href = '../login.jsp'");
		script.println("</script>");
	} else {
	   	double randomValue = Math.random();
	  	int Percent = cardDAO.randomRange(1, 100);
	  	int intValue =0;
	  	UserInven userInven2 = new UserInven();
	  	PrintWriter script = response.getWriter();
	  	if(userInven2.gethenceCard(cardNum, userID) ==3){
			script.println("<script>");
			script.println("alert('이미 최고등급의 아이템 입니다.')");
			script.println("location.href = 'Enhence.jsp'");
			script.println("</script>");
			Percent = cardDAO.randomRange(101, 102);
  		}
	  	
	  	if( Percent <= 30 && Percent >=0)
	  	{
	  		UserInven userInven = new UserInven();
	  		userInven.deleteItem(cardNum, userID);
	  		script.println("<script>");
			script.println("alert('강화실패')");
			script.println("location.href = 'Enhence.jsp'");
			script.println("</script>");
	  	}
	  	else if(Percent <=100 && Percent >=30){
	  		
	  		
	  		UserInven userInven = new UserInven();	  			
	  		userInven.henceProcPlus(cardNum, userID);
			script.println("<script>");
			script.println("alert('강화성공')");
			script.println("location.href = 'Enhence.jsp'");
			script.println("</script>");
	  	}
	  	
		
		
		
	}
	
%>

</body>
</html>