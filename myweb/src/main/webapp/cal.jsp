<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계산기</title>
<link rel="stylesheet" type="text/css" href="css/mainLayout.css">
<style>
h1{
	text-align: center;
}
fieldset{
	width: 550px;
	margin: 0px auto;
	text-align: center;
}
.fontSize{
	text-align: center;
}
select{
	height:30px;
}

div{
	text-align: center;
}
input[type=text]{
	width:80px;
	height: 30px;
	text-align: center;
}

</style>
</head>
<body>
<%@include file="header.jsp"%>
	<h1>사칙 계산기</h1>
	<form name="fm" action="cal_ok.jsp">
	<fieldset>
	<legend>계산기	</legend>
	<div>
	<input type="text" name="first">
	<select name="pmxd">
		<option value="+" selected>+</option>
		<option value="-">-</option>
		<option value="x">*</option>
		<option value="/">/</option>
	</select>
	<input type="text" name="second">
	<label>=</label>
	<input type="submit" value="계산">
	</div>
	</fieldset>
	</form>
<%@include file="footer.jsp" %>
</body>
</html>