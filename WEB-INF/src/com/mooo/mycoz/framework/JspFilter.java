package com.mooo.mycoz.framework;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class JspFilter implements Filter {

	private static Log log = LogFactory.getLog(JspFilter.class);

	private static ActionConfigure conf;

	public void init(FilterConfig filterConfig) throws ServletException {
		conf = ActionConfigure.getInstance();
	}

	public void destroy() {
		conf = null;
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		
		try {

			if (request instanceof HttpServletRequest) {

				HttpServletRequest hRequest = (HttpServletRequest) request;
//				HttpServletResponse hResponse = (HttpServletResponse) response;

				HttpSession session = hRequest.getSession();
				String contextPath = hRequest.getContextPath();
				String accessPath = hRequest.getServletPath();

				Pattern p = Pattern.compile("\\.jsp");
				Matcher m = p.matcher(accessPath);
				boolean isJsp = m.find();
				
				boolean isAuthenticated = true;
				if (log.isDebugEnabled()) log.debug("Jsp EnableAuth:"+conf.isEnableAuth());

				//check sample action for configure
				if(conf.isEnableAuth()){
					// check advanced permissions
					Integer userId = (Integer) session.getAttribute(ActionSession.USER_SESSION_KEY);
					isAuthenticated = (null != userId && userId >0);
					
					if (log.isDebugEnabled()) log.debug("--------Jsp filter start-------------");
					if (log.isDebugEnabled()) log.debug("Jsp filter contextPath:" + contextPath);
					if (log.isDebugEnabled()) log.debug("Jsp filter accessPath:" + accessPath);
					if (log.isDebugEnabled()) log.debug("Jsp filter execPath:" + ActionUtil.execPath(accessPath));
					if (log.isDebugEnabled()) log.debug("Jsp filter isJsp:" + isJsp);
					if (log.isDebugEnabled()) log.debug("--------Jsp filter end-------------");
				}
				
				if (!isAuthenticated) {
//					hResponse.setStatus(HttpServletResponse.SC_MOVED_PERMANENTLY);
					if (isJsp) {
//						hResponse.setHeader("Location", contextPath + "/Login.do");
						String url = contextPath + "/Login.do";
						PrintWriter out = response.getWriter();
						out.println( "<script>");
						out.println( "window.top.location.href= '"+url+"';");
						out.println( "</script>"); 
					}
				}
			}
		} catch (Exception e) {
			if (log.isDebugEnabled()) log.debug("Exception:" + e.getMessage());
			e.printStackTrace();
		} finally {
			request.setCharacterEncoding("UTF-8");
			chain.doFilter(request, response);
		}
	}
}