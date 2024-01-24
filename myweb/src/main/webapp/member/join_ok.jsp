<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>	
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="mdto" class="com.yong.member.MemberDTO"></jsp:useBean>
<jsp:setProperty property="*" name="mdto"/>
<jsp:useBean id="mdao" class="com.yong.member.MemberDAO"></jsp:useBean>
<%
int result = mdao.memberAdd(mdto);
String msg=result>0?"가입성공":"가입실패";
%>
<script>
window.alert('<%=msg %>');
location.href='/myweb';
</script>