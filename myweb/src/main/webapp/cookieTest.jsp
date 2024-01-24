<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키테스트</title>
</head>
<body>
<h1>cookieTest.jsp</h1>
<%
	//1. 쿠키 객체들 가져오기
	Cookie cks[] = request.getCookies();
	if(cks!=null){
	for(int i=0;i<cks.length;i++){
	//2. 원하는 키값을 찾음
		String key=cks[i].getName();
	//3. 원하는 밸류 획득
		String value=URLDecoder.decode(cks[i].getValue());
		out.println("<h3>key:"+key+"/value:"+value);
		}
	}
%>
<!-- ------------ -->
<%
	//1. 쿠키 객체 생성
	String name="홍 길동";
	String encName=URLEncoder.encode(name);
	Cookie ck =new Cookie("name",encName);
	//2. 나이를 지정
	ck.setMaxAge(60*3);
	//3. 사용자 심기
	response.addCookie(ck);
	
	Cookie ck2 =new Cookie("age","20");
	ck2.setMaxAge(60*3);
	response.addCookie(ck2);
%>
</body>
</html>