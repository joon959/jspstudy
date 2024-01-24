<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구구단</title>
</head>
<body>
	<%
	out.println("<h1>구구단</h1>");
	out.println("<table border='1' cellspacing='0'>");
	out.println("<tr>");
	for(int j=2;j<10;j++){
		out.println("<th>"+j+"단</th>");
	}
	out.println("</tr>");
	
	for(int j=1; j<10;j++){
		out.println("<tr>");
		for(int i=2; i<10; i++){
			out.println("<td>"+i+" * "+j+" = "+(i*j)+"</td>");		
		}		
		out.println("</tr>");
	}	
	out.println("</table>");
	%>
	<hr>
	<table border="1" width="550" cellspacing="0">
		<%	for(int i=1; i<10; i++){	%>
		<tr>
			<%	for(int j=2; j<10; j++){	%>
			<td><%=j %>X<%=i %>=<%=j*i%></td>
			<%} %>
		</tr>
		<% } %>
	</table>
</body>
</html>