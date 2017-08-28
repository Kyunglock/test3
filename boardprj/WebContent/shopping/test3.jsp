<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>제이쿼리</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.0.min.js" ></script>
<script type="text/javascript">
$(function(s){
	  var test = s;
	  var hover1 = $(test);
	  hover1.hover(function(){
	    hover1.css('border','5px solid blue');
	  },function(){
	    hover1.css('border','5px solid red');
	  });
	});
</script>
<style>
.hover1{width:100px; height:50px; background:yellow}
</style>
</head>
<body>
<div class="hover1" action="mouseenter(s)"></div>
</body>
</html>