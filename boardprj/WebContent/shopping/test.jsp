
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.io.PrintWriter" %> <!--자바스크립트 문장을 작성하기 위한 문장  -->
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="card.CardDAO" %>
<%@ page import="user.UserInven" %>

<% request.setCharacterEncoding("UTF-8"); %> <!-- 건너오는 데이터를 UTF-8로 받을 수 있도록 -->



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

    <title>Dashboard Template for Bootstrap</title>

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
    		var SetTime = 5;		// 최초 설정 시간(기본 : 초)

		function msg_time() {	// 1초씩 카운트
			
			m = Math.floor(SetTime / 60) + "분 " + (SetTime % 60) + "초";	// 남은 시간 계산
			
			var msg = "현재 남은 시간은 <font color='red'>" + m + "</font> 입니다.";
			
			document.all.ViewTimer.innerHTML = msg;		// div 영역에 보여줌 
					
			SetTime--;					// 1초씩 감소
			
			if (SetTime < 0) {			// 시간이 종료 되었으면..
				
				clearInterval(tid);		// 타이머 해제
				alert("종료");
			}
			
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
            <li><a href="#">Home</a></li>
            <li><a href="#">Settings</a></li>
            <li><a href="#">Profile</a></li>
            <li><a href="#">Help</a></li>
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
			<li class="active"><a href="shopboard.jsp">카드를 모으자 <span class="sr-only">(current)</span></a></li>
			<li><a href="getCard.jsp">떠라카드야!</a></li>
            <li><a href="#">건의사항</a></li>
            <li><a href="#">Export</a></li>
          </ul>
          <ul class="nav nav-sidebar">

          </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          	<!-- 로그인 사용자 정보 -->          
          	<h2 class="sub-header">갓챠!</h2>
          	<div class="table-responsive">
          	
          	<script type="text/javascript">
		    setInterval("dpTime()",1000);
		    function dpTime(){
		       var now = new Date();
		        hours = now.getHours();
		        minutes = now.getMinutes();
		        seconds = now.getSeconds();
		 
		        if (hours > 12){
		            hours -= 12;
		        ampm = "오후 ";
		        }else{
		            ampm = "오전 ";
		        }
		        if (hours < 10){
		            hours = "0" + hours;
		        }
		        if (minutes < 10){
		            minutes = "0" + minutes;
		        }
		        if (seconds < 10){
		            seconds = "0" + seconds;
		        }
			document.getElementById("dpTime").innerHTML = ampm + hours + ":" + minutes + ":" + seconds;
    		}
			</script>
 
<span id="dpTime"></span>

		  	</div>

        </div>
      </div>
    </div>

    <!-- Bootstrap core JavaScript ================================================== -->
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