package com.gp.core;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;

import com.gp.exception.BaseException;
import com.gp.web.CoreStarter;

public class ContextInitFinishListener implements ApplicationListener<ContextRefreshedEvent> {

	static Logger LOGGER = LoggerFactory.getLogger(ContextInitFinishListener.class);

    @Override
    public void onApplicationEvent(ContextRefreshedEvent event) {
		LOGGER.debug("ContextInitFinishListener:CoreStarter starting");
		try {
			// this is not good point to initial it.
			// coz it import an external web package, ideally core package shouldn't reference 
			// any other package.
			CoreStarter.initialLogger();
			CoreEngine.initial();
			LOGGER.debug("CoreEngine initialized");
			CoreEngine.startup();
			LOGGER.debug("CoreEngine startup");
		} catch (BaseException e) {
			LOGGER.debug("fail to startup CoreFacade.",e);
		}
    }
}
