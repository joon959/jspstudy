<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>beanTest_ok</title>
</head>
<body>
	<h1>beanTest_ok.jsp</h1>
	<jsp:useBean id="btest" class="com.yong.bean.BeanTest"></jsp:useBean>
	<jsp:setProperty property="*" name="btest"/>
	
	<h3>이름: <jsp:getProperty property="name" name="btest"/></h3>
	<h3>나이: <%=btest.getAge() %></h3>
	<h3>주소: <%=btest.getAddr() %></h3>
	<h3>전번: <%=btest.getTel() %></h3>
</body>
</html>