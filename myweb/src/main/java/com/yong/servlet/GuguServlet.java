package com.yong.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GuguServlet extends HttpServlet{
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
		pw.println("<title>구구단</title>");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<h1>구구단</h1>");
		pw.println("<table border='1' cellspacing='0' width='800'>");
		
		pw.println("<tr>");
		for(int j=2;j<10;j++) {
			pw.println("<th>"+j+"단</th>");
		}
		pw.println("</tr>");
		
		for(int i=1;i<10;i++) {
			pw.println("<tr>");
			for(int j=2;j<10;j++) {
				pw.println("<td>"+j+" * "+i+" = "+(i*j)+" </td>");
			}	
			pw.println("</tr>");
		}
		
		pw.println("<table>");
		pw.println("</body>");
		pw.println("</html>");
		
		pw.close();
	}
}
