<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결과</title>
<link rel="stylesheet" type="text/css" href="css/mainLayout.css">
<style>
h1{
	text-align: center;
}
div{
	text-align: center;
}
</style>
</head>
<body>
<%@include file="header.jsp" %>
	<h1>사칙 계산기 결과</h1>
	<%	String first_s = request.getParameter("first");
		double first = Double.parseDouble(first_s);
		String second_s =request.getParameter("second");
		double second = Double.parseDouble(second_s);
		char pmxd = request.getParameter("pmxd").charAt(0);
		
		String result="";
		if(pmxd=='+'){
			result = Double.toString(first + second);
		}else if(pmxd=='-'){
			result = Double.toString(first - second);
		}else if(pmxd=='x'){
			result = Double.toString(first * second);
		}else if(pmxd=='/'){
			if(second!=0){
				result = Double.toString(first/second);
			}else{
				result="0으로 나눌 수 없다.";
			}
		}else{
			result="몰?루";
		}			
	%>	
	<div><h3>연산:&nbsp<%=first%>&nbsp<%=pmxd%>&nbsp<%=second%>&nbsp=&nbsp<%=result%></h3></div>	
	<div><h3>계산 값:&nbsp<%=result %></h3></div>
	
<%@include file="footer.jsp" %>
</body>
</html>