<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="bdto" class="com.yong.bbs.BbsDTO"></jsp:useBean>
<jsp:setProperty property="*" name="bdto"/>
<jsp:useBean id="bdao" class="com.yong.bbs.BbsDAO" scope="session"></jsp:useBean>
<%
int result = bdao.bbsWrite(bdto);
String msg=result>0?"성공":"실패";
%>
<script>
window.alert('<%=msg%>');
location.href='bbsList.jsp';
</script>