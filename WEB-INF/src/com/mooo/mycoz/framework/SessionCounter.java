package com.mooo.mycoz.framework;

import java.sql.SQLException;
import java.util.Date;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.mooo.mycoz.dbobj.wineBranch.AccessLog;

public class SessionCounter implements HttpSessionListener {
	private static Log log = LogFactory.getLog(SessionCounter.class);

	private static int activeSessions = 0;

	public void sessionCreated(HttpSessionEvent event) {
		//activeSessions++;
	}

	public void sessionDestroyed(HttpSessionEvent event) {
		if (activeSessions > 0)
			activeSessions--;
		
		HttpSession session = event.getSession();
		String ip = (String) session.getAttribute(ActionSession.IP);
		
		try {
			if (log.isDebugEnabled()) log.debug("sessionDestroyed datetime = " + (session.getLastAccessedTime()-session.getCreationTime()));

			AccessLog al = new AccessLog();
			al.setIp(ip);
			al.setStartdate(new Date(session.getCreationTime()));

			al.retrieve();
			al.setEnddate(new Date(session.getLastAccessedTime()));
			al.update();
		} catch (SQLException e) {
			e.printStackTrace();
			if (log.isDebugEnabled()) log.debug("SQLException: "+e.getMessage());
		}catch (Exception e) {
			e.printStackTrace();
			if (log.isDebugEnabled()) log.debug("Exception: "+e.getMessage());
		}
	}
	
	public static int getCount(){
		return activeSessions;
	}
	
	public static void login(){
		activeSessions++;
	}
}
