<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정화면</title>
<link rel="stylesheet" type="text/css" href="css/mainLayout.css">
<style>
fieldset{
	margin: 0px auto;
	width: 330px;
	align: center;
}

</style>
</head>
<body>
<%@include file="header.jsp" %>
	<%
		String idx = request.getParameter("idx");
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		String user="scott";
		String pwd ="1234";
		
		//
		if(idx==null || idx.equals("")){
			idx="0";
		}
			Connection conn = DriverManager.getConnection(url, user, pwd);
			String sql="select * from employee where idx=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, idx);
			ResultSet rs = ps.executeQuery();
			//int count = ps.executeUpdate();
		
			String name="";
			String email="";
			String dept="";
			
			/* 
				if(!rs.next()){
					%>
						<script>
						window.alert("잘못된 사원번호");
						location.href='emp.jsp';
						</script>
					<%
					return;
				} 
			*/
			
			if(rs.next()){
				do{
					name = rs.getString("name");
					email = rs.getString("email");
					dept = rs.getString("dept");
				}while(rs.next());
				
			} else{
				%>
				<script>
				window.alert('그런 정보가 없다.');
				location.href='emp.jsp';
				</script>				
				<%			
				return;
			}
	%>
			
	<form name="update" action ="empUpdate_ok.jsp">
	<fieldset>
	<legend><%=idx %>번 사원의 정보 수정</legend>
	<table align="center">
		<tr>
		<th>사원번호</th>
		<td><input type="text" name="idx" value="<%=idx %>" readonly>
		</tr>
		<tr>
		<th>이름</th>
		<td><input type="text" name="name" value="<%=name %>">
		</tr>
		<tr>
		<th>E-mail</th>
		<td><input type="text" name="email" value="<%=email %>">
		</tr>
		<tr>
		<th>부서명</th>
		<td><input type="text" name="dept" value="<%=dept %>">
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="정보수정">
				<input type="button" value="돌아가기" onClick="location.href='emp.jsp'"></td>
		</tr>
	</table>
	</fieldset>
	<%
	
	rs.close();
	ps.close();
	conn.close();
	
	%>
	</form>
<%@include file="footer.jsp" %>
</body>
</html>