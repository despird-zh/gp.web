package com.gp.quickflow;

import java.util.Map;

import com.gp.common.IdKey;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.support.SpringBeanAutowiringSupport;

import com.gp.info.InfoId;

public class PublicPostProcess extends BaseFlowProcess {

	Logger LOGGER = LoggerFactory.getLogger(PublicPostProcess.class);
	
	public PublicPostProcess(String processName) {
		super(processName);
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
	public boolean isProcSupport(String resourceType) {
		
		return IdKey.POST.getTable().equalsIgnoreCase(resourceType);
	}


}
