<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.net.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>싸이트 뼈대 만들기</title>
<link rel="stylesheet" type="text/css" href="css/mainLayout.css">
<script>
	function openPopup() {
		window.open('popup.jsp', 'popup', 'width=320, height=320');
	}
</script>
</head>
<%
Cookie cks[] = request.getCookies();
String lastDate = "첫 방문이십니다.";
String popupck=null;
if (cks != null) {
	for (int i = 0; i < cks.length; i++) {
		if (cks[i].getName().equals("lastDate")) {
			lastDate = URLDecoder.decode(cks[i].getValue());
		}
		if(cks[i].getName().equals("popupck")){//쿠키가 도냐 안도냐
			popupck="on";
		}
	}
}
%>
<body <%=popupck==null?"onload='openPopup()'":"''" %>>
	<%@include file="header.jsp"%>
	<section>
		<!-- 영역 -->
		<article id="mainImg">
			<!-- 컨텐츠 -->
			<img src="img/main.jpg">
		</article>
		<article id="subMenu">
			<h2>안녕 반가워</h2>

			<h3 style="color: blue;"><%=lastDate%></h3>
			<%
			////////////////////////////////////////
			Calendar now = Calendar.getInstance();
			int y = now.get(Calendar.YEAR);
			int m = now.get(Calendar.MONTH) + 1;
			int d = now.get(Calendar.DATE);
			String str = "마지막 접속일: " + y + "년 " + m + "월 " + d + "일 ";
			str = URLEncoder.encode(str);
			Cookie ck = new Cookie("lastDate", str);
			ck.setMaxAge(60 * 60 * 24 * 30);
			response.addCookie(ck);
			%>
			<ul>
				<li>계속 추가할거임</li>
				<li><a href="formTest.jsp">폼 테스트</a></li>
				<li><a href="cal.jsp">사칙 계산기</a></li>
				<li><a href="emp.jsp">사원관리 프로그램(model1 기본형)</a></li>
				<li><a href="emp2/emp2.jsp">사원관리 프로그램(model1 빈즈형)</a></li>
				<li><a href="member/memberFind.jsp">회원검색</a></li>
			</ul>
		</article>
	</section>
	<%@include file="footer.jsp"%>
</body>
</html>