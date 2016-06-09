package com.gp.core;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.gp.common.IdKey;
import com.gp.common.ServiceContext;
import com.gp.exception.CoreException;
import com.gp.exception.ServiceException;
import com.gp.info.AuditInfo;
import com.gp.info.InfoId;
import com.gp.svc.AuditService;
import com.gp.svc.CommonService;

@Component
public class AuditFacade {

	static Logger LOGGER = LoggerFactory.getLogger(AuditFacade.class);
	
	private static AuditService auditservice;

	private static CommonService idService;
	
	@Autowired
	private AuditFacade(AuditService auditservice, CommonService idService){
		
		AuditFacade.auditservice = auditservice;
		AuditFacade.idService = idService;
	}
	
	/**
	 * Audit the verbs generated from operation, here not user AuditServiceConext as for no need to collect audit information.
	 * otherwise it falls into dead loop.
	 * 
	 * @param auditlist the audit data of operation
	 * 
	 **/
	public static void auditOperation(AuditInfo auditinfo) throws CoreException{
		
		if(null == auditinfo)
			return;
		
		try {
			ServiceContext svcctx = ServiceContext.getPseudoServiceContext();
			// retrieve and set audit id
			InfoId<Long> auditId = idService.generateId( IdKey.AUDIT, Long.class);
			auditinfo.setInfoId(auditId); 

			auditservice.addAudit(svcctx, auditinfo);
		
		} catch (ServiceException e) {
			throw new CoreException("fail to get admin principal ",e );
		}
	}
	
}
