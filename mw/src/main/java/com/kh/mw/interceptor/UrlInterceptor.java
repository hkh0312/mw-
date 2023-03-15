package com.kh.mw.interceptor;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class UrlInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		// 입력한 url 알아내기
		String uri = request.getRequestURI();
		int slashIndex = uri.lastIndexOf("/");
		String strUri = uri.substring(slashIndex+1);
//		System.out.println("strUri: "+strUri);
		session.setAttribute("url_keyword", strUri);
		RequestDispatcher dispatcher = request.getRequestDispatcher("home");
		dispatcher.forward(request, response);
		return false;
//		return super.preHandle(request, response, handler);
	}
	
}
