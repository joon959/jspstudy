<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원관리(모델1 기본형)</title>
<link rel="stylesheet" type="text/css" href="css/mainLayout.css">
<style>
h2{
	text-align: center;
}
fieldset{
	margin: 0px auto;
	width: 450px;
}
table{
	margin: 10px auto;
}

</style>
<script>
function isNull_Values2(){
	if(document.empSel.idx.value==''){
		window.alert('사원 번호 없음');		
		return false;
	}
}
</script>
</head>
<body>
<%@ include file="header.jsp" %>
<section>
	<article>
		<h2>사원관리 프로그램(기본형)</h2>
		<form name="empAdd" action="empAdd_ok.jsp">
		<fieldset>
		<legend>사원 등록</legend>
			<table>
			<tr>
				<th>사원 이름</th>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<th>E-mail</th>
				<td><input type="text" name="email"></td>
			</tr>
			<tr>
				<th>부서명</th>
				<td><input type="text" name="dept"></td>
			</tr>
			<tr>
			<td colspan="2" align="center">
				<input type="submit" value="사원 등록">
				<input type="reset" value="다시 작성"></td>
			</tr>
			</table>
		</fieldset>
		</form>
		<form name="empAdd" action="empRemove_ok.jsp">
		<fieldset>
		<legend>사원 퇴사</legend>
			<table>
			<tr>
				<th>사원 이름</th>
				<td><input type="text" name="name_bye"></td>
			</tr>
			<tr>
			<td colspan="2" align="center">
				<input type="submit" value="사원 퇴사"></td>
			</tr>
			</table>
		</fieldset>
		</form>	
		</article>
		<article>
			<fieldset>
				<legend>사원 내역</legend>
				<h3 style="text-align: center">
				<a href="empList.jsp">모든 사원 이동</a></h3>
			</fieldset>	
		</article>
		<article>
			<form name="empSel" action="empSel_ok.jsp">
			<fieldset>
				<legend>사원 검색</legend>
				<table>
				<tr>
				<th>사원 검색</th>
				<td><input type="text" name="name" ></td>
				</tr>
				<tr>
				<td colspan="2" align="center">
					<input type="submit" value="검색"></td>
				</tr>
				</table>
			</fieldset>	
			</form>
		</article>
		<article>
			<form name="empSel" action="empUpdate.jsp">
			<fieldset>
				<legend>사원 수정</legend>
				<table>
				<tr>
				<th>사원 번호</th>
				<td><input type="text" name="idx" required="required"></td>
				</tr>
				<tr>
				<td colspan="2" align="center" >
					<input type="submit" value="수정"></td>
				</tr>
				</table>
			</fieldset>	
			</form>
		</article>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>