<!-- input 타입으로 보내는것 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>Signin Template for Bootstrap</title>


    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="signin.css" rel="stylesheet">



    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

  <script>
    function Enterprise_site() {
      	ff = document.register;
      	ff.action="Enterprise.jsp"
      	ff.submit();
    }

    function login_site() {
		ff = document.register;
		if(ff.inputId.value =="" || ff.inputPassword.value =="" ){
			alert("아이디나 비밀번호를 입력하세요");
		}
		else 
		{
			ff.action="login_proc.jsp"
			ff.submit();
		}
    }
  </script>
      

  </head>

  <body>

    <div class="container">
		<form class="form-signin" name="register" method="post" action="login_proc.jsp;">
		<!--register이름으로 login_proc에 로그인 데이터들을 전송 -->
        <h2 class="form-signin-heading">Please sign in</h2>
        <label for="inputEmail" class="sr-only">ID</label>
        
        <input type="text" class="form-control" placeholder="아이디" name="userID">
        
        <label for="inputPassword" class="sr-only">Password</label>
        
        <input type="password" class="form-control" placeholder="비밀번호" name="userPassword">
        
        <div class="checkbox" >
          <table style="align:right;border:1px">
	          <tr>
	            <td>
	              <button  class="btn btn-sm btn-primary" type="submit" onclick="login_site()">로그인</button>
	            </td>
	            <td >
	            	<input type="hidden" name="userID2" value=null>
	            	<input type="hidden" name="idDuplication" value=null>            	
	              	<input type="button" class="btn btn-sm btn-primary" onclick="Enterprise_site()" value="회원가입">              	
	            </td>
	            <td>
	              	<input type="button"  class="btn btn-sm btn-primary" value="관리자">
	            </td>
	          </tr>
          </table>
        </div>
        </form>


    </div> <!-- /container -->


    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
