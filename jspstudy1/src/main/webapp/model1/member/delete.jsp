<%@page import="model.Member"%>
<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	1.파라미터 정보 저장
	2.로그인정보 검증
		- 로그아웃상태 : 로그인하세요 메세지 출력 후 loginForm.jsp로 페이지 이동
		- 다른사람 탈퇴(관리자 제외) : 본인만 탈퇴 가능 메세지 출력 main.jsp 페이지 이동
	3.관리자 탈퇴는 검증
		- 관리자 정보 탈퇴 : 관리자는 탈퇴 불가. list.jsp 페이지 이동
	4.비밀번호 검증
		로그인 정보로 비밀번호 검증
		- 비밀번호 불일치 : 비밀번호 오류 메세지 출력. deleteForm.jsp로 페이지 이동
	5.db에서 delete 실행
		boolean MemberDao.delete(id)
		- 탈퇴성공 : 
			- 일반사용자 : 로그아웃 실행. 탈퇴가 완료되었습니다. 출력 후 loginForm.jsp로 이동(세션정보지우기)
			- 관리자가 다른사람 탈퇴 : 탈퇴 완료 메세지 출력 후. list.jsp로 페이지 이동
		- 탈퇴실패 :
			- 일반사용자 : 탈퇴 실패 메세지 출력 후. info.jsp로 페이지 이동
			- 관리자    : 탈퇴 실패 메세지 출력 후. list.jsp로 페이지 이동
 --%>
 <%
 	//1 : 파라미터 정보 저장
 	String id = request.getParameter("id");
 	String pass = request.getParameter("pass");
 	
 	//2 : 로그인 정보 검증
 	String login = (String)session.getAttribute("login");
	//로그아웃상태다
	String msg = null;
	String url = null;
 	if(login ==null) { //로그아웃상태
 		msg = "로그인하세요";
 		url = "loginForm.jsp";
 	} else if(!id.equals(login) && !login.equals("admin")){
 		System.out.println(login);
 		msg = "본인만 탈퇴 가능합니다";
 		url = "main.jsp";
 	//관리자 검증
 	} else if(id.equals("admin")){
 		msg = "관리자는 탈퇴가 불가능합니다";
 		url = "list.jsp";
 	} else { //탈퇴가능상태
 	//4 :비밀번호 검증
 	MemberDao dao = new MemberDao();
 	Member dbMem = dao.selectOne(login); //로그인한 사람 비밀번호 비교 dbMem-> 로그인한 사용자의 정보 조회
 	if(pass.equals(dbMem.getPass())) { //비밀번호 일치하는 경우 
 		//pass -> 파라미터에서 가져왔다. 입력한 비밀번호 값.
 		//dbMem.getPass -> db에서 가져온 비밀번호
 		if(dao.delete(id)) { //탈퇴성공 리턴타입 boolean 매개변수 string
 				msg=id +"고객님 탈퇴성공";
 			if(login.equals("admin")) {
 				url = "list.jsp";
 			} else { //일반 사용자
				session.invalidate();
				url = "loginForm.jsp";
 			}
 		} else{ //탈퇴 실패
 			msg=id+"고객님 탈퇴시 오류 발생. 탈퇴 실패";
 			if(login.equals("admin")) {
 				url = "list.jsp";
 			} else { //일반 사용자
				url = "info.jsp?id="+id;
 			}
 		}
 	} else { //비밀번호 오류
 		msg = "비밀번호 오류";
 		url = "deleteForm.jsp?id="+id;//id파라미터값 들어가야함
 		
 		}
 	}
 
 %>
<script type="text/javascript">
 	alert("<%=msg%>")
 	location.href="<%=url%>"
</script> 
 
 