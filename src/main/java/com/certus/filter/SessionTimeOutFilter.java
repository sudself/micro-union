package com.certus.filter;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.apache.log4j.Logger;

public class SessionTimeOutFilter implements Filter {
	
	private static Logger logger = Logger.getLogger(SessionTimeOutFilter.class);
	
	private static final String classPath = SessionTimeOutFilter.class.getName();

	@Override
	public void destroy() {

	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) arg0;
		HttpServletResponse response = (HttpServletResponse) arg1;
		String url = request.getRequestURL().toString();
		HttpSession session = request.getSession();
		String loginName=String.valueOf(session.getAttribute("user"));
		String xmlhttprequest = request.getHeader("X-Requested-With");
		if( !url.contains("loginAction/logout")//排除登录
				&&!url.contains("loginAction/login")
				&& "null".endsWith(loginName)
				&& "XMLHttpRequest".equalsIgnoreCase(xmlhttprequest)) { // ajax request	
			// 判断是否是session过期，如果是执行下边的代码
			logger.info(classPath+"session time out 重新登录");
			try {  
				response.setCharacterEncoding("UTF-8");  
				response.setContentType("text/json");  
				response.setDateHeader("Expires", 0);  
	            PrintWriter out = response.getWriter();  
	            out.println("{\"sessionTimeout\": true}");  
	            out.flush();  
	            out.close();  
	            return;
	        } catch (IOException e) { 
	        	logger.error(classPath+"XMLHttpRequest IO异常", e);
	        } 
		} else if ( !url.contains("loginAction/logout")//排除登录
				&& "null".endsWith(loginName)//session 过期检查
				&& !"XMLHttpRequest".equalsIgnoreCase(xmlhttprequest)
				) {
			logger.info(classPath+"session time out 重新登录");
			response.getWriter().write("<script type=\"text/javascript\">window.top.location.href ='"+request.getContextPath()+"/loginAction/logout.action';</script>");
			return;
		} 
		arg2.doFilter(arg0, arg1);
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {

	}

}
