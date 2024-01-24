<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>scopTest_ok.jsp</title>
</head>
<body>
<h1>scopTest_ok.jsp</h1>
<jsp:useBean id="stest" class="com.yong.scope.ScopeTest" scope="application"></jsp:useBean>
<h3 style="color:red;">count 값: <%=stest.getCount() %></h3>
<a href="scopeTest.jsp">이전 페이지로...</a>
</body>
</html>