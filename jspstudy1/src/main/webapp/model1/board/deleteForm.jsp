<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--/jspstudy1/src/main/webapp/model1/board/deleteForm.jsp
	1. 공지사항인 경우 관리자가 아니면  화면 출력 불가
 --%>
 <%
 	String boardid = (String)session.getAttribute("boardid");
 	if(boardid == null) 
 		boardid = "1";
 	String login = (String)session.getAttribute("login");
 	if(boardid.equals("1")) {
 		if(login == null || !login.equals("admin")) {
 %>
 <script>
 	alert("관리자만 삭제 가능합니다.")
 	location.href = "list.jsp?boardid=<%=boardid%>"
 </script>
 <% return; } } %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 삭제</title>
</head>
<body>
	<h2>게시물 삭제</h2>	
	<form action="delete.jsp" method="post">
		<input type="hidden" name="num" 
			value="<%=request.getParameter("num") %>">
		<label>Password:</label>
		<input type="password" class="form-control" name="pass">
	<div id="center" style="padding: 3px;">
		<button type="submit">게시물삭제</button>
	</div>
</form>
</body>
</html>