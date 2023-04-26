<%@page import="model.BoardDao"%>
<%@page import="model.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--/jspstudy1/src/main/webapp/model1/board/delete.jsp
	1. num, pass 파라미터를 변수에 저장.
	2. 비밀번호 검증
		틀린경우 : 비밀번호 오류 메시지 출력, deleteForm.jsp 페이지 이동
	3. 해당게시물이 공지사항 게시물인 경우 관리자만 삭제 가능
	4. 게시물삭제
		boolean BoardDao.delete(num)
		삭제 성공 : list.jsp 페이지 이동
		삭제 실패 : 삭제 실패 메세지 출력, info.jsp 페이지 이동
 --%>
 <%
 	int num = Integer.parseInt(request.getParameter("num"));
 	String pass = request.getParameter("pass");
 	BoardDao dao = new BoardDao();
 	Board board = dao.selectOne(num);
 	String login = (String)session.getAttribute("login");
 	String msg = "비밀번호가 틀렸습니다.";
 	String url = "deleteForm.jsp?num=" + num;
 	if(pass.equals(board.getPass())) {
 		if(board.getBoardid().equals("1") &&
 				(login==null || !login.equals("admin"))){
 			msg = "공지사항은 관리자만 삭제 가능합니다.";
 			url = "list.jsp?boardid=" + board.getBoardid();
 		} else {  //정상적인 삭제 권한.
 			if(dao.delete(num)) {
 			url = "list.jsp?boardid="+board.getBoardid();
 			msg = "게시물을 삭제하였습니다.";
 		} else { //삭제 실패
 			msg = "게시글 삭제 실패";
 			url="info.jsp?num=" +num;
 		}
 				
 	}
 }
 		
 %>
 <script>
 	alert("<%=msg%>");
 	location.href="<%=url%>";
 </script>
 
