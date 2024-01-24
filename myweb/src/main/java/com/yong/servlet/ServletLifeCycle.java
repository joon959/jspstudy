package com.yong.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletLifeCycle extends HttpServlet {

	public ServletLifeCycle() {
		System.out.println("1.생성자 호출됨!!");
	}
	
	@Override
	public void init() throws ServletException {
		System.out.println("2.init() 메서드 호출됨!");
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		System.out.println("3.service() 메서드 수행됨.");		// 호출시마다 수행.
	}
	
	@Override
	public void destroy() {
		System.out.println("4.destroy() 메서드 수행됨...");		// 종료시 수행.
	}
	
}
