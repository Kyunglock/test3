
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
<html>
<head>
<meta charset="utf-8" />
<title>제이쿼리</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.0.min.js" ></script>
<script type="text/javascript">
$(function(){
  $('#showBox').mouseenter(function(){
    $('#yellow_circle').css("visibility", "hidden");
    $('#changeCard').css("visibility", "visible");
  });
  $('#showBox').mouseleave(function(){
    $('#yellow_circle').css("visibility", "visible");
    $('#changeCard').css("visibility", "hidden");
  });
});
$(function(){
	  $('#showBox2').mouseenter(function(){
	    $('#yellow_circle2').css("visibility", "hidden");
	    $('#changeCard2').css("visibility", "visible");
	  });
	  $('#showBox2').mouseleave(function(){
	    $('#yellow_circle2').css("visibility", "visible");
	    $('#changeCard2').css("visibility", "hidden");
	  });
	});
$(function(){
	  $('#showBox3').mouseenter(function(){
	    $('#yellow_circle3').css("visibility", "hidden");
	    $('#changeCard3').css("visibility", "visible");
	  });
	  $('#showBox3').mouseleave(function(){
	    $('#yellow_circle3').css("visibility", "visible");
	    $('#changeCard3').css("visibility", "hidden");
	});
});
</script>
</head>
<body>

<div id="showBox" style="width:239px;height:318px;position:relative;float:left" class="container" >
<img src="/boardprj/img/num=2_exist=1.jpg" width=239px	height=318px id="changeCard" style="position:absolute;visibility:hidden">
<img src="/boardprj/img/num=1_exist=1.jpg" width=239px	height=318px id="yellow_circle" style="position:absolute">
</div>
<div id="showBox2" style="width:239px;height:318px;position:relative;float:left" class="container" >
<img src="/boardprj/img/num=2_exist=1.jpg" width=239px	height=318px id="changeCard2" style="position:absolute;visibility:hidden">
<img src="/boardprj/img/num=1_exist=1.jpg" width=239px	height=318px id="yellow_circle2" style="position:absolute">
</div>
<div id="showBox3" style="width:239px;height:318px;position:relative;float:left" class="container" >
<img src="/boardprj/img/num=2_exist=1.jpg" width=239px	height=318px id="changeCard3" style="position:absolute;visibility:hidden">
<img src="/boardprj/img/num=1_exist=1.jpg" width=239px	height=318px id="yellow_circle3" style="position:absolute">
</div>

</body>
</html>
