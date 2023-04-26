<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--/jspstudy1/src/main/webapp/model1/member/logout.jsp 
	1. session의 로그인 정보 제거
//	2. loginForm.jsp 로 페이지 이동	
	3. 로그아웃 되었습니다. 메세지 출력 후 loginForm.jsp 로 페이지 이동	
--%>
<% 
	session.removeAttribute("login"); //login 속성정보 제거.
	session.invalidate(); //새로운 session 객체로 변경. 이전 등록된 속성들이 전부제거
//2.	response.sendRedirect("loginForm.jsp"); //어떤메세지든 다 무시하고 loginForm으로 넘어감.
%>
<%--브라우저가 일을 해야하면 script 써야함 --%>
<script> 
	alert("로그아웃 되었습니다.")
	location.href="loginForm.jsp"
</script>