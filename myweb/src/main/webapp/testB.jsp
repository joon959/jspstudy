<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test B</title>
</head>
<body>
	<h1>이것은 html 태그를 작성한 것!</h1>
	<!-- html 주석입니다.  -->
	<% 
	//	이곳이 자바코드가 들어갈 영역 
	/*	여러줄 주석	*/
	System.out.println("자바코드로 작성한 println");
	//	out: PrintWriter의 jsp 기본 객체
	out.println("<h2>이것은 자바코드로 출력한 문장!</h2>");
	String str="java";	//	지역변수
	out.println("<h2>str="+str+"</h2>");
	%>
	<h2>str=<%out.println(str);%></h2>
	<h2>str=<%=str%></h2>
	<%!
		String str="jsp";	//	멤버변수
		public int getSumNum(int num1, int num2){
			int result = num1 + num2;
			return result;
		}
	%>
	<%
		out.println("<h2>3+5="+getSumNum(3,5)+"</h2>");
		out.println("<h2>str="+str+"</h2>");
		out.println("<h2>str="+this.str+"</h2>");	
		
		Calendar now = Calendar.getInstance();
		int y = now.get(Calendar.YEAR);
		int m = now.get(Calendar.MONTH)+1;
		int d = now.get(Calendar.DATE);
		out.println("<h2>"+y+"년 "+m+"월 "+d+"일 </h2>");
	%>
</body>
</html>