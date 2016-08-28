package com.gp.quickflow;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.support.SpringBeanAutowiringSupport;

import com.gp.info.InfoId;
import com.gp.quickflow.BaseFlowOperation;

public class PublicPostOperation extends BaseFlowOperation{

	Logger LOGGER = LoggerFactory.getLogger(PublicPostOperation.class);
	
	public PublicPostOperation(String operation) {
		super(operation, true, true);
		SpringBeanAutowiringSupport.processInjectionBasedOnCurrentContext(this);
	}

	@Override
	public void fail(InfoId<Long> procId, InfoId<?> resourceId, Map<String, Object> procData) {
		LOGGER.debug("fail");
	}

	@Override
	public void pass(InfoId<Long> procId, InfoId<?> resourceId, Map<String, Object> procData) {
		LOGGER.debug("pass");
	}

	@Override
	public void reject(InfoId<Long> stepId, InfoId<?> resourceId, Map<String, Object> procData) {
		LOGGER.debug("reject");
	}

	@Override
	public void approve(InfoId<Long> stepId, InfoId<?> resourceId, Map<String, Object> procData) {
		LOGGER.debug("approve");
	}

}
