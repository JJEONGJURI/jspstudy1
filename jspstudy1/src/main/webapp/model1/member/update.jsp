<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--/jspstudy1/src/main/webapp/model1/member/update.jsp 
	1. 모든 파라미터를 Member 객체에 저장
	2. 입력된 비밀번호와 db에 저장된 비밀번호를 비교.
		관리자인 경우 관리자비밀번호로 비교
		불일치  : '비밀번호 오류' 메세지 출력후 updateForm.jsp 페이지 이동
	3. Member 객체의 내용으로 db를 수정하기
		- 성공 : 회원정보 수정 완료 메세지 출력후 info.jsp로 페이지 이동
		- 실패 : 회원정보 수정 실패 메세지 출력 후 updateForm.jsp로 페이지 이동
--%>
<%  //1
	request.setCharacterEncoding("UTF-8");
	Member mem = new Member();
	mem.setId(request.getParameter("id"));
	mem.setPass(request.getParameter("pass"));
	mem.setName(request.getParameter("name"));
	mem.setGender(Integer.parseInt(request.getParameter("gender")));
	mem.setTel(request.getParameter("tel"));
	mem.setEmail(request.getParameter("email"));
	mem.setPicture(request.getParameter("picture"));
	
	//2 : 비밀번호를 위한 db의 데이터 조회 : login 정	보로 조회
	String login = (String)session.getAttribute("login");
	MemberDao dao = new MemberDao();
	Member dbMem = dao.selectOne(login);
	
	String msg = "비밀번호 오류";
	String url = "updateForm.jsp?id=" + mem.getId();
	//mem.getPass() : 입력된 비밀번호
	//dbMem.getPass() : 로그인된 아이디의 비밀번호
	if(mem.getPass().equals(dbMem.getPass())) {
		 if(dao.update(mem)) {
			 msg = "수정 성공";
			 url = "info.jsp?id="+mem.getId(); //id파라미터 필요
		 } else {
			 msg = "수정 실패";
		 }
	} 
%>
<script>
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>