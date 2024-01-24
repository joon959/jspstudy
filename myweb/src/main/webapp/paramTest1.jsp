<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>paramTest1.jsp</h1>
	<form name="param1" action="paramTest2.jsp">
	<label>이름</label>
	<input type="text" name="name"><br>
	<label>나이</label>
	<input type="text" name="age"><br>
	<input type="submit" value="전달"><br>
	</form>
</body>
</html>