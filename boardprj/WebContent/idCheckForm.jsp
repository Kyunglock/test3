<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script>
	function pValue() {
		document.getElementById("userID").value = opener.document.register.id.value;
	}
</script>
<body onload="pValue()">
<div id="wrap"></div>
	<br>
	<b><font size="4" color="gray">아이디 중복체크</font></b>
	<hr size="1" width="460">
	<br>
	<div id="chk">
		<form id="checkForm">
			<input type="text" name="idinput" id="userID">
			<input type="button" value="중복확인" onclick="idCheck()">
		</form>
		<div id="msg">
		<br>
		<input id="cancelBtn" type="button" value="취소" onclick="windows.close()"><br>
		<input id="useBtn" type="button" value="사용하기" onclick="sendCheckValue()">
		
		</div>
	</div>

</body>
</html>