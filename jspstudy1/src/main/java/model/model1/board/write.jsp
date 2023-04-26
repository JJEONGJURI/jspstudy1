<%@page import="model.BoardDao"%>
<%@page import="model.Board"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--/jspstudy1/src/main/webapp/model1/board/write.jsp
	1. 파라미터값 Board 객체에 저장. boardid 파라미터가 없으면 1로 설정하기
		MultipartRequest 객체 사용
	2. num 프로퍼티를 db 등록된 최대 num 값+1로 설정하기
	3. db의 board 테이블에 등록
		등록성공 : list.jsp 페이지 이동
		등록실패 : 메세지 출력. writeForm.jsp 페이지 이동
 --%>
 <%
 	String path = application.getRealPath("/") + "model1/board/file";
 	File f = new File(path);
 	if(!f.exists()) f.mkdirs();
 	MultipartRequest multi = new MultipartRequest(request,path,10*1024*1024,"UTF-8"); //파일업로드때문에
	Board board = new Board();
	board.setWriter(multi.getParameter("writer"));
	board.setPass(multi.getParameter("pass"));
	board.setTitle(multi.getParameter("title"));
	board.setContent(multi.getParameter("content"));
	board.setFile1(multi.getFilesystemName("file1"));
	String boardid = (String)session.getAttribute("boardid");
	if(boardid == null) boardid ="1";
	board.setBoardid(boardid);
	BoardDao dao = new BoardDao();
	//num : board 테이블의 num컬럼의 값 중 최대값
	int num = dao.maxnum(); //board 테이블에 등록된 최대 num값
	board.setNum(++num); // 최대값+1
	board.setGrp(num); //grp 컬럼 : 최초게시물의 번호
	if(dao.insert(board)) { //board 테이블에 게시물 등록
		response.sendRedirect("list.jsp");
	} else {%>
	<script>
		alert("게시물 등록 실패")
		location.href="writeForm.jsp"
	</script>
<%	} %>
	