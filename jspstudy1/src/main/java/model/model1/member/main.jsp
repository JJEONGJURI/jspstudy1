<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--/jspstudy1/src/main/webapp/model1/member/main.jsp
	1. 로그인 여부 검증
		로그인 상테 : 현재 화면
		로그아웃상태 : 로그인이 필요한 화면입니다. 메세지 출력 후 loginForm.jsp 페이지로 이동 
 --%>
<% 
	//login.jsp에서 session.setAttribute("login",id); 에 login 넣어놨던거 꺼냄
	String login = (String)session.getAttribute("login"); 
	if(login != null) { //로그인된 상태 라면 밑에 화면들 보여준다
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리</title>
</head>
<body>
<h3><%=login %>로 로그인 되었습니다.</h3>
<h3><a href="logout.jsp">로그아웃</a></h3>
<h3><a href="info.jsp?id=<%=login%>">회원정보보기</a></h3>
<% if(login.equals("admin")) {//관리자면 회원목록 보겠다 %>
	<h3><a href="list.jsp">회원목록 보기</a></h3>
<% }%>
</body>
</html>
<% } //if(login !=null) //로그인했을때만 나와야 하기 때문에
else { //로그아웃상태 %> 
 <script type="text/javascript">
  alert("로그인이 필요합니다.")
  location.href="loginForm.jsp"
 </script>
<%} %>