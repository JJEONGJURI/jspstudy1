<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--/jspstudy1/src/main/webapp/model1/member/join.jsp 
	1. 파라미터 정보를  Member 객체에 저장
	2. Member 객체를 이용하여 db에 insert (member 테이블) 저장
	3. 가입성공 : loginForm.jsp 페이지 이동
	   가입실패 : joinForm.jsp 페이지 이동
--%>
<%  //1번 : 파라미터 저장
	request.setCharacterEncoding("UTF-8"); //파라미터 조회전 처음으로 실행
	Member mem = new Member();
	mem.setId(request.getParameter("id"));
	mem.setPass(request.getParameter("pass"));
	mem.setName(request.getParameter("name"));
	mem.setGender(Integer.parseInt(request.getParameter("gender"))); //gender는 int타입으로 형변환 해줘야함
	mem.setTel(request.getParameter("tel"));
	mem.setEmail(request.getParameter("email"));
	mem.setPicture(request.getParameter("picture"));
	
	//2번 : DB 등록
	MemberDao dao = new MemberDao();
	String msg = "회원가입실패";
	String url = "joinForm.jsp";
	//mem : 회원가입 정보 저장하고 있는 객체
	if(dao.insert(mem)) { //insert 타입 형태는 boolean //mem의 타입은 Member
		msg = "회원가입성공";
		url = "loginForm.jsp";
	}
	
%>

<%-- 3번 --%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>";
</script>