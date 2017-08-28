<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	String userID = null;
	if(session.getAttribute("userID") != null ){
		userID = (String) session.getAttribute("userID");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
    <!-- 메시지 표시 영역 -->
    <textarea id="messageTextArea" readonly="readonly" rows="10" cols="45"></textarea><br />
    <!-- 송신 메시지 텍스트박스 -->
    <input type="text" id="messageText" size="50" />
    <!-- 송신 버튼 -->
    <input type="button" value="Send" onclick="sendMessage()" />
    <input type="hidden" value="1" id="test">
    <input type="button" value="뽑기" onclick="test()">
    <script type="text/javascript">
        //웹소켓 초기화
        var webSocket = new WebSocket("ws://61.80.193.100:8080/boardprj/broadsocket");
        var messageTextArea = document.getElementById("messageTextArea");
        //메시지가 오면 messageTextArea요소에 메시지를 추가한다.
        webSocket.onmessage = function processMessge(message){
            //Json 풀기
            var jsonData = JSON.parse(message.data);
            if(jsonData.message != null) {
                messageTextArea.value += jsonData.message + "\n"
            };
        }
        //메시지 보내기
        function sendMessage(){
            var messageText = document.getElementById("messageText");
            webSocket.send(messageText.value);
            messageText.value = "";
        }
        function test() {
        	var messageText2 = document.getElementById("test");
            webSocket.send(messageText2.value);
            messageText2.value = "";
        }
    </script>
</body>
</html>