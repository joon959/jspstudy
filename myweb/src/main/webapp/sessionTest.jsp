<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sessionTest.jsp</title>
</head>
<body>
<h1>sessionTest.jsp</h1>
<%
String name=(String)session.getAttribute("name");
Integer age =(Integer)session.getAttribute("age");
%>
<h3>이름:<%=name %></h3>
<h3>나이:<%=age %></h3>
<%
session.setAttribute("name", "홍길동");
session.setAttribute("age", 10);
%>
</body>
</html>