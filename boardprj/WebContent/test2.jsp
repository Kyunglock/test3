<!doctype html>
<html>
<head>
<meta charset="utf-8" />
<title>제이쿼리</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.0.min.js" ></script>
<script type="text/javascript">
$(document).ready(function(){
  $("#ex_show").click(function() {
	  $("#ex_box").slideDown("slow");
  });
});
</script>
<style type="text/css">
.ex_show{float:left;margin-right:20px;cursor:pointer}
.ex_hide{float:left;cursor:pointer}
.ex_box{clear:both; float:left; width:239px; height:318px; }</style>
</head>
<body>
<b id="ex_show">show click!!</b>
<div id="ex_box" style="display:none"><img src="/boardprj/img/num=1_exist=1.jpg" width=239px	height=318px></div>
</body>
</html>