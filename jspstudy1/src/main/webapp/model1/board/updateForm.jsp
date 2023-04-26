<%@page import="model.BoardDao"%>
<%@page import="model.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- /jspstudy1/src/main/webapp/model1/board/updateForm.jsp
	1. 공지사항인 경우 관리자만 수정 가능
	2. num값에 해당하는 게시물을 조회
	3. 조회된 게시물을 화면에 출력
--%>
<%
String boardid = (String) session.getAttribute("boardid");
if (boardid == null)
	boardid = "1";
String login = (String) session.getAttribute("login");
if (boardid.equals("1")) {
	if (login == null || !login.equals("admin")) {
%>
<script>
	alert("관리자만 수정 가능합니다.")
	location.href = "list.jsp?boardid=1"
</script>
<%
return;
}
}
int num = Integer.parseInt(request.getParameter("num"));
Board b = new BoardDao().selectOne(num);
String boardName = "공지사항";
switch (boardid) {
case "2" :
boardName = "자유게시판";
break;
case "3" :
boardName = "QnA";
break;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 수정 화면</title>
<script>
	function file_delete() {
		document.f.file2.value = "";
		file
		desc.style.display = "none";
	}
</script>
</head>
<body>
	<form action="update.jsp" method="post" enctype="multipart/form-data"
		name="f">
		<input type="hidden" name="num" value="<%=b.getNum()%>"> <input
			type="hidden" name="file2"
			value="<%=b.getFile1() == null ? "" : b.getFile1()%>">
		<table>
			<caption>
				<%=boardName%>수정
			</caption>
			<tr>
				<td>글쓴이</td>
				<td><input type="text" name="writer"
					value="<%=b.getWriter()%>"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pass"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" value="<%=b.getTitle()%>"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="15" name="content"><%=b.getContent()%></textarea></td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td style="text-align: left">
					<%
					if (b.getFile1() != null && (!b.getFile1().equals(""))) {
					%>
					<div id="file_desc"><%=b.getFile1()%>
						<a href="javascript:file_delete()">[첨부파일 삭제]</a>
					</div> <%
 }
 %> <input type="file" name="file1">
				</td>
			</tr>
			<tr>
				<td colspan="2"><a href="javascript:document.f.submit()">[게시물수정]</a></td>
			</tr>
		</table>
	</form>
</body>
</html>