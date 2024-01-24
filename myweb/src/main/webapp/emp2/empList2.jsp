<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.*" %>
<%@ page import ="com.yong.emp2.*" %>
<jsp:useBean id="edao" class="com.yong.emp2.EmpDAO"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리스트</title>
<link rel="stylesheet" type="text/css" href="/myweb/css/mainLayout.css">
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
table tbody td{
	text-align: center;
}
</style>
</head>
<body>
<%@include file="/header.jsp" %>
<section>
	<article>
		<h2>모든 사원 내용</h2>
		<table>
			<thead>
			<tr>
				<th>사원번호</th>
				<th>사원이름</th>
				<th>E-mail</th>
				<th>Dept</th>
			</tr>
			</thead>
			<tbody>
			<%
				ArrayList<EmpDTO> arr = edao.empList();
				if(arr==null||arr.size()==0){
					%>
						<tr>
						<td colspan="4" align="center">
							등록된 사원이 없다.</td>
						</tr>					
					<%
				}else{
					for(int i =0; i<arr.size();i++){
						EmpDTO dto =arr.get(i);
						%>
						<tr>
							<td><%=dto.getIdx() %></td>
							<td><%=dto.getName() %></td>
							<td><%=dto.getEmail() %></td>
							<td><%=dto.getDept() %></td>
						</tr>
						<%
					}
				}
			%>
			</tbody>
		</table>
	</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>