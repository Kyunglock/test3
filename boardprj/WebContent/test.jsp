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
        // ������üũ
        var maxSize  = 5 * 1024 * 1024    //30MB
        var fileSize = 0;

	// ������ Ȯ��
	var browser=navigator.appName;
	
	// �ͽ��÷η��� ���
	if (browser=="Microsoft Internet Explorer")
	{
		var oas = new ActiveXObject("Scripting.FileSystemObject");
		fileSize = oas.getFile( file.value ).size;
	}
	// �ͽ��÷η��� �ƴҰ��
	else
	{
		fileSize = file.files[0].size;
	}


	alert("���ϻ����� : "+ fileSize +", �ִ����ϻ����� : 5MB");

        if(fileSize > maxSize)
        {
            alert("÷������ ������� 5MB �̳��� ��� �����մϴ�.    ");
            return;
        }

        document.fileForm.submit();
}
</script>
</head>
<form method="post" enctype="multipart/form-data" action="imgup.jsp" name="fileForm">
<input type="file" name="filename1" size=40>
<input type="button" value="���ε�" onclick="fileCheck(this.form.filename1)"><br><br>
</form>

<body>

</body>
</html>