<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String title = request.getParameter("title");
	String ref = request.getParameter("ref");
	String lev = request.getParameter("lev");
	String sunbun = request.getParameter("sunbun");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
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
</style>
</head>
<body>
<%@ include file="../header.jsp" %>
<section>
<article>
<h2>자유게시판 답변 글쓰기</h2>
<form name="bbsReWrite" action="bbsReWrite_ok.jsp" method="post">
<input type="hidden" name="ref" value="<%=ref %>">
<input type="hidden" name="lev" value="<%=lev %>">
<input type="hidden" name="sunbun" value="<%=sunbun %>">
<table>
<tr>
	<th>작성자</th>
	<td><input type="text" name="writer"></td>
	<th>비밀번호</th>
	<td><input type="password" name="pwd"></td>
</tr>
<tr>
	<th>제목</th>
	<td colspan="3"><input type="text" name="title" value="Re:) <%=title %>" size="60"></td>
</tr>
<tr>
	<td colspan="4"><textarea rows="10" cols="65" name="content"></textarea></td>
</tr>
<tr>
<td colspan="4" align="center">
	<input type="submit" value="글쓰기">
	<input type="reset" value="다시작성"></td>
</tr>
</table>
</form>
</article>
</section>
<%@ include file="../footer.jsp" %>
</body>
</html>