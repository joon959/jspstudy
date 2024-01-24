<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중복확인</title>
</head>
<style>
h1{
	text-align: center;
}
fieldset{
	margin: 0px auto;
	width: 400px;
}
table{
	margin: 0px auto;
	text-align: center;
}
table th{
	text-align: left;
	width: 100px;
}
</style>
<body>
<section>
<article>
<h1>아이디 중복 검사</h1>
<form name="testId" action="testId_ok.jsp">
<fieldset>
<legend>아이디 중복 검사</legend>
<table>
	<tr>
	<th>ID</th>
	<td><input type="text" name="id"></td>
	<td><input type="submit" value="중복검사"></td>
	</tr>
</table>
</fieldset>
</form>
</article>
</section>
</body>
</html>