<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--/jspstudy1/src/main/webapp/upload/uploadForm.jsp 
	1. 파일 다운로드 : http://servlets.com/cos/
	2. cos-22.05.zip 파일 다운받기
	3. 압축 풀고 lib 폴더의 cos.jar 파일을 복사하여 WEB-INF/lib/ 붙여넣기
--%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 업로드 예제</title>
<link rel="stylesheet" href="../css/main.css">
</head>
<body>
<%--enctype="multipart/form-data" : 파일 업로드를 위한 설정 
									파라미터와 업로드할 파일의 내용까지 서버로 전송
		(1) <input type="file" ..> 태그 존재. => 선택된 파일의 내용까지 서버로 전송
		(2) 반드시 전송 방법은 method="post" 여야 함.
		(3) upload.jsp 페이지는 request 객체 직접 사용 불가.
--%>
<form action="upload.jsp" method="post" enctype="multipart/form-data">
<table><tr><th>올린사람</th><td><input type="text" name="name"></td></tr>
<tr><th>제목</th><td><input type="text" name="title"></td></tr>
<tr><th>파일</th><td><input type="file" name="file1"></td></tr>
<tr><td colspan="2"><input type="submit" value="전송"></td></tr>
</table>
</form>
</body>
</html>