<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<%
	String idx = request.getParameter("idx");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String dept = request.getParameter("dept");
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url="jdbc:oracle:thin:@localhost:1521:xe";
	String user="scott";
	String pwd ="1234";

	Connection conn = DriverManager.getConnection(url, user, pwd);
	String sql="update employee set name=?, email=?, dept=? where idx=?";
	PreparedStatement ps = conn.prepareStatement(sql);
	
	ps.setString(1, name);
	ps.setString(2, email);
	ps.setString(3, dept);
	ps.setString(4, idx);
	//ResultSet rs = ps.executeQuery();
	int count = ps.executeUpdate();
	String msg=count>0?"사원정보수정 완료":"사원정보수정 실패";
%>
<script>
window.alert('<%=msg%> !!');
location.href='emp.jsp';
</script>

<%
	ps.close();
	conn.close();
%>
