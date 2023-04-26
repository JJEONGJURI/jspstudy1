<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /jspstudy1/src/main/webapp/jdbc/jdbcex1.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jdbc 연결</title>
</head>
<body>
<%
	//Driver 선택
	Class.forName("org.mariadb.jdbc.Driver");
	//Connection 객체 생성 : db와 연결
	Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/gdudb","gdu","1234");
	//SQL 명령어 전달 객체.
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery("select * from emp");
	while(rs.next()) {%>
	<%= rs.getString(1)  %>,<%= rs.getString(2) %>,
	<%= rs.getString(3)  %>,<%= rs.getString(4) %><br>
<%  } %>
</body>
</html>