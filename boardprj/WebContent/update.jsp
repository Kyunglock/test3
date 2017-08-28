<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.io.PrintWriter" %>
<%@ page import="board.BoardDAO" %> <!--회원데이터베이스 테이블에 접근할 수 있도록 돕는 클래스 데이터베이스 데이터 넣고 빼기  -->
<%@ page import="board.Board" %>
<%@ page import="reply.Reply" %> <!--회원데이터베이스 테이블에 접근할 수 있도록 돕는 클래스 데이터베이스 데이터 넣고 빼기  -->
<%@ page import="reply.ReplyDAO" %>
<%@ page import="java.util.ArrayList" %>

<% request.setCharacterEncoding("UTF-8"); %> <!-- 건너오는 데이터를 UTF-8로 받을 수 있도록 -->

<jsp:useBean id="reply" class="reply.Reply" scope="page" />
<jsp:setProperty name="reply" property="replyNum" />
<jsp:setProperty name="reply" property="itemNum" />
<jsp:setProperty name="reply" property="replyContent" />
<jsp:setProperty name="reply" property="replyRoom" />
<jsp:setProperty name="reply" property="replyUserID" />

<%
	String userID = null;
	if(session.getAttribute("userID") != null ){
		userID = (String) session.getAttribute("userID");
	}
	int itemNum =0;
	if( request.getParameter("itemNum") != null) {
		itemNum = Integer.parseInt(request.getParameter("itemNum"));
	}
	if(itemNum == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글입니다.')");
		script.println("location.href = 'userboard.jsp'");
		script.println("</script>");
	}
	Board board = new BoardDAO().getBoard(itemNum);



%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">
   	<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
    
    

    

    <title>록경록</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="css/ie10-viewport-bug-workaround.css" rel="stylesheet">
    
    <!-- Custom styles for this template -->
    <link href="dashboard.css" rel="stylesheet">
    

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
     <script src="js/ie-emulation-modes-warning.js"></script>
     
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
        <script>
    $(document).ready(function() {
    	$("#flip").click(function(){
    		$("#panel").slideDown("slow");
    	});
    });
    </script>
    <style>
    #flip,#panel
    {
    	padding:5px;
    	text-align:center;
    	background-color:#e5eecc;
    	border:solid 1px $c3c3c3;
    }
   
    </style>
    <script type="text/javascript">
    	
		function create()
		{	
			location.href = "write.jsp"
		}
    </script>
  </head>

  <body>

    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Project name</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="shopping/shopboard.jsp">카드목록보기</a></li>
            <li><a href="shopping/getCard.jsp">카드뽑기</a></li>
            <li><a href="shopping/Enhence.jsp">카드강화하기</a></li>
            <li><a href="fight/fightboard.jsp">카드대전</a></li>
          </ul>
          <form class="navbar-form navbar-right">
            <input type="text" class="form-control" placeholder="Search...">
          </form>
        </div>
      </div>
    </nav>

    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li class="active"><a href="userboard.jsp?itemRoom=0">자유게시판 <span class="sr-only">(current)</span></a></li>

          </ul>
          <ul class="nav nav-sidebar">
          	<li class="active"><a href="#">카드 <span class="sr-only">(current)</span></a></li>
            <li><a href="shopping/shopboard.jsp">카드목록보기</a></li>
            <li><a href="shopping/getCard.jsp">카드뽑기</a></li>
            <li><a href="shopping/Enhence.jsp">카드강화하기</a></li>
            <li><a href="fight/fightboard.jsp">카드대전</a></li>
          </ul>
          <ul class="nav nav-sidebar">

          </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <!-- 로그인 사용자 정보 -->          
          <h2 class="sub-header">자유게시판</h2>
          <div class="table-responsive">
           <!-- 여기다 작업 -->
          	        <div class="container">
        	<div class="row">
        		<form method="post" action="update_proc.jsp?itemNum=<%= itemNum %>">
        	    <table class="table table-striped style" style="text-align: center; border: 1px solid #dddddd">
        			<tbody>
        				<tr>
        					<td style="width: 20%;">글제목</td>
        					<td colspan ="2"><input name="itemTitle" type="text" value="<%=board.getItemTitle() %>"></td>
        				</tr>
        				<tr>        					
        					<td>작성자</td>
        					<td colspan ="2"><%=board.getMadeUserID() %></td>
        				</tr>
        				<tr>
        					<td>작성일자</td>
        					<td colspan ="2"><%=board.getItemProduced() %></td>
        				</tr>        		
        				<tr>
        					<td>내용</td>
        					<td colspan ="2">
        					<textarea name="ITEMCONTENT" class="form-control" placeholder="글 내용" name="ITEMCONTENT" maxlength="2048" style="height:350px;"><%=board.getITEMCONTENT().replaceAll(" ", "&nbsp;").replaceAll("<", "$lt;").replaceAll(">", "&gt;") %></textarea></td>
        				</tr>        				
        			</tbody>
        		</table>
        		
        		<%
        			if(userID != null && userID.equals(board.getMadeUserID())){
        				
        		%>
        				<div class="text-right">
        					<input type="submit" value="수정" class="btn btn-primary">
        					<a href="delete_proc.jsp?itemNum=<%= itemNum %>" class="btn btn-primary">삭제</a>
        				</div>
        				</form>
        		<%
        			}
        			else {
        		%>
        				
        				<script>
        					alert("잘못된 접근입니다.");
        					location.href = 'userboard.jsp?itemRoom=0';
        				</script>
        		<%
        			}
        			
        		%>

        </div>
        </div>
      </div>
    </div>
    </div>
    </div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="http://61.80.193.100:8080/bootstrap-sass-3.3.7/assets/javascripts/bootstrap.min.js"></script>
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
    <script src="http://61.80.193.100:8080/bootstrap-3.3.7/docs/assets/js/vendor/holder.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="http://61.80.193.100:8080/bootstrap-3.3.7/docs/assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>