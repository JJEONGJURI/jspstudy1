<%@page import="model.Member"%>
<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--/jspstudy1/src/main/webapp/model1/member/login.jsp 
	1. 파라미터 저장.
	2. db 에서 아이디에 해당하는 정보 읽어서 Member 객체에 저장.
	3. db의 내용과 입력된 내용을 비교.
		- 아이디 존재? : 없는 경우 : 아이디 없음 메세지 출력하고, loginForm. jsp 페이지로 이동
		-			 있는 경우 :
		- 비밀번호 비교? : 
				일치 : session에 로그인 등록. main.jsp 페이지 이동
				불일치 : 비밀번호 오류 메세지 출력. loginForm.jsp 페이지 이동
--%>
<%
	//1
	request.setCharacterEncoding("UTF-8"); //한글 가능하게 하기
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	
	//2
	//mem : id 값에 해당하는 정보를 db의 member에서 조회하여, db에 대한 정보 저장
	Member mem = new MemberDao().selectOne(id);
	
	//3
	String msg = "아이디 오류";
	String url = "loginForm.jsp";
	if(mem != null) { //아이디 존재
		//pass : 입력된 비밀번호
		//mem.getPass() : db에 저장된 비밀번호
		if(pass.equals(mem.getPass())) { //비밀번호 일치
			session.setAttribute("login",id); //로그인 정보를 session에 저장
			msg = mem.getName()+"님이 로그인 했습니다.";
			url = "main.jsp";
		} else { //비밀번호 오류
			msg = "비밀번호가 틀립니다.";
		}
	}
%>
<script>
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>