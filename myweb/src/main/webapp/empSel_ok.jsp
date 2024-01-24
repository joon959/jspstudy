<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색 하기</title>
<link rel="stylesheet" type="text/css" href="css/mainLayout.css">
<style>
h2{
	text-align: center;
}

table{
	width:500px;
	margin: 0px auto;
	border-top: 3px double darkblue;
	border-bottom: 3px double darkblue;
	border-spacing: 0px;	
}
table thead th{
	background-color: skyblue;
}
</style>
</head>
<body>
<%@include file="header.jsp" %>
	<h2>모든 사원 내역</h2>
		<table>
			<thead>
				<tr>
					<th>사원번호</th>
					<th>사원이름</th>
					<th>E-mail</th>
					<th>부서명</th>
				</tr>
			</thead>

<%
	String name = request.getParameter("name");
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url="jdbc:oracle:thin:@localhost:1521:xe";
	String user="scott";
	String pwd ="1234";

	Connection conn = DriverManager.getConnection(url, user, pwd);
	String sql="select * from employee where name=?";
	PreparedStatement ps = conn.prepareStatement(sql);
	ps.setString(1, name);
	ResultSet rs = ps.executeQuery();
	
	if(rs.next()){
		do{
	%>
	<tbody>
		<tr>
			<td align="center"><%=rs.getInt("idx") %></td>
			<td align="center"><%=rs.getString("name") %></td>
			<td align="center"><%=rs.getString("email") %></td>
			<td align="center"><%=rs.getString("dept") %></td>		
		</tr>
	</tbody>
	<%
		}while(rs.next());
	}
	
	else{
		%>
		<tbody>
			<tr>
				<td align="center"><%=rs.getInt("idx") %></td>
			</tr>
		</tbody>
		<% 
	}
		rs.close();
		ps.close();
		conn.close();
		%>
		</table>

<%@include file="footer.jsp" %>
</body>
</html>