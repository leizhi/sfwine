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
		activeSessions++;
	}

	public void sessionDestroyed(HttpSessionEvent event) {
		if (activeSessions > 0)
			activeSessions--;
		
		HttpSession session = event.getSession();
		
		Integer onlineId = (Integer) session.getAttribute(ActionSession.USER_ONLINE_KEY);

		try {
			long creationTime = session.getCreationTime();
			
			long lastAccessedTime = session.getLastAccessedTime();
			
			if (log.isDebugEnabled()) log.debug("sessionDestroyed datetime = " + (lastAccessedTime-creationTime));

			if((lastAccessedTime-creationTime)>0 && onlineId!=null){
				AccessLog al = new AccessLog();
				al.setId(onlineId);
				al.setLogoutTime(new Date(lastAccessedTime));
				al.update();
			}
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
}
