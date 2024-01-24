<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*" %>
<jsp:useBean id="gdao" class="com.yong.gallery.MyGalleryDAO" scope="session"></jsp:useBean>
<%
String sid = (String)session.getAttribute("sid");
String savepath = gdao.USER_HOME+"/"+sid;

MultipartRequest mr = new MultipartRequest(
		request,savepath,10485760,"utf-8");
int count = gdao.insertImg(sid, mr.getFile("upload"));
%>
<script>
window.alert('업로드 완료!');
opener.location.reload();
self.close();
</script>
