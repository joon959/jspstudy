<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>폼 테스트 처리</title>
<link rel="stylesheet" type="text/css" href="css/mainLayout.css">
</head>
<body>
<%@include file="header.jsp" %>
<section>
	<article>
		<h2>넘어온 데이터들...</h2>
		<%
			String name = request.getParameter("name");
			String pwd = request.getParameter("pwd");
			String se = request.getParameter("se");
			String[] hb = request.getParameterValues("hb");
			
			String aHb = "";
			if(hb==null||hb.length==0){
				aHb = "선택된 취미가 없습니다.";
			}
			else{
				for(int i=0; i<hb.length; i++){
					aHb+=hb[i]+"&nbsp";
				}	
			}
		%>
		<h3>넘어온 이름:<%=name %></h3>
		<h3>넘어온 비밀번호:<%=pwd %></h3>
		<h3>넘어온 성별:<%=se %></h3>
		<h3>넘어온 취미:<%=aHb %></h3>
		<h3>넘어온 취미2:<%if(hb==null||hb.length==0){
							out.print("정보없음");
						}else{
						for(int i=0;i<hb.length;i++){ 
							out.print(hb[i]+"&nbsp");}}%></h3>
	</article>
</section>
<%@include file="footer.jsp" %>
</body>
</html>