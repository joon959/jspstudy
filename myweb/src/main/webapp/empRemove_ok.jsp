<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<%
	String name = request.getParameter("name_bye");
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url="jdbc:oracle:thin:@localhost:1521:xe";
	String user="scott";
	String pwd ="1234";

	Connection conn = DriverManager.getConnection(url, user, pwd);
	String sql="delete from employee where name=?";
	PreparedStatement ps = conn.prepareStatement(sql);
	ps.setString(1, name);
	
	int count = ps.executeUpdate();
	ps.close();
	conn.close();
	
	String msg = count>0?"퇴사성공":"오류";
	
	if(count>0){
		%>
		<script>
		window.alert('<%= msg %>');
		location.href='emp.jsp';
		</script>
		<%
	}else{
		%>
		<script>
		window.alert('퇴사 실패...');
		location.href='emp.jsp';
		</script>
		<%
	}
	
%>