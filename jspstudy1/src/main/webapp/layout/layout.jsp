<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%--/jspstudy1/src/main/webapp/layout/layout.jsp 
 <sitemesh:write property='title'/> :
 		joinForm.jsp 페이지의 title 태그의 내용을 적용
 <sitemesh:write property='head'/>
 		joinForm.jsp 페이지의 head 태그의 내용을 적용. title 태그 제외
 <sitemesh:write property='body'/>
 		joinForm.jsp 페이지의 body 태그의 내용을 적용
 --%>
<% String path = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><sitemesh:write property='title'/></title>
<link rel="stylesheet" href="<%=path %>/css/main.css">
<sitemesh:write property='head'/>
</head>
<body>
<table><tr><td colspan="3" style="text-align:right">
<%
	String login = (String)session.getAttribute("login");
	if (login == null) { %>
	<a href="<%=path%>/model1/member/loginForm.jsp">로그인</a>
	<a href="<%=path%>/model1/member/joinForm.jsp">회원가입</a>
<% } else {%>
	<%=login %>님.<a href="<%=path %>/model1/member/logout.jsp">로그아웃</a>
<% } %>
</td></tr>
<tr><td width="15%" valign="top">
	<a href="<%=path %>/model1/member/main.jsp">회원관리</a><br>
	<a href="<%=path %>/model1/board/list.jsp?boardid=1">공지사항</a><br>
	<a href="<%=path %>/model1/board/list.jsp?boardid=2">자유게시판</a><br>
	<a href="<%=path %>/model1/board/list.jsp?boardid=3">QnA</a><br>	
</td>
<td colspan="2" style="text-align: left; vertical-align: top">
<sitemesh:write property='body'/></td></tr>
<tr><td colspan="3">구디아카데미</td></tr>
</table>
</body>
</html>