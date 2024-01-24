<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="edto" class="com.yong.emp2.EmpDTO"></jsp:useBean>
<jsp:setProperty property="*" name="edto"/>
<jsp:useBean id="edao" class="com.yong.emp2.EmpDAO"></jsp:useBean>
<%
	int result = edao.empUpdateSubmit(edto);
	String msg = result>0?"사원 정보 수정 완료":"사원 정보 수정 실패";
%>
<script>
window.alert('<%= msg %>');
location.href='emp2.jsp';
</script>