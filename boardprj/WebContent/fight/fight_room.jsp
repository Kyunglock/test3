<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="socket.broadsocket" %>
<%@ page import="java.io.PrintWriter" %> <!--자바스크립트 문장을 작성하기 위한 문장  -->
<%@ page import="card.CardDAO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%
	CardDAO cardDAO = new CardDAO();
	
	double randomValue = Math.random();
	int Percent = cardDAO.randomRange(100, 151);
	int cardnum1 =0;
	int cardnum2 =cardDAO.randomRange(1001, 1004);
	int cardnum3 =cardDAO.randomRange(1001, 1004);
	int cardnum4 =cardDAO.randomRange(10001, 10015);
	
	if( Percent <= 150 && Percent >=130)
  	{
  		cardnum1 = cardDAO.randomRange(1, 6);
  		
  		
  	}
  	else if(Percent <=130 && Percent >=110){
  		cardnum1 = cardDAO.randomRange(1001, 1004);
  	}
  	else if(Percent <=110 && Percent >=100){
  		cardnum1 = cardDAO.randomRange(10001, 10015);
  	}
  	else if(Percent == 151){
  		cardnum1 = 100001;
  	}
%>
</head>
<body>
    <!-- 메시지 표시 영역 -->
    <textarea id="messageTextArea" readonly="readonly" rows="10" cols="45"></textarea><br />
    <!-- 송신 메시지 텍스트박스 -->
    <input type="text" id="messageText" size="50" />

    <!-- 송신 버튼 -->
    <input type="button" value="준비" onclick="sendMessage()" />    
    <input type="hidden" value=<%=(String) session.getAttribute("userID") %> id="getID">
    
    <input type="hidden" value="showCard" id="showCard">
    <input class="btn btn-primary" type="button" value="시작" onclick="sendtest()" style="visibility:hidden" id="start"/>
    
    <div class="container">
    
	   	<div class="content" style="background:red">
	       	<div style="float:left">
	       	<div id="showBox" style="width:239px;height:318px;position:relative;float:left;margin-left:15px;visibility:hidden" >
	       		<img id="oneCardOpen" src="/boardprj/img/num=<%=cardnum1%>_exist=1.jpg" width=239px	height=318px  style="position:absolute;visibility:hidden">
	       		<!-- 일단 숨어있는 카드 마우스를 대면 나타남 -->
				<img id="oneCardShow" src="/boardprj/img/num=100000.jpg" width=239px	height=318px style="position:absolute;visibility:hidden" >
				<!-- 카드 뒷면 -->
		        </div>
		        
	        <div id="showBox2" style="width:239px;height:318px;position:relative;float:left;margin-left:15px;visibility:hidden">
          		<img id="twoCardOpen" src="/boardprj/img/num=<%=cardnum2%>_exist=1.jpg" width=239px	height=318px  style="position:absolute;visibility:hidden">
          		<!-- 일단 숨어있는 카드 마우스를 대면 나타남 -->
				<img id="twoCardShow" src="/boardprj/img/num=1000.jpg" width=239px	height=318px style="position:absolute;visibility:hidden" >
				<!-- 카드 뒷면 -->
	        </div>
	        
	        <div id="showBox3" style="width:239px;height:318px;position:relative;float:left;margin-left:15px;visibility:hidden" >
          		<img id="threeCardOpen" src="/boardprj/img/num=<%=cardnum3%>_exist=1.jpg" width=239px	height=318px  style="position:absolute;visibility:hidden">
          		<!-- 일단 숨어있는 카드 마우스를 대면 나타남 -->
				<img id="threeCardShow" src="/boardprj/img/num=1000.jpg" width=239px	height=318px style="position:absolute;visibility:hidden" >
				<!-- 카드 뒷면 -->
	        </div>
	        
	        <div id="showBox4" style="width:239px;height:318px;position:relative;float:left;margin-left:15px;visibility:hidden" >
          		<img id="fourCardOpen" src="/boardprj/img/num=<%=cardnum4%>_exist=1.jpg" width=239px	height=318px  style="position:absolute;visibility:hidden">
          		<!-- 일단 숨어있는 카드 마우스를 대면 나타남 -->
				<img id="fourCardShow" src="/boardprj/img/num=10000.jpg" width=239px	height=318px style="position:absolute;visibility:hidden" >
				<!-- 카드 뒷면 -->
	        </div>
	        <div id="1player" style="width:239px;height:318px;position:relative;float:left;margin-left:15px;visibility:hidden" >
          		<img id="1playerCarOpen" src="/boardprj/img/num=<%=cardnum4%>_exist=1.jpg" width=239px	height=318px  style="position:absolute;visibility:hidden">
          		<!-- 일단 숨어있는 카드 마우스를 대면 나타남 -->
				<img id="1playerCardShow" src="/boardprj/img/num=10000.jpg" width=239px	height=318px style="position:absolute;visibility:hidden" >
				<!-- 카드 뒷면 -->
	        </div>
	        </div>
	        
	        <div style="clear:left;float:left">
	        <div id="showBox5" style="width:239px;height:318px;position:relative;float:left;margin-left:15px;visibility:hidden" >
          		<img id="fiveCardOpen" src="/boardprj/img/num=<%=cardnum4%>_exist=1.jpg" width=239px	height=318px  style="position:absolute;visibility:hidden">
          		<!-- 일단 숨어있는 카드 마우스를 대면 나타남 -->
				<img id="fiveCardShow" src="/boardprj/img/num=10000.jpg" width=239px	height=318px style="position:absolute;visibility:hidden" >
				<!-- 카드 뒷면 -->
	        </div>
	        <div id="showBox6" style="width:239px;height:318px;position:relative;float:left;margin-left:15px;visibility:hidden" >
          		<img id="sixCardOpen" src="/boardprj/img/num=<%=cardnum4%>_exist=1.jpg" width=239px	height=318px  style="position:absolute;visibility:hidden">
          		<!-- 일단 숨어있는 카드 마우스를 대면 나타남 -->
				<img id="sixCardShow" src="/boardprj/img/num=10000.jpg" width=239px	height=318px style="position:absolute;visibility:hidden" >
				<!-- 카드 뒷면 -->
	        </div>
	        <div id="showBox7" style="width:239px;height:318px;position:relative;float:left;margin-left:15px;visibility:hidden" >
          		<img id="sevenCardOpen" src="/boardprj/img/num=<%=cardnum4%>_exist=1.jpg" width=239px	height=318px  style="position:absolute;visibility:hidden">
          		<!-- 일단 숨어있는 카드 마우스를 대면 나타남 -->
				<img id="sevenCardShow" src="/boardprj/img/num=10000.jpg" width=239px	height=318px style="position:absolute;visibility:hidden" >
				<!-- 카드 뒷면 -->
	        </div>
	        <div id="showBox8" style="width:239px;height:318px;position:relative;float:left;margin-left:15px;visibility:hidden" >
          		<img id="eightCardOpen" src="/boardprj/img/num=<%=cardnum4%>_exist=1.jpg" width=239px	height=318px  style="position:absolute;visibility:hidden">
          		<!-- 일단 숨어있는 카드 마우스를 대면 나타남 -->
				<img id="eightCardShow" src="/boardprj/img/num=10000.jpg" width=239px	height=318px style="position:absolute;visibility:hidden" >
				<!-- 카드 뒷면 -->
	        </div>
	        <div id="2player" style="width:239px;height:318px;position:relative;float:left;margin-left:15px;visibility:hidden" >
          		<img id="2playerCarOpen" src="/boardprj/img/num=<%=cardnum4%>_exist=1.jpg" width=239px	height=318px  style="position:absolute;visibility:hidden">
          		<!-- 일단 숨어있는 카드 마우스를 대면 나타남 -->
				<img id="2playerCardShow" src="/boardprj/img/num=10000.jpg" width=239px	height=318px style="position:absolute;visibility:hidden" >
				<!-- 카드 뒷면 -->
	        </div>
	        </div>
        </div>
    </div>
    
    
    <script type="text/javascript" src="http://code.jquery.com/jquery-3.2.0.min.js" ></script>
	
    <script type="text/javascript">
        //웹소켓 초기화
        var webSocket = new WebSocket("ws://121.181.168.18:8080/boardprj/broadsocket");
        var messageTextArea = document.getElementById("messageTextArea");
        var flag = 1;
        //메시지가 오면 messageTextArea요소에 메시지를 추가한다.
        webSocket.onmessage = function processMessge(message){
            //Json 풀기
            var jsonData = JSON.parse(message.data);
            //메시지 추가하기
            if(jsonData.message != null && jsonData.message=="1"){
            	alert("인원수가 가득 찼습니다");
            	history.back();
            };
            if(jsonData.message != null && jsonData.message =="1플레이어 게임을 시작합니다!" )
        	{        		
      			$('#start').css("visibility", "visible");
      			$('#showBox').css("visibility", "visible");
      			$('#showBox2').css("visibility", "visible");
      			$('#showBox3').css("visibility", "visible");
      			$('#showBox4').css("visibility", "visible");
      			$('#oneCardShow').css("visibility", "visible");
      			$('#twoCardShow').css("visibility", "visible");
      			$('#threeCardShow').css("visibility", "visible");
      			$('#fourCardShow').css("visibility", "visible");
      			$('#fiveCardShow').css("visibility", "visible");
      			$('#sixCardShow').css("visibility", "visible");
      			$('#sevenCardShow').css("visibility", "visible");
      			$('#eightCardShow').css("visibility", "visible");
      			$('#1playerCardShow').css("visibility", "visible");
      			$('#2playerCardShow').css("visibility", "visible");
      			$(document).ready(function(){
      				
      			  $('#showBox').click(function(){
      				selectOneCard();
      			    $('#oneCardShow').css("visibility", "hidden");
      			    $('#oneCardOpen').css("visibility", "visible");
      			  });
      			});
      			$(document).ready(function(){      				
      			  $('#showBox2').click(function(){
      				selectTwoCard();
      			    $('#twoCardShow').css("visibility", "hidden");
      			    $('#twoCardOpen').css("visibility", "visible");
      			  });
      			});
      			$(document).ready(function(){
      			  $('#showBox3').click(function(){
      				selectThreeCard();
      			    $('#threeCardShow').css("visibility", "hidden");
      			    $('#threeCardOpen').css("visibility", "visible");
      			  });
      			});
      			$(document).ready(function(){
      			  $('#showBox4').click(function(){
      				selectFourCard();
      			    $('#fourCardShow').css("visibility", "hidden");
      			    $('#fourCardOpen').css("visibility", "visible");
      			  });
      			});

        	};
        	if(jsonData.message != null && jsonData.message =="2플레이어 게임을 시작합니다!" )
        	{   
        		
      			$('#start').css("visibility", "visible");
      			$('#showBox5').css("visibility", "visible");
      			$('#showBox6').css("visibility", "visible");
      			$('#showBox7').css("visibility", "visible");
      			$('#showBox8').css("visibility", "visible");
      			$('#oneCardShow').css("visibility", "visible");
      			$('#twoCardShow').css("visibility", "visible");
      			$('#threeCardShow').css("visibility", "visible");
      			$('#fourCardShow').css("visibility", "visible");
      			$('#fiveCardShow').css("visibility", "visible");
      			$('#sixCardShow').css("visibility", "visible");
      			$('#sevenCardShow').css("visibility", "visible");
      			$('#eightCardShow').css("visibility", "visible");
      			$('#1playerCardShow').css("visibility", "visible");
      			$('#2playerCardShow').css("visibility", "visible");
      			$(document).ready(function(){
      			  $('#showBox5').click(function(){
      				selectFiveCard();
      			    $('#fiveCardShow').css("visibility", "hidden");
      			    $('#fiveCardOpen').css("visibility", "visible");
      			  });
      			});
      			$(document).ready(function(){
      			  $('#showBox6').click(function(){
      				selectSixCard();
      			    $('#sixCardShow').css("visibility", "hidden");
      			    $('#sixCardOpen').css("visibility", "visible");
      			  });
      			});
      			$(document).ready(function(){
      			  $('#showBox7').click(function(){
      				selectSevenCard();
      			    $('#sevenCardShow').css("visibility", "hidden");
      			    $('#sevenCardOpen').css("visibility", "visible");
      			  });
      			});
      			$(document).ready(function(){
        		  $('#showBox8').click(function(){
        			  selectEightCard();
        		    $('#eightCardShow').css("visibility", "hidden");
        		    $('#eightCardOpen').css("visibility", "visible");
        		  });
        		});
        	};
            if(jsonData.message != null && jsonData.message != "showCard") {
                messageTextArea.value += jsonData.message + "\n"
            };
            if(jsonData.messgae != null && jsonData.message == "showCard") {
            	
            };
            
           
        }

        //메시지 보내기
        function sendMessage(){
        	
        	if(flag == 1 ){
        		var userID = document.getElementById("getID");
                webSocket.send(userID.value);
                userID.value = "";
                flag = 2;
        	}
        	else{
        		var sendMessage = document.getElementById("messageText");
                webSocket.send(sendMessage.value);
                sendMessage.value = "";
        	}    
        }
        function sendtest() {
        	webSocket.send("1_2_3_4_5");
        }
        function selectOneCard(){    		
            webSocket.send(<%=cardnum1%>);
        }
        function selectTwoCard(){    		
            webSocket.send(<%=cardnum2%>);
        }
        function selectThreeCard(){    		
            webSocket.send(<%=cardnum3%>);
        }
        function selectFourCard(){    		
            webSocket.send(<%=cardnum4%>);
        }
        function selectFiveCard(){    		
            webSocket.send(<%=cardnum4%>);
        }
        function selectSixCard(){    		
            webSocket.send(<%=cardnum4%>);
        }
        function selectSevenCard(){    		
            webSocket.send(<%=cardnum4%>);
        }
        function selectEightCard(){    		
            webSocket.send(<%=cardnum4%>);
        }
        
    </script>
</body >
</html>