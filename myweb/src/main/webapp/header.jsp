<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script>
function openLogin(){
	window.open('/myweb/member/login.jsp','login','width=500, height=200');
}
</script>
<%
	String sname=(String)session.getAttribute("sname");
%>
<header>
	<%
		if(sname==null||sname.equals("")){
			%>
	<div><a href="javascript:openLogin()">로그인</a> | <a href="/myweb/member/join.jsp">회원가입</a></div>			
			<%
		}else{
			%>
	<div><%=sname %>님 로그인 중 | <a href="/myweb/member/logout.jsp">로그아웃</a></div>		
			<%
		}
	%>
	<h1>JSP Study Site</h1>
	<nav>
		<ul>
			<li><a href="/myweb/index.jsp">Home</a></li>
			<li><a href="/myweb/profile.jsp">Profile</a></li>
			<li><a href="/myweb/gallery/myGallery.jsp">ImageGallery</a></li>
			<li><a href="/myweb/bbs/bbsList.jsp">BBS</a></li>
			<li><a href="#">GuestBook</a></li>
		</ul>
	</nav>
	<hr>
</header>