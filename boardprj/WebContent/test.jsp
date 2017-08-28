<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	function fileCheck( file )
	{
        // 사이즈체크
        var maxSize  = 5 * 1024 * 1024    //30MB
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


	alert("파일사이즈 : "+ fileSize +", 최대파일사이즈 : 5MB");

        if(fileSize > maxSize)
        {
            alert("첨부파일 사이즈는 5MB 이내로 등록 가능합니다.    ");
            return;
        }

        document.fileForm.submit();
}
</script>
</head>
<form method="post" enctype="multipart/form-data" action="imgup.jsp" name="fileForm">
<input type="file" name="filename1" size=40>
<input type="button" value="업로드" onclick="fileCheck(this.form.filename1)"><br><br>
</form>

<body>

</body>
</html>