
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
    int cardnum = Integer.parseInt(request.getParameter("cardNum"));
	int cardnum2 = Integer.parseInt(request.getParameter("cardNum2"));
	int cardnum3 = Integer.parseInt(request.getParameter("cardNum3"));
	int cardnum4 = Integer.parseInt(request.getParameter("cardNum4"));
    
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
    <script src="http://code.jquery.com/jquery-latest.js"></script>

    
	<script>
	function gotchar()
	{
		location.href="getCard.jsp";		
	}
	
	function showlist()
	{
		location.href="shopboard.jsp";
	}
	</script>
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
			script.println("location.href = '../login.jsp'");
			script.println("</script>");
		} else{			
			UserInven userInven = new UserInven();
			userInven.getCard(cardnum, userID);
			userInven.getCard(cardnum2, userID);
			userInven.getCard(cardnum3, userID);
			userInven.getCard(cardnum4, userID);
		}
		
		
	%>
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
        <script type="text/javascript" src="http://code.jquery.com/jquery-3.2.0.min.js" ></script>
		<script type="text/javascript">
		$(document).ready(function(){
			  $('#showBox').click(function(){
			    $('#oneCardShow').css("visibility", "hidden");
			    $('#oneCardOpen').css("visibility", "visible");
			  });
			});
		$(document).ready(function(){
			  $('#showBox2').click(function(){
			    $('#twoCardShow').css("visibility", "hidden");
			    $('#twoCardOpen').css("visibility", "visible");
			  });
			});
		$(document).ready(function(){
			  $('#showBox3').click(function(){
			    $('#threeCardShow').css("visibility", "hidden");
			    $('#threeCardOpen').css("visibility", "visible");
			  });
			});
		$(document).ready(function(){
			  $('#showBox4').click(function(){
			    $('#fourCardShow').css("visibility", "hidden");
			    $('#fourCardOpen').css("visibility", "visible");
			  });
			});
		$(document).ready(function(){
				$("#showAllBtn").click(function() {
				  $("#oneCardShow").slideUp("slow");
				  $("#twoCardShow").slideUp("slow");
				  $("#threeCardShow").slideUp("slow");
				  $("#fourCardShow").slideUp("slow");
				  
				  $("#oneCardOpen").css("visibility", "visible");
				  $("#twoCardOpen").css("visibility", "visible");
				  $("#threeCardOpen").css("visibility", "visible");
				  $("#fourCardOpen").css("visibility", "visible");
			  });
			});
		
		
			
		</script>
        	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          	<!-- 로그인 사용자 정보 -->          
          	<h2 class="sub-header">갓챠!</h2>
          	<div class="container">
	          	<div class="content" style="background:red">
		          	<div id="showBox" style="width:239px;height:318px;position:relative;float:left;margin-left:15px" >
		          		<img id="oneCardOpen" src="/boardprj/img/num=<%=cardnum%>_exist=1.jpg" width=239px	height=318px  style="position:absolute;visibility:hidden">
		          		<!-- 일단 숨어있는 카드 마우스를 대면 나타남 -->
						<img id="oneCardShow" src="/boardprj/img/num=100000.jpg" width=239px	height=318px style="position:absolute" >
						<!-- 카드 뒷면 -->
			        </div>
			        
			        <div id="showBox2" style="width:239px;height:318px;position:relative;float:left;margin-left:15px">
		          		<img id="twoCardOpen" src="/boardprj/img/num=<%=cardnum2%>_exist=1.jpg" width=239px	height=318px  style="position:absolute;visibility:hidden">
		          		<!-- 일단 숨어있는 카드 마우스를 대면 나타남 -->
						<img id="twoCardShow" src="/boardprj/img/num=0.jpg" width=239px	height=318px style="position:absolute" >
						<!-- 카드 뒷면 -->
			        </div>
			        
			        <div id="showBox3" style="width:239px;height:318px;position:relative;float:left;margin-left:15px" >
		          		<img id="threeCardOpen" src="/boardprj/img/num=<%=cardnum3%>_exist=1.jpg" width=239px	height=318px  style="position:absolute;visibility:hidden">
		          		<!-- 일단 숨어있는 카드 마우스를 대면 나타남 -->
						<img id="threeCardShow" src="/boardprj/img/num=1000.jpg" width=239px	height=318px style="position:absolute" >
						<!-- 카드 뒷면 -->
			        </div>
			        
			        <div id="showBox4" style="width:239px;height:318px;position:relative;float:left;margin-left:15px" >
		          		<img id="fourCardOpen" src="/boardprj/img/num=<%=cardnum4%>_exist=1.jpg" width=239px	height=318px  style="position:absolute;visibility:hidden">
		          		<!-- 일단 숨어있는 카드 마우스를 대면 나타남 -->
						<img id="fourCardShow" src="/boardprj/img/num=10000.jpg" width=239px	height=318px style="position:absolute" >
						<!-- 카드 뒷면 -->
			        </div>
		        </div>
	        </div>
		        <div style="text-align:center">
		          	<b class="btn btn-primary" id="showAllBtn">전부 까기</b>
		          	<input type="button" class="btn btn-primary" value="카드목록보기" onclick="showlist()">
		          	<input type="button" class="btn btn-primary" value="한번더" onclick="gotchar()">          	
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