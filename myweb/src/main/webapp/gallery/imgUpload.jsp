<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이미지 업로드</title>
</head>
<body>
<form name="imgUpload" action="imgUpload_ok.jsp" 
	method="post" enctype="multipart/form-data">
<fieldset>
<legend>이미지 올리기</legend>
<label>사진</label>
<input type="file" name="upload">
<input type="submit" value="사진올리기">
</fieldset>
</form>
</body>
</html>