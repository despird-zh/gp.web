package com.gp.quickflow;

import java.util.Map;

import com.gp.common.IdKey;
import com.gp.svc.PostService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.support.SpringBeanAutowiringSupport;

import com.gp.info.InfoId;

public class PublicPostProcess extends BaseFlowProcess {

	Logger LOGGER = LoggerFactory.getLogger(PublicPostProcess.class);

	@Autowired
	PostService postService;

	public PublicPostProcess() {

		super.setProcessName("public-post-square");
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
	public boolean supportCheck(String resourceType) {
		
		return IdKey.POST.getTable().equalsIgnoreCase(resourceType);
	}


}
