<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

    <title>회원가입</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="css/ie10-viewport-bug-workaround.css" rel="stylesheet">
    
    <!-- Custom styles for this template -->
    <link href="signin.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="bootstrap-3.3.7/docs/assets/js/ie-emulation-modes-warning.js"></script>
    <script type="text/javascript">
	window.onload = function () {
		document.register.userID.focus();
		// body...
	}
	function check() {
		ff = document.register;
		//
		if(ff.userID.value == "") {
			alert("아이디를 입력하세요");
			ff.userID.focus();
			return;
		}
		if(ff.idDuplication.value != "ok") {
			alert("아이디 중복체크를 해주세요.");
			return;			
		}
		

		if(ff.userGender[0].checked == false && ff.userGender[1].checked == false && ff.userGender[2].checked == false) {
			alert("성별을 체크하세요.");
			return;
		}

		if(ff.userName.value == "") {
			alert("이름을 입력하세요");
			ff.userName.focus();
			return;
		}


		if(ff.userPassword.value =="") {
			alert("패스워드를 입력하세요.");
			ff.userPassword.focus();
			return;
		}

		if(ff.user_repwd.value =="") {
			alert("입력한 패스워드를 재입력하세요.");
			ff.user_repwd.focus();
			return;
		}

		if(ff.user_repwd.value != ff.userPassword.value) {
			alert("패스워드가 일치하지 않습니다.");
			ff.user_repwd.value="";
			ff.user_repwd.focus();
			return;
		}

		if(ff.agree_check[0].checked == false && ff.agree_check[1].checked == false) {
			alert("이용약관에 동의 하세요.");
			ff.agree_check.focus();
			return;
		}
		if(ff.agree_check[0].checked == true) {
			alert("회원가입 되었습니다.");
			ff.action="Enterprise_proc.jsp";
			ff.submit();
			
		}
		if(ff.agree_check[1].checked == true){			
			alert("블랙리스트에 추가되었습니다.");
			ff.action="Enterprise_proc.jsp";
			ff.submit();			
		}
		
	}
	// 아이디 입력창에 값 입력시 hidden에 idUncheck를 세팅한다.
	// 이렇게 하는 이유는 중복체크 후 다시 아이디 창이 새로운 아이디를 입력했을 때
	// 다시 중복체크를 하도록 한다.
	function inputIdChk() {
		document.userInfo.idDuplication.value ="idUncheck";
	}
	function cancel() {
		ff = document.register;
		ff.action="login.jsp"
		ff.submit();
	}

	function check_id() {
		
		ff = document.register;
		if(ff.userID.value ==""){
			alert("아이디를 입력하세요");
			ff.userID.focus();
			return;
		}
		else {
			ff.action="check_id_proc.jsp";
			ff.submit();
		}
	}
	function check_duplication() {
		document.register.idDuplication.value = "<%=request.getParameter("idDuplication") %>"

		document.register.userID.value = "<%=request.getParameter("userID2") %>";
		if(document.register.userID.value== "null")
		{
			document.register.userID.value="";
		}
	}

    function characterCheck() {
        var RegExp = /[ \{\}\[\]\/?.,;:|\)*~`!^\-_+┼<>@\#$%&\'\"\\\(\=]/gi;//정규식 구문
        
        var userid = document.getElementsByName("userID")[0]
        if (RegExp.test(userid.value)) {
            alert("특수문자는 입력하실 수 없습니다.");
            userid.value = userid.value.substring(0, userid.value.length - 1);//특수문자를 지우는 구문
        }
        
        var username = document.getElementsByName("userName")[0]
        if (RegExp.test(username.value)) {
            alert("특수문자는 입력하실 수 없습니다.");
            username.value = username.value.substring(0, username.value.length - 1);//특수문자를 지우는 구문
        }
        var RegExp2 = /\s/;
        var userpwd = document.getElementsByName("userPassword")[0]
        if (RegExp2.test(userpwd.value)) {
            alert("비밀번호에 스페이스바는 입력하실 수 없습니다.");
            userpwd.value = userpwd.value.substring(0, username.value.length - 1);//특수문자를 지우는 구문
        }
    }

  </script>
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

  </head>

  <body onload="check_duplication()">

    <div class="navbar-wrapper">
      <div class="navbar-wrapper-inner">

        <div class="container">

          <div class="masthead clearfix">
            <div class="inner">
              <nav>
                <ul class="nav masthead-nav">
                </ul>
              </nav>
            </div>
            <p class="lead">
              <form name="register" method="post" action="Enterprise_proc.jsp">
		<fieldset>
			<legend align="left" class="panel-title">회원 가입</legend>
			<table >
				<tr >
					<td>아이디</td>
					<td style="color:black" class="label label-default">					
						<input type="text" name="userID" onkeyup="characterCheck()" onkeydown="characterCheck()">
					</td>
					<td> 
						<input type="button" class="btn btn-xs btn-default" value="중복확인" onclick="check_id()">
						<input type="hidden" name="idDuplication" id="idDuplication" value="idUncheck">
					</td>					
				</tr>
				<tr>
					<td>성별</td>
					<td>
						<input name="userGender" type="radio" value="M"><label for="man">남자</label>
						<input name="userGender" type="radio" value="W"><label for="woman">여자</label>
						<input name="userGender" type="radio" value="M"><label for="manwoman">혼종</label>
					</td>
				</tr>
				<tr >
					<td>이름</td>
					<td style="color:black" class="label label-default"><input name="userName" type="text" onkeyup="characterCheck()" onkeydown="characterCheck()"></td>
				</tr>

				<tr>
					<td><label for="pwd"> 패스워드 </label></td>
					<td style="color:black" class="label label-default"><input type="password" id="pwd" name="userPassword" onkeyup="characterCheck()" onkeydown="characterCheck()"></td>
				</tr>
				<tr>
					<td ><label for="repwd"> 재입력 </label></td>
					<td style="color:black" class="label label-default"><input type="password" id="repwd" name="user_repwd" onkeyup="characterCheck()" onkeydown="characterCheck()"></td>
				</tr>
			</table>
		</fieldset>

		<fieldset style="margin-top:20px">
			<legend  align="left" class="panel-title">이용약관</legend>
			<table>
				<tr>
					<td>
						<textarea style="color:black" name="agree_text" rows="5" cols="73" readonly>
사용자 이용 약관 동의내용 입니다.
이터널은 갓겜이다 ㅇㅈ?
기타 문의 : 안받음
							
						</textarea>
					</td>
				</tr>
				<tr>
					<td align="right">
						<input id="yes" name="agree_check" type="radio" value="Y"><label for="man">ㅇㅈ</label>
						<input id="no" name="agree_check" type="radio" value="N"><label for="woman">ㄴㄴ</label>
											
					</td>
				</tr>				
			</table>
			<br>
			<input class="btn btn-xs btn-default" type="button" value="회원 가입" onclick="check();">
			<input class="btn btn-xs btn-default" type="button" value="취소" onclick="cancel();">
		</fieldset>
	</form>

                
          </div>

          <div class="inner cover">   

            
          </div>

        </div>

      </div>

    </div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
