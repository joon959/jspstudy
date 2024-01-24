<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mdao" class="com.yong.member.MemberDAO"></jsp:useBean>
<%
	request.setCharacterEncoding("utf-8");
	String userid=request.getParameter("userid");
	String userpwd=request.getParameter("userpwd");
	
	String saveid=request.getParameter("saveid");
	
	int result=mdao.loginCheck(userid, userpwd);
	if(result==mdao.LOGIN_OK){
		String sname=mdao.getUserInfo(userid);
		session.setAttribute("sid", userid);
		session.setAttribute("sname", sname);
		
		if(saveid!=null){
			Cookie ck =new Cookie("saveid", userid);
			ck.setMaxAge(60*60*24*30);
			response.addCookie(ck);
		}else{
			Cookie ck =new Cookie("saveid", userid);
			ck.setMaxAge(0);
			response.addCookie(ck);
		}
		
		%>
		<script>
		window.alert('<%=sname%>님 환영합니다.');
		opener.location.reload();
		self.close();
		</script>
		<%
	}else if(result==mdao.NOT_ID||result==mdao.NOT_PWD){
		%>
		<script>
		window.alert('ID 또는 PW 틀림');
		location.href='login.jsp';
		</script>
		<%
	}else{
		out.println("고객 센터 연락바람");		
	}
%>