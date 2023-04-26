<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--/jspstudy1/src/main/webapp/upload/upload.jsp 
	1. enctype ="multipart/form-data" 형식으로 요청됨.
		=> request 객체 사용 안됨. request 객체에 파라미터 정보, 파일 정보, 파일 내용 이 저장됨.
		=> cos.jar 파일의 설정된 MultipartRequest 객체 사용됨.
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 업로드 결과</title>
</head>
<body>
<%
	//업로드 되는 실제 경로 : 웹어플리케이션폴더/upload 폴더로 설정함
	String uploadPath = application.getRealPath("/")+"upload/";
	int size = 10*1024*1024; //업로드 가능한 파일의 최대 크기 설정
	File f = new File(uploadPath);
	if(!f.exists()) f.mkdirs(); //업로드 폴더가 없다면 폴더를 생성
	MultipartRequest multi = new MultipartRequest(request,uploadPath,size,"UTF-8");
	/*
		request : 요청정보. 파라미터, 파일정보, 파일내용
		uploadPath : 파일이 업로드 되는 폴더 경로
		size : 최대 업로드 파일의 크기
		URF-8 : 파라미터값 인코딩 코드
		=> MultipartRequest 객체생성시 업로드 완료
	*/
	String name = multi.getParameter("name");
	String title = multi.getParameter("title");
	String fname = multi.getFilesystemName("file1"); //파일이름
%>
업로드 위치 : <%=uploadPath %><br>
올린사람 : <%=name %><br>
제목 : <%=title %><br>
파일 : <a href="<%=fname%>"><%=fname %></a><br>
<img src="<%=fname %>">
</body>
</html>