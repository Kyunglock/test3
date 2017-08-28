
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="board.BoardDAO" %> <!--회원데이터베이스 테이블에 접근할 수 있도록 돕는 클래스 데이터베이스 데이터 넣고 빼기  -->
<%@ page import="board.Board" %>
<%@ page import="java.io.PrintWriter" %> <!--자바스크립트 문장을 작성하기 위한 문장  -->
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*" %>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %> <!-- 건너오는 데이터를 UTF-8로 받을 수 있도록 -->
<jsp:useBean id="board" class="board.Board" scope="page" />
<jsp:setProperty name="board" property="itemNum" />
<jsp:setProperty name="board" property="itemTitle" />
<jsp:setProperty name="board" property="madeUserID" />
<jsp:setProperty name="board" property="itemProduced" />
<jsp:setProperty name="board" property="joinCount" />
<%
	request.setCharacterEncoding("utf-8");
	String realFolder = "";
	String filename1 = "";
	int maxSize = 1024*1024*5;
	String encType = "utf-8";
	String savefile = "img";
	ServletContext scontext = getServletContext();
	realFolder = scontext.getRealPath(savefile);
	

	MultipartRequest multi=new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
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

    <title>Dashboard Template for Bootstrap</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="dashboard.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <script type="text/javascript">
    	
		function create()
		{	
			location.href = "write.jsp"
		}
		function submit()
		{
			
		}
    </script>
<script>
	function fileCheck( file )
	{
        // 사이즈체크
        var maxSize  = 1024 * 1024 * 5    //30MB
        var fileSize = 0;

		// 브라우저 확인
		var browser=navigator.appName;
		
		// 익스플로러일 경우
		if (browser=="Microsoft Internet Explorer")
		{
			var oas = new ActiveXObject("Scripting.FileSystemObject");
			fileSize = oas.getFile( file.value ).size;
		}
		// 익스플로러가 아닐경우
		else
		{		
			fileSize = file.files[0].size;			
		}
	
	    if(fileSize > maxSize)
	    {
	        alert("첨부파일 사이즈는 5MB 이내로 등록 가능합니다.    ");
	        location.href= "write.jsp";
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
            <li class="active"><a href="userboard.jsp?itemRoom=0">자유게시판 <span class="sr-only">(current)</span></a></li>

          </ul>
          <ul class="nav nav-sidebar">
			<li class="active"><a href="#">쇼핑몰 <span class="sr-only">(current)</span></a></li>
			<li><a href="#">FAQ채팅봇</a></li>
            <li><a href="#">건의사항</a></li>
            <li><a href="#">Export</a></li>
          </ul>
          <ul class="nav nav-sidebar">

          </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <!-- 로그인 사용자 정보 -->          
          <h2 class="sub-header">자유게시판</h2>
          <div class="table-responsive">
          	<form method="post" action="write_proc.jsp" enctype="multipart/form-data" name="fileForm">
            <table class="table table-striped" style="margin:auto; text-align:center; border: 1px solid #dddddd">
              <thead style="margin:auto; text-align:center;">
                <tr>
                  <th colspan="2" style="background-color:#eeeeee; text-align:center;">게시판 글쓰기 양식</th>                  
                </tr>
              </thead>
              <tbody>
              	<tr>              	
              		<td colspan="2">
              			<input type="file" name="filename1" class="btn btn-primary" onChange="fileCheck(this.form.filename1)">
              		</td>
              	</tr>
              	
              	<tr>
              		<td colspan="2"><input type="text" class="form-control" placeholder="글 제목" name="itemTitle" maxlength="50"></td>
              	</tr>

              	<tr>
        					<%
        					String fileName = board.getItemImage();
        					if(board.getItemImage() != null){
        					%>
        							
        						<td colspan="3"><img src="/boardprj/img/<%=board.getItemImage() %>" width=512 height=384></td>
        					<%
        					}
        					
        					%>
        				</tr> 
              	<tr>
              		<td colspan="2"><textarea class="form-control" placeholder="글 내용" name="ITEMCONTENT" maxlength="2048" style="height: 350px"></textarea></td>
              	</tr>
              </tbody>
            </table>
            <input type="submit" value="글쓰기" class="btn btn-primary pull-right">
            
			</form>
        </div>
      </div>
    </div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
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