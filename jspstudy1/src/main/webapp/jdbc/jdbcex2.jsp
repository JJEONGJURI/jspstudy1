<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--/jspstudy1/src/main/webapp/jdbc/jdbcex2.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 테이블 읽어 화면에 출력하기</title>
<link rel="stylesheet" href="../css/main.css">
</head>
<body>
<%
	Class.forName("org.mariadb.jdbc.Driver");
	Connection conn = DriverManager.getConnection
	("jdbc:mariadb://localhost:3306/gdudb","gdu","1234");
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery("select * from student");
	ResultSetMetaData rsmt = rs.getMetaData();
%>
<table><tr>
<%
	for(int i=1; i<=rsmt.getColumnCount();i++) {%>
		<th><%=rsmt.getColumnName(i) %></th>
<% } %></tr>
<% while(rs.next())  {%>
<tr>
	<% 
		for(int i=1;i<=rsmt.getColumnCount();i++) {%>
		<td><%=rs.getString(i) %> </td>
	<% } %>
</tr>
<% } %>

</table>

</body>
</html>