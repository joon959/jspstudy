<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.yong.bbs.*" %>
<jsp:useBean id="bdao" class="com.yong.bbs.BbsDAO" scope="session"></jsp:useBean>
<%
	String idx_s = request.getParameter("idx");
	if(idx_s==null||idx_s.equals("")){
		idx_s="0";
	}
	int idx = Integer.parseInt(idx_s);
	BbsDTO dto = bdao.bbsContent(idx);
	if(dto==null){
		%>
		<script>
		window.alert('잘못된 접근');
		location.href="bbsList.jsp";
		</script>
		<%
		return;
	}
	else{
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>본문보기</title>
<link rel="stylesheet" type="text/css" href="/myweb/css/mainLayout.css">
<style>
h2{
	text-align: center;
}
table{
	width: 550px;
	margin: 0px auto;
	border-spacing: 0px;	
}
</style>
</head>
<body>
<%@ include file="../header.jsp" %>
<h2>본문 보기</h2>
<table border="1">
<tr>
	<th>번호</th>
	<td><%=dto.getIdx() %></td>
	<th>작성날짜</th>
	<td><%=dto.getWriter() %></td>
</tr>
<tr>
	<th>작성자</th>
	<td><%=dto.getWriter() %></td>
	<th>조회수</th>
	<td><%=dto.getReadnum() %></td>
</tr>
<tr>
	<th>제목</th>
	<td colspan="3"><%=dto.getTitle() %></td>
</tr>
<tr height="250">
	<td colspan="4" align="left" valign="top"><%=dto.getContent().replaceAll("\n", "</br>") %></td>
</tr>
<tr>
	<td colspan="4" align="center"><a href="bbsList.jsp">목록으로</a> | <a href="bbsReWrite.jsp?title=<%=dto.getTitle()%>&ref=<%=dto.getRef()%>&lev=<%=dto.getLev()%>&sunbun=<%=dto.getSunbun()%>">답변쓰기</a></td>
</tr>
</table>
<%@ include file="../footer.jsp" %>
</body>
</html>
<%
	}
%>