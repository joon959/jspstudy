<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자기소개</title>

<link rel="stylesheet" type="text/css" href="css/mainLayout.css">

</head>
<body><%@ include file="header.jsp"%>
	<section>
		<article id="mainImg">
			<img src="img/profile.jpg">
		</article>
		<article id="subMenu">
			<fieldset>
			<legend>정보</legend>
			<label>이름: </label>
				<input type="text" name="name" value="IU" readonly><br>
			<label>나이: </label>
				<input type="text" name="age" value="30" readonly><br>
			</fieldset>
		
		<ol>
			<li>주요 음반
				<ul>
				<li>좋은날</li>
				<li>분홍신</li>
				<li>라일락</li>
				<li>스물셋</li>
				</ul>
				</li>
			<li>출연작
				<ul>
				<li>최고다이순신</li>
				<li>드림하이</li>
				<li>호텔델루나</li>
				</ul>
				</li>
			<li>주요 수상
				<ul>
				<li>서울가요대상</li>
				<li>백상예술대상 인기상</li>
				<li>기타...</li>
				</ul>
				</li>
		</ol>
		</article>
	</section>
<%@ include file="footer.jsp"%>
</body>
</html>