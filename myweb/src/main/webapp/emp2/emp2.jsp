<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>emp2.jsp</title>
<link rel="stylesheet" type="text/css" href="../css/mainLayout.css">
<style>
h2{
	margin: 0px auto;
}
fieldset{
	margin: 0px auto;
	width: 450px;
}
table{
	margin: 0px auto;
}
table th{
	text-align: left;
	width: 100px;
}
table td{
	text-align: center;
}
</style>
</head>
<body>
<%@include file="../header.jsp" %>
	<section>
		<article>
			<h2 align="center">사원 관리 프로그림(beans)</h2>
			<form name="empAdd2" action="empAdd2_ok.jsp">
			<fieldset>
				<legend>사원 등록</legend>
				<table>
					<tr>
						<th>사원 이름 </th>
						<td><input type="text" name="name"></td>
					</tr>
					<tr>
						<th>E-mail </th>
						<td><input type="text" name="email"></td>
					</tr>
					<tr>
						<th>부서명 </th>
						<td><input type="text" name="dept"></td>
					</tr>
					<tr>
						<td colspan="2" align="center">
								<input type="submit" value="전송">
								<input type="reset" value="초기화"></td>
					</tr>
				</table>
			</fieldset>
			</form>
			</article>
			<article>		
				<form name="empDel2" action="empDel2_ok.jsp">
				<fieldset>
				<legend>사원 퇴사</legend>
				<table>
					<tr>
						<th>사원 이름</th>
						<td><input type="text" name="name"></td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="삭제">
							<input type="reset" value="초기화"></td>
					</tr>
				</table>
			</fieldset>
			</form>
		</article>
		<article>
		<form name="empList2" action="empList2.jsp">
		<fieldset>
			<legend>전체 확인</legend>
			<table>
				<tr><td><input type="submit" value="전체 확인 버튼"></td></tr>
			</table>
		</fieldset>
		</form>
		</article>
		<article>
		<form name="empUpdateForm" action="empUpdate2.jsp">
		<fieldset>
			<legend>사원 정보 수정</legend>
			<table>
			<tr>
				<th>사원번호</th>
				<td><input type="text" name="idx"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="수정">
					<input type="reset" value="초기화"></td>
			</tr>
			</table>
		</fieldset>
		</form>
		</article>
	</section>
<%@include file="../footer.jsp" %>
</body>
</html>