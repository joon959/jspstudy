<%@page import="com.yong.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="mdao" class="com.yong.member.MemberDAO"></jsp:useBean>
<%
String id = request.getParameter("id");

boolean result = mdao.idCheck(id);
if(result){
	%>
	<script>
	window.alert('이미 ID가 있는');
	location.href="testId.jsp";
	</script>
	<%
}else{
%>
<script>
window.alert('<%=id%>는 중복되지 않는');
opener.document.memberJoin.id.value='<%=id%>';
window.self.close();
</script>
<% 
	}
%>
