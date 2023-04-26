<%@page import="model.BoardDao"%>
<%@page import="model.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /jspstudy1/src/main/webapp/model1/board/info.jsp
	1. num 파라미터 저장.
	   session에서 boardid 조회하기.
	2. num값의 게시물을 db에서 조회.
	   Board b = BoardDao.selectOne(num)
	3. num값의 게시물의 조회수 증가시키기
	   void BoardDao.readcntAdd(num)
	4. 조회된 게시물 화면에 출력.
--%>
<%
	//1 : 파라미터 저장
	int num = Integer.parseInt(request.getParameter("num"));
	//session에서 boardid 조회하기.
	String boardid = (String)session.getAttribute("boardid");
	//boardid 는 세션에서 속성으로 등록되어있음
	if(boardid ==null) boardid="1";
	
	//2 :  num값의 게시물을 db에서 조회.
	BoardDao dao = new BoardDao();
	//b : board 테이블에서 num(조회하는 게시물번호)에 해당하는 데이터 저장
	Board b = dao.selectOne(num);
	
	//3
	dao.readcntAdd(num);	 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 상세 보기</title>
</head>
<body>
<table><caption>게시물 상세 보기</caption>
<tr><th width="20%">글쓴이</th>
<td width="80%" style="text-align: left"><%=b.getWriter() %></td></tr>
<tr><th>제목</th><td style="text-align:left"><%=b.getTitle() %></td></tr>
<tr><th>내용</th><td><table style="width:100%; height:250px;">
<tr><td
style="border-width: 0px; vertical-align: top; text-align:left">
	<%=b.getContent() %> </td></tr></table></td></tr>
<tr><th>첨부파일</th>
	<td><% if(b.getFile1()==null || b.getFile1().trim().equals("")) { %>
	&nbsp;
	<% } else { //첨부파일이 존재 %>
	<a href="file/<%=b.getFile1() %>"><%=b.getFile1() %></a>
	<% } %></td></tr>
<tr><td colspan="2">
	<a href="replyForm.jsp?num=<%=b.getNum() %>">[답변]</a>
<% String login = (String)session.getAttribute("login");
	if(!boardid.equals("1") || (login != null && login.equals("admin"))) {%>
	<a href="updateForm.jsp?num=<%=b.getNum()%>">[수정]</a>
	<a href="deleteForm.jsp?num=<%=b.getNum()%>">[삭제]</a>
<% } %> <a href="list.jsp">[목록]</a></td></tr></table>
</body>
</html>