package com.gp.core;

import com.gp.common.Operations;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.gp.disruptor.EventHooker;
import com.gp.disruptor.EventPayload;
import com.gp.disruptor.EventType;
import com.gp.exception.RingEventException;

/**
 * This hooker class digest all the core event which loaded with data.
 * the data include measure etc.
 * 
 * @author gary diao
 * @version 0.1 2015-12-8
 **/
public class CoreHooker extends EventHooker<CoreEventLoad<?>>{

	static Logger LOGGER = LoggerFactory.getLogger(CoreHooker.class);
	
	public CoreHooker() {
		super(EventType.CORE);
	}

	@Override
	public void processPayload(EventPayload payload) throws RingEventException {

		if(!(payload instanceof CoreEventLoad)){
			return;
		}
		CoreEventLoad coreload = (CoreEventLoad) payload;

		Operations operation = Operations.valueOf(coreload.getOperation());

		switch (operation){
			case  UPDATE_BASIC_SETTING :
				CoreFacade.handleUpdateAccount(coreload);
				break;
			default :
				break;
		}
	}

}
