<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>paramTest3</title>
</head>
<body>
	<h1>paramTest3.jsp</h1>
	<%
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		String addr = request.getParameter("addr");
		String tel = request.getParameter("tel");
	%>
	<h3>이름:<%=name %></h3>
	<h3>나이:<%=age %></h3>
	<h3>주소:<%=addr %></h3>
	<h3>전번:<%=tel %></h3>
</body>
</html>