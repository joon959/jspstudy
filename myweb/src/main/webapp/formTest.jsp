<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>폼테스트</title>
<link rel="stylesheet" type="text/css" href="css/mainLayout.css">
<style>
h2{
	text-align: center;
}
fieldset{
	margin: 0px auto;
	width: 500px;
}
fieldset li{
	list-style-type: none;
}
fieldset li label{
	width: 80px;
	float: left;
}
.divCenter{
	text-align: center;
}
</style>
</head>
<body>
<%@include file="header.jsp" %>
<section>
	<article>
	<h2>폼 테스트</h2>
	<form name="fm" action="formTest_ok.jsp">
	<fieldset>
		<legend>폼 테스트</legend>
		<ul>
		<li><label>이름</label>
			<input type="text" name="name" size="40"></li>
		<li><label>비밀번호</label>
			<input type="password" name="pwd" size="40"></li>
		<li><label>성별</label>
			<input type="radio" name="se" value="남자">남자
			<input type="radio" name="se" value="여자">여자
			<input type="radio" name="se" value="트랜스">트랜스</li>
		<li><label>취미</label>
			<input type="checkbox" name="hb" value="공부">공부
			<input type="checkbox" name="hb" value="독서">독서
			<input type="checkbox" name="hb" value="운동">운동
			<input type="checkbox" name="hb" value="게임">게임
			<input type="checkbox" name="hb" value="잠자기">잠자기</li>
		</ul>
		<div class="divCenter"><input type="submit" value="데이터 넘기기">
			<input type="reset" value="데이터 초기화"></div>
	</fieldset>
	</form>
	</article>
</section>
<%@include file="footer.jsp"%>
</body>
</html>