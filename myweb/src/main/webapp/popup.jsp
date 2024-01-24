<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>notice</title>
</head>
<body>
<div style="width:300px; height:250px;margin: 0px auto; border: 1px solid gray;">
<h1 style="text-align:center;">공 지 사 항</h1>
<h3>1.지각을 하지 마세요</h3>
<h3>2.결석을 하지 마세요</h3>
<h3>3.복습을 하세요</h3>
</div>
<form name="fm" action="popup_ok.jsp">
<div style="text-align: right;">
<input type="checkbox" name="popupck" value="on">오늘 하루 안보기 
<!-- 코드값 명시 필요(on) -->
<input type="submit" value="닫기">
</div>
</form>
</body>
</html>