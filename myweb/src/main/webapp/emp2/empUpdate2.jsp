<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.yong.emp2.*" %>
<jsp:useBean id="edao" class="com.yong.emp2.EmpDAO"></jsp:useBean>
<%
	String idx_s = request.getParameter("idx");
	if(idx_s==null||idx_s.equals("")){
		idx_s="0";
	}
	int idx = Integer.parseInt(idx_s);
	EmpDTO dto = edao.empUpdateForm(idx);
	if(dto==null){
		%>
		<script>
		window.alert('잘못된 사원 번호');
		location.href="emp2.jsp";
		</script>
		<% 
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 수정</title>
<link rel="stylesheet" type="text/css" href="/myweb/css/mainLayout.css">
<style>
fieldset{
	width: 450px;
	margin: 0px auto;
}
table {
	margin: 0px auto;
}
table th{
	width: 100px;
	text-align: left;
}
</style>
</head>
<body>
<%@ include file="/header.jsp" %>
<section>
<article>
<h2 align="center">사원 정보 수정</h2>
<form name="empUpdate2" action="empUpdate2_ok.jsp">
<input type="hidden" name="idx" value="<%=dto.getIdx() %>">
<fieldset>
<legend>사원 정보 수정</legend>
<table>
<tr>
	<th>사원 번호</th>
	<td><%=dto.getIdx() %></td>
</tr>
<tr>
	<th>사원 이름</th>
	<td><input type="text" name="name" value="<%=dto.getName()%>"></td>
</tr>
<tr>
	<th>사원 이메일</th>
	<td><input type="text" name="email" value="<%=dto.getEmail()%>"></td>
</tr>
<tr>
	<th>사원 부서</th>
	<td><input type="text" name="dept" value="<%=dto.getDept()%>"></td>
</tr>
<tr>
	<td colspan="2" align="center">
		<input type="submit" value="정보수정">
		<input type="button" value="돌아가기" onclick="location.href='emp2.jsp'"></td>
</tr>
</table>
</fieldset>
</form>
</article>
</section>
<%@ include file="/footer.jsp" %>
</body>
</html>