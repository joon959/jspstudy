<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<link rel="stylesheet" type="text/css" href="../css/mainLayout.css">
<style>
h1{
	text-align: center;
}
fieldset{
	width: 450px;
	margin: 0px auto;
}
fieldset li{
	list-style-type: none;
}
fieldset label{
	width: 80px;
	float: left;
}
.divcenter{
	text-align: center;
}
</style>
<script>
function openIdCheck(){
	window.open('testId.jsp', 'testId','width=450,height=300');
}
</script>
<body>
<%@ include file="../header.jsp" %>
<section>
	<article>
	<h1>회원 가입</h1>
	<form name="memberJoin" method="post" action="join_ok.jsp">
	<fieldset>
	<legend>회원가입</legend>
	<ul>
		<li><label>ID</label>
			<input type="text" name="id" readonly>
			<input type="button" value="중복검사" 
			onClick="openIdCheck()">
		</li>
		<li><label>NAME</label>
			<input type="text" name="name"></li>
		<li><label>PW</label>
			<input type="password" name="pwd"></li>
		<li><label>E-mail</label>
			<input type="text" name="email"></li>
		<li><label>Addr</label>
			<input type="text" name="addr"></li>
		<li><label>Tel</label>
			<input type="text" name="tel"></li>
		</ul>
		<div class="divcenter">
			<input type="submit" value="가입">
			<input type="reset" value="초기화">
			<input type="button" value="돌아가기" onClick="location.href='/myweb/index.jsp'">
		</div>	
	</fieldset>
	</form>
	</article>
</section>
<%@ include file="/footer.jsp" %>
</body>
</html>