<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>paramTest2.jsp</h1>
	<%
		String name = request.getParameter("name");
		String age = request.getParameter("age");
	
	%>
	<form name="param2" action="paramTest3.jsp">
	<input type="hidden" name="name" value="<%=name%>" >
	<input type="hidden" name="age" value="<%=age%>" >
	<label>주소</label>
	<input type="text" name="addr"><br>
	<label>전화번호</label>
	<input type="text" name="tel"><br>
	<input type="submit" value="전달"><br>
	</form>
</body>
</html>