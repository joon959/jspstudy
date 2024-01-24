<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요청</title>
</head>
<body>
	<h1>requestTest.jsp</h1>
	<h3>사용자 IP:<%=request.getRemoteAddr() %></h3>
	<h3>사용자 포트번호:<%=request.getRemotePort() %></h3>
	<h3>사용자의 접속방식:<%=request.getMethod() %></h3>
	<h3>서버의 서비스 IP:<%=request.getServerName() %></h3>
	<h3>서버의 포트번호:<%=request.getServerPort() %></h3>
	<h3>프로토콜 버전:<%=request.getProtocol() %></h3>
	<h3>사용자 현재 접속페이지:<%=request.getRequestURI() %></h3>
	<h3>프로젝트의 이름:<%=request.getContextPath() %></h3>
	<h3>절대경로:<%=request.getRealPath("/") %></h3>
</body>
</html>