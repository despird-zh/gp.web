package com.gp.core;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.gp.audit.AccessPoint;
import com.gp.common.Operations;
import com.gp.common.Principal;
import com.gp.common.ServiceContext;
import com.gp.exception.ServiceException;
import com.gp.info.InfoId;
import com.gp.info.MeasureInfo;
import com.gp.svc.MeasureService;

@Component
public class MeasureFacade {

	static Logger LOGGER = LoggerFactory.getLogger(MeasureFacade.class);
	
	private static MeasureService measuresvc;
	
	@Autowired
	private MeasureFacade(MeasureService measuresvc){
		MeasureFacade.measuresvc = measuresvc;
	}
	
	/**
	 * Find the work group latest summary information: docs amount etc.
	 * @param wid the work group id  
	 **/
	public static GeneralResult<MeasureInfo> findWorkgroupSummary(AccessPoint accesspoint,
			Principal principal,
			InfoId<Long> wid){
		
		GeneralResult<MeasureInfo> gresult = new GeneralResult<MeasureInfo>();
		
		if(!InfoId.isValid(wid)){
			
			gresult.setMessage("workgroup id is required", false);
			return gresult;
		}
		
		try(ServiceContext<?> svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.FIND_MEASURE)){
			
			svcctx.setAuditObject(wid);
			
			MeasureInfo minfo = measuresvc.getWorkgroupLatestSummary(wid);
			gresult.setReturnValue(minfo);
			gresult.setMessage("success find the workgroup summary", true);
			
		}catch (ServiceException e)  {
			LOGGER.error("Fail find the workgroup summary",e);
			ContextHelper.stampContext(e);
			gresult.setMessage("fail find the workgroup summary", false);
		}finally{
			
			ContextHelper.handleContext();
		}
		
		return gresult;
	}
}
