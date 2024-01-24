<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>    
<%@ page import="com.yong.member.*" %>
<jsp:useBean id="mdao" class="com.yong.member.MemberDAO"></jsp:useBean>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원검색</title>
<link rel="stylesheet" type="text/css" href="/myweb/css/mainLayout.css">
</head>
<body>
<%@ include file="/header.jsp" %>
<section>
<article>
	<h2>회 원 검 색</h2>
	<hr>

	<form name="memberFind" method="post" action="memberFind.jsp">
	<fieldset>
		<legend>회원검색</legend>
	<select name="fkey">
		<option value="id" selected>아이디</option>
		<option value="name">이름</option>	
	</select>
		<input type="text" name="fvalue">
		<input type="submit" value="검색">
	</fieldset>
	<hr>
	
	<article>
	<fieldset>
		<legend>검색 결과</legend>
		<%
			if(request.getMethod().equals("GET")){
				%>
					<h3>위 검색란에 검색어를 입력해주세요.</h3>		
				<%
			}else{
				String fkey=request.getParameter("fkey");
				String fvalue=request.getParameter("fvalue");			
				%>
					<table border="1" width="550" cellspacing="0">
					<thead>
						<tr>
							<th>회원번호</th>
							<th>회원ID</th>
							<th>회원이름</th>
							<th>E-mail</th>
							<th>가입날짜</th>
						</tr>
					</thead>
					<tbody>					
					<%
					ArrayList<MemberDTO> arr=mdao.memberFind(fkey, fvalue);
					if(arr==null||arr.size()==0){
						%>
						<tr>
							<td colspan="5">검색된 회원이 없습니다.</td>
						</tr>				
						<%
					}else{
						for(int i=0; i<arr.size();i++){
							%>
								<tr>
									<td><%=arr.get(i).getIdx() %></td>
									<td><%=arr.get(i).getId() %></td>
									<td><%=arr.get(i).getName() %></td>
									<td><%=arr.get(i).getEmail() %></td>
									<td><%=arr.get(i).getDate() %></td>
								</tr>														
							<%
						}
					}					
					%>					
					</tbody>
					</table>				
				<%			
			}
		%>		
	</fieldset>
	</article>
	</form>
</article>
</section>
<%@ include file="/footer.jsp" %>
</body>
</html>