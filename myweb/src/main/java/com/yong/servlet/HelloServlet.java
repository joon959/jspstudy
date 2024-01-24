package com.yong.servlet;

import java.io.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.*;

public class HelloServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		userProcess(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		userProcess(req, resp);
	}
	
	protected void userProcess(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter pw = resp.getWriter();	//=>sysout
		
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<title>이것은 서블릿</title>");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<h1>이것은 서블릿에서 작성한 제목.</h1>");
		
		Calendar now = Calendar.getInstance();
		int y = now.get(Calendar.YEAR);
		int m = now.get(Calendar.MONTH)+1;
		int d = now.get(Calendar.DATE);
		pw.print("<h1>"+y+"년 "+m+"월 "+d+"일 </h1>");
		
		pw.println("</body>");
		pw.println("</html>");
		pw.close();	//return
	}
}
