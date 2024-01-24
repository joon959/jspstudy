package com.yong.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PointServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		userProcess(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		userProcess(req, resp);
	}
	
	protected void userProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter pw = resp.getWriter();
		
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<title>국영수</title>");
		
		pw.println("<script>");
		pw.println("function a(){");
		pw.println("var kor = document.fm.kor.value");
		pw.println("var eng = document.fm.eng.value");
		pw.println("var math = document.fm.math.value");
		
		pw.println("kor = parseInt(kor)");
		pw.println("eng = parseInt(eng)");
		pw.println("math = parseInt(math)");
		
		pw.println("var sum = kor+eng+math");
		pw.println("var avg = sum/3");
		pw.println("var grade = 'F'");
		
		pw.println("switch(parseInt(avg/10)){");
		pw.println("case 10: case 9: grade='A'; break;");
		pw.println("case 8: grade='B'; break;");
		pw.println("case 7: grade='C'; break;");
		pw.println("case 6: grade='D'; break;");
		pw.println("}");
		
		pw.println("document.fm.sum.value = sum");
		pw.println("document.fm.avg.value = avg");
		pw.println("document.fm.grade.value = grade");
		pw.println("}");		
		pw.println("</script>");
				
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<h1>국영수 점수</h1>");
		pw.println("<form name='fm'>");
		pw.println("<table border='1' cellspacing='0' width='300' height='300'>");
		
		pw.println("<tr>");
		pw.println("<th><label>국어</label></th>");
		pw.println("<td><input type='text' name='kor'></td>");
		pw.println("</tr>");
		
		pw.println("<tr>");
		pw.println("<th><label>영어</label></th>");
		pw.println("<td><input type='text' name='eng'></td>");
		pw.println("</tr>");
		
		pw.println("<tr>");
		pw.println("<th><label>수학</label></th>");
		pw.println("<td><input type='text' name='math'></td>");
		pw.println("</tr>");
		
		pw.println("<tr>");
		pw.println("<th><label>총점</label></th>");
		pw.println("<td><input type='text' name='sum' readonly></td>");
		pw.println("</tr>");
		
		pw.println("<tr>");
		pw.println("<th><label>평균</label></th>");
		pw.println("<td><input type='text' name='avg' readonly></td>");
		pw.println("</tr>");
		
		pw.println("<tr>");
		pw.println("<th><label>등급</label></th>");
		pw.println("<td><input type='text' name='grade' readonly></td>");
		pw.println("</tr>");
		
		pw.println("<tr>");
		pw.println("<td colspan='2' align='center'><input type='button' value='계산' onclick='a();'></td>");
		pw.println("</tr>");
		
		pw.println("<table>");
		pw.println("</form>");
		pw.println("</body>");
		pw.println("</html>");
		
		pw.close();
	}
}
