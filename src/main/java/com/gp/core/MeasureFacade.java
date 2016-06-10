package com.gp.core;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.gp.audit.AccessPoint;
import com.gp.common.Operations;
import com.gp.common.Principal;
import com.gp.common.ServiceContext;
import com.gp.exception.CoreException;
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
	public static MeasureInfo findWorkgroupSummary(AccessPoint accesspoint,
			Principal principal,
			InfoId<Long> wid)throws CoreException{
		
		MeasureInfo gresult = null;
		
		if(!InfoId.isValid(wid)){
			throw new CoreException(principal.getLocale(), "mesg.prop.miss");
		}
		
		try(ServiceContext svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.FIND_MEASURE)){
			
			svcctx.setAuditObject(wid);
			
			gresult = measuresvc.getWorkgroupLatestSummary(wid);
		}catch (ServiceException e)  {
			ContextHelper.stampContext(e,"excp.find.wgroup.stat");
		}finally{
			ContextHelper.handleContext();
		}
		
		return gresult;
	}
}
