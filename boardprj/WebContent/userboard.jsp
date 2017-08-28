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

<% request.setCharacterEncoding("UTF-8"); %> <!-- 건너오는 데이터를 UTF-8로 받을 수 있도록 -->
<jsp:useBean id="board" class="board.Board" scope="page" />
<jsp:setProperty name="board" property="itemNum" />
<jsp:setProperty name="board" property="itemTitle" />
<jsp:setProperty name="board" property="madeUserID" />
<jsp:setProperty name="board" property="itemProduced" />
<jsp:setProperty name="board" property="joinCount" />


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
            <li><a href="shopping/shopboard_test.jsp">카드목록보기</a></li>
            <li><a href="shopping/getCard.jsp">카드뽑기</a></li>
            <li><a href="shopping/Enhence.jsp">카드강화하기</a></li>
            <li><a href="fight/fight_room.jsp">카드대전</a></li>
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
          	<li class="active"><a href="#">카드 <span class="sr-only">(current)</span></a></li>
			<li><a href="shopping/shopboard.jsp">카드보유목록 </a></li>
			<li><a href="shopping/getCard.jsp">카드뽑기</a></li>
            <li><a href="shopping/Enhence.jsp">카드강화하기</a></li>
            <li><a href="fight/fight_room.jsp">카드대전</a></li>
          </ul>
          <ul class="nav nav-sidebar">

          </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <!-- 로그인 사용자 정보 -->          
          <h2 class="sub-header">자유게시판</h2>
          <div class="table-responsive">
            <table class="table table-striped" style="margin:auto; text-align:center;">
              <thead style="margin:auto; text-align:center;">
                <tr>
                  <td><h4><strong>글번호</strong></h4></td>
                  <td colspan="2" width="50%"><h4><strong>글제목</strong></h4></td>
                  <td><h4><strong>글쓴이</strong></h4></td>
                  <td><h4><strong>작성일</strong></h4></td>
                  <td><h4><strong>조회수</strong></h4></td>
                </tr>
              </thead>
              <tbody>
          		  	<%  	
				  		BoardDAO boardDAO = new BoardDAO();
          		 	 	ArrayList<Board> list;
          		  		int listNum = Integer.parseInt(request.getParameter("itemRoom"));
          		  		
          		  		if(request.getParameter("itemRoom").equals("0")) {
          		  			list = boardDAO.getList(boardDAO.getRoom());
          		  		}
          		  		else {
          		  			listNum=boardDAO.getRoom() - listNum + 1;
          		  			list = boardDAO.getList(listNum);
          		  		}
          		  		
				  		for(int i=0; i< list.size(); i++){
				  	%>
                <tr>
                	<td>
                		<%=list.get(i).getItemNum() %>
                	</td>
                	<td colspan="2" width="50%">
                		<a href="read.jsp?itemNum=<%=list.get(i).getItemNum() %>"><%=list.get(i).getItemTitle() %></a> 
                	</td>
                	<td>              		
                		<%=list.get(i).getMadeUserID() %> 		
                	</td>
                	<td><%=list.get(i).getItemProduced() %></td>
                	<td><%=list.get(i).getJoinCount() %></td>
                	<% 
				  		}
				  		
                	%>
                </tr>                
              </tbody>
            </table> 
            <div class="text-center">
            
            	<% 
            		
            		BoardDAO roomlist = new BoardDAO();
            		if(roomlist.getRoom() == -1)
            		{
            			PrintWriter script = response.getWriter();
            			script.println("<script>");
            			script.println("alert('오류요')");
            			script.println("</script>");
            		}
            		for(int roomNum = 1; roomNum<=roomlist.getRoom();roomNum++) {
            	%>
            		<ul class="pagination">
            		<li><a href="userboard.jsp?itemRoom=<%=roomNum %>"><%=roomNum %></a></li>
            		</ul>	
            	<%
            		}
            	%>
            <a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
            
          	</div>
        </div>
      </div>
    </div>
    </div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="js/bootstrap.min.js"></script>
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
    <script src="js/vendor/holder.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>