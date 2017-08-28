
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.io.PrintWriter" %> <!--자바스크립트 문장을 작성하기 위한 문장  -->
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Random" %>
<%@ page import="card.CardDAO" %>
<%@ page import="user.UserInven" %>

<% request.setCharacterEncoding("UTF-8"); %> <!-- 건너오는 데이터를 UTF-8로 받을 수 있도록 -->

<%
	int num = Integer.parseInt(request.getParameter("num"));
  	String userID = null;
   	if(session.getAttribute("userID") != null ){
   		userID = (String) session.getAttribute("userID");
    }
   	UserInven userinven = new UserInven();
   	int hence= userinven.gethenceCard(num, userID);
    
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

    <title>록경록</title>

    <!-- Bootstrap core CSS -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="../css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="../dashboard.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="../js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
	<script>
	function gotyou(getUserID)
	{
		
		
		ff=document.gotchar;
      	ff.action="Enhence_proc.jsp"
      	
        ff.submit();
		
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
            <li><a href="shopboard.jsp">카드목록보기</a></li>
            <li><a href="getCard.jsp">카드뽑기</a></li>
            <li><a href="Enhence.jsp">카드강화하기</a></li>
            <li><a href="../fight/fightboard.jsp?itemRoom=0">카드대전</a></li>
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
            <li class="active"><a href="../userboard.jsp?itemRoom=0">자유게시판 <span class="sr-only">(current)</span></a></li>
          </ul>
          <ul class="nav nav-sidebar">
          	<li class="active"><a href="#">카드 <span class="sr-only">(current)</span></a></li>
            <li><a href="shopboard.jsp">카드목록보기</a></li>
            <li><a href="getCard.jsp">카드뽑기</a></li>
            <li><a href="Enhence.jsp">카드강화하기</a></li>
            <li><a href="../fight/fightboard.jsp?itemRoom=0">카드대전</a></li>
          </ul>
          <ul class="nav nav-sidebar">

          </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          	<!-- 로그인 사용자 정보 -->          
          	<h2 class="sub-header">갓챠!</h2>
          	<div class="table-responsive">
          	<% if(hence == 1)
          	{
          	%>          	
          		<img src="/boardprj/img/num=<%=num%>_exist=1.jpg" width=239px	height=318px>
          	<%
          	}
          	else if (hence == 2 ){         	
          	%>
          		<img src="/boardprj/img/num=<%=num%>_exist=1_hence=2.jpg" width=239px	height=318px>
          	<%          	
          	}
          	else if (hence == 3 ){         	
          	%>
          		<img src="/boardprj/img/num=<%=num%>_exist=1_hence=3.jpg" width=239px	height=318px>
          	<%          	
          	}
          	%>
          	<form class="form-signin" name="gotchar" method="post" action="getCard_proc.jsp;">          	
          	<input type ="hidden" name="cardNum" value="<%=num %>">
          	<input type ="button" value="강화하기" class="btn btn-primary" onclick="gotyou('<%=userID%>')">
          	
		  	</form>
		  	</div>
		  	

        </div>
      </div>
    </div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="../js/bootstrap.min.js"></script>
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
    <script src="../js/vendor/holder.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>