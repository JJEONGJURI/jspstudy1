<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%--/jspstudy1/src/main/webapp/model1/member/list.jsp 
	1. 관리자만 사용가능 페이지 => 검증
		- 로그아웃상태 : 로그인이 필요합니다. 메세지 출력. loginForm.jsp 페이지 이동
		- 로그인 상태 : 일반사용자 로그인시 "관리자만 가능합니다." 메세지 출력 main.jsp 페이지 이동
	2. db에서 모든 회원정보를 조회. List<Member> 객체로 리턴
		List<Member> MemberDao.list()
	3. List 객체를 화면에 출력하기
	
	=> 문제 : 아이디 클릭시 info.jsp 페이지 호출되도록 프로그램 수정하기.
--%>
<%
	//1
	String login = (String)session.getAttribute("login");
	if(login == null) { %>
	<script>
		alert("로그인 하세요")
		location.href="loginForm.jsp"
	</script>
<%} else if(!login.equals("admin")) {%>
	<script>
		alert("관리자만 조회 가능합니다")
		location.href="main.jsp"
	</script>
<% } else { //정상이면 화면에 내용 출력 
	//list : member 테이블의 모든 정보 저장 객체
	List<Member> list = new MemberDao().list();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록</title>
<link rel="stylesheet" href="../../css/main.css">
</head>
<body>
<table><caption>회원목록</caption>
<tr><th>아이디</th><th>사진</th><th>이름</th><th>성별</th><th>전화</th><th>&nbsp;</th></tr>
<% for(Member m : list) {%>
<tr><td><a href="info.jsp?id=<%=m.getId()%>"><%=m.getId()%></a></td>
<td><img src="picture/<%=m.getPicture()%>" width="30" height="30"></td>
<td><%=m.getName() %></td><td><%=m.getGender()==1?"남":"여"%></td>
<td><%=m.getTel() %></td>
<td><a href="updateForm.jsp?id=<%=m.getId()%>">수정</a>
	<%if(!m.getId().equals("admin")){%>
	<a href="deleteForm.jsp?id=<%=m.getId()%>">강제탈퇴</a>
<% } %>
	</td></tr>
<% } %>
</table>
</body>
</html>
<% } %>