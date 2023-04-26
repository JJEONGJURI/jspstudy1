<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--/jspstudy1/src/main/webapp/model1/member/deleteForm.jsp
	1. id 파라미터 저장
	2. 로그인 정보 검증
		- 로그아웃 상태 : 로그인하세요. 메세지 출력. loginForm.jsp 로 페이지 이동
		- 관리자 제외. 다른 사용자 탈퇴 불가
			본인만 탈퇴 가능합니다. 메세지 출력. main.jsp  페이지로 이동
	3. 화면 출력
 --%>
<%
	String id = request.getParameter("id");

	String login = (String)session.getAttribute("login");
	if(login == null) { %>
	<script>
		alert("로그인하세요")
		location.href="loginForm.jsp"
	</script>
<%} else if(!id.equals(login) && !login.equals("admin")) {%>
	<script>
		alert("본인 탈퇴만 가능합니다")
		location.href="main.jsp"
	</script>
<%} else { %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
<link rel="stylesheet" href="../../css/main.css">
<script>
	function inputcheck(f) {
		if(f.pass.value =='') {
		alert("비밀번호를 입력하세요")
		f.pass.focus()
		return false
		}
	}
</script>
</head>
<body>
<form action="delete.jsp" method="post" onsubmit="return inputcheck(this)">
<%--this는 form --%> 
	<input type = "hidden" name="id" value="<%=id %>">
	<table><caption>회원비밀번호 입력</caption>
	<tr><th>비밀번호</th>
		<td><input type="password" name="pass"></td></tr>
	<tr><td colspan="2">
		<input type="submit" value="탈퇴하기" /></td></tr>
</table>
</form>
</body>
</html>
<% } %>