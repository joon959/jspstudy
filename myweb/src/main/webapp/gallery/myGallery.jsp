<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>	
<%@ page import="java.util.*" %>	
<%@ page import="com.yong.gallery.*" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myGallery.jsp</title>
<link rel="stylesheet" type="text/css" href="../css/mainLayout.css">
<style>
h2{
	text-align: center;
}
table{
	text-align: center;
	width: 550px;
	margin: 0px auto;
	border-top: 3px double darkblue;
	border-bottom: 3px double darkblue;
}
table th{
	background-color: skyblue;
}
img{
	width: 150px;
	height: 150px;
}
</style>
<script>
function openUpload(){
	window.open('imgUpload.jsp','imgUpload','width=400, height=250')
}

</script>
</head>
<%
	String sid = (String) session.getAttribute("sid");
	if(sid==null||sid.equals("")){
		%>
		<script>
		window.alert('로그인 후 이용하시오.');
		location.href='/myweb';
		</script>
		<%
		return;
	}
%>
<jsp:useBean id="gdao" class="com.yong.gallery.MyGalleryDAO" scope="session"></jsp:useBean>
<%
gdao.makeDirectory(sid);
%>
<body>
<%@ include file="../header.jsp" %>
<section>
<article>
<h2><%=sname %>님의 마이갤러리</h2>
<fieldset>
<legend>기능</legend>
<input type="button" value="사진올리기" onclick="openUpload()">
</fieldset>
</article>
<article>
<table>

<thead>
<tr>
	<th>이미지</th>
	<th>파일명</th>
	<th>파일크기</th>
	<th>삭제</th>
</tr>
</thead>

<tbody>
<%
ArrayList<MyGalleryDTO> arr = gdao.imgList(sid);
if(arr==null||arr.size()==0){
	%>
	<tr>
	<td colspan="4" align="center">이미지 등록을 먼저 하시오.</td>
	</tr>
	<%
}else{
	for(int i=0; i<arr.size(); i++){
		MyGalleryDTO dto = arr.get(i);
		%>
		<tr>
			<td><img src="img/<%=dto.getId()%>/<%=dto.getFilename()%>"></td>
			<td><%=dto.getFilename() %></td>
			<td><%=dto.getFilesize() %></td>
			<td><input type="button" value="삭제"></td>
		</tr>
		<%
	}
}
%>
</tbody>

</table>
</article>
</section>
<%@ include file="../footer.jsp" %>
</body>
</html>