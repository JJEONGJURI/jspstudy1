<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--/jspstudy1/src/main/webapp/model1/board/writeForm.jsp --%>
<% 
	String boardid = (String)session.getAttribute("boardid");
	if(boardid == null) boardid="1";
	String login =(String)session.getAttribute("login");
	if(boardid.equals("1")) {
		if(login==null || !login.equals("admin")) { %>
		<script>
		alert("관리자만 공지사항에 글쓰기가 가능합니다.")
		location.href="list.jsp?boardid=1"
		</script> 
		<% return;
		}}%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글쓰기</title>
	

<script type="text/javascript">
	function inputcheck() {
		f = document.f;
		if (f.writer.value == "") {
			alert("글쓴이를 입력하세요");
			f.writer.focus();
			return;
		}
		if (f.pass.value == "") {
			alert("비밀번호를 입력하세요");
			f.pass.focus();
			return;
		}
		if (f.title.value == "") {
			alert("제목을 입력하세요");
			f.title.focus();
			return;
		}
		if (f.content.value == "") {
			alert("내용을 입력하세요");
			f.content.focus();
			return;
		}
		
		f.submit(); //submit 발생 => form의 action 페이지로 요청
	}
</script>
</head>
<body>
	<form action="write.jsp" method="post" enctype="multipart/form-data"
		name="f">
		<table>
			<caption>게시판 글쓰기</caption>
			<tr>
				<td>글쓴이</td>
				<td><input type="text" name="writer"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pass"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="15" name="content"></textarea></td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td><input type="file" name="file1"></td>
			</tr>
			<tr>
				<td colspan="2"><a href="javascript:inputcheck()">[게시물등록]</a></td>
			</tr>
		</table>

	</form>
</body>
</html>