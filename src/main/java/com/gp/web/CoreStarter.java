package com.gp.web;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.gp.core.CoreEngine;
import com.gp.exception.BaseException;

/**
 * the core starter of application 
 *
 * @author gary diao 
 * @version 0.1 2015-12-12
 * 
 **/
public class CoreStarter implements ServletContextListener{
	
	static Logger LOGGER ;
	
	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		//LOGGER.debug("ServletContextListener:CoreStarter destroying");
		try {
			CoreEngine.shutdown();
			//LOGGER.debug("CoreEngine shutdown");
		} catch (BaseException e) {
			//LOGGER.debug("fail to shutdown CoreFacade.",e);
		}
	}
	
	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		// ignore
	}
	
	/**
	 * If Logger is initialized via default new, It makes Log4j throws
	 * WEB-INF/logs/log.log not found exception, so try to initial it 
	 * In ContextInitFinishListener bean.
	 **/
	public static void initialLogger(){
		LOGGER = LoggerFactory.getLogger(CoreStarter.class);
	}
}
