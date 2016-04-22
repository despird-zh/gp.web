package com.gp.core;

import org.apache.commons.lang.StringUtils;

import com.gp.audit.AccessPoint;
import com.gp.audit.AuditServiceContext;
import com.gp.common.GeneralContext.ExecState;
import com.gp.common.Operations;
import com.gp.common.Principal;
import com.gp.common.ServiceContext;
import com.gp.common.SystemOptions;
import com.gp.util.ConfigSettingUtils;

/**
 * Provides a way to build context object, possible implements SPI in future
 * As for the ServiceContext post persistence operation, do audit stuff here.
 * 
 * @author gary diao
 * @version 0.1 2014-12-12
 * 
 **/
public class ContextHelper {
	
	/**
	 * Use thread local to hold current thread service context
	 * 
	 **/
	private static final ThreadLocal<ServiceContext<?>> threadLocal = new ThreadLocal<ServiceContext<?>>(); 
    
	/**
	 * keep the service context in thread local
	 **/
    private static final void keepContext(ServiceContext<?> svcctx){
        threadLocal.set(svcctx);
    }
    
    /**
     * drop the service context out of thread local
     **/
    private static final void dropContext(){
        threadLocal.set(null);
    }
	
    /**
     * get the service context from thread local
     **/
    public static final ServiceContext<?> getContext(){
    	
    	return threadLocal.get();
    }
    
	/**
	 * build service context object depends on the configuration setting.
	 * 
	 * @param principal the principal object
	 * @param accesspoint the access point object
	 * 
	 **/
	public static ServiceContext<?> buildServiceContext(Principal principal, AccessPoint accesspoint){
		
		String audit = ConfigSettingUtils.getSystemOption(SystemOptions.AUDIT_ENABLE);
		//GeneralConfig.getString(GeneralConstants.ENV_AUDIT_ENABLE);
		
		audit = StringUtils.isBlank(audit)? "true" : audit;
		Boolean auditenable = Boolean.valueOf(audit);
		
		ServiceContext<?> svcctx = null;
		if(auditenable){
			
			svcctx = new AuditServiceContext(principal, accesspoint);

		}else{
			
			svcctx = new ServiceContext<Object>(principal);
		}
		// keep context to thread local
		keepContext(svcctx);
		
		return svcctx;
	}
	
	/**
	 * build service context object depends on the configuration setting. 
	 * and begin the specified operation and primary verb.
	 * 
	 * @param principal the principal object
	 * @param accesspoint the access point object
	 * @param operation the operation name
	 * @param verb the verb name
	 **/
	public static ServiceContext<?> beginServiceContext(Principal principal, AccessPoint accesspoint, String verb){
		
		ServiceContext<?> svcctx = buildServiceContext(principal, accesspoint);
		// if auditable then begin operation with blind object and predicates
		svcctx.beginAudit(verb, null, null);
		
		return svcctx;
	}
	
	/**
	 * build service context object depends on the configuration setting. 
	 * and begin the specified operation and primary verb.
	 * 
	 * @param principal the principal object
	 * @param accesspoint the access point object
	 * @param operation the operation name
	 * @param verb the verb name
	 **/
	public static ServiceContext<?> beginServiceContext(Principal principal, AccessPoint accesspoint, Operations operation){
		
		ServiceContext<?> svcctx = buildServiceContext(principal, accesspoint);
		// if auditable then begin operation with blind object and predicates
		svcctx.beginAudit(operation.name(), null, null);
		
		return svcctx;
	}
	
	/**
	 * If only principal available, provides ServiceContext only.
	 * 
	 * @param principal the principal object
	 * 
	 **/
	public static ServiceContext<?> buildServiceContext(Principal principal){
				
		ServiceContext<?> svcctx = new ServiceContext<Object>(principal);
		
		keepContext(svcctx);
		return svcctx;
	}
		
	/**
	 * Extract audit data out of AuditServiceContext and transfer it to event engine<br>
	 * !!! Important !!!<br>
	 * this method fetch service context from thread local, and drop it post persistence.
	 * it's used for buildServiceContext(?) method only
	 **/
	public static void handleContext(){
		
		ServiceContext<?> svcctx = getContext();
		
		// if valid ServiceContext continue work.
		if(null != svcctx)
			svcctx.persistAuditData();
		
		// clear the thread local context object.
		dropContext();
	}
	
	/**
	 * Stamp the exception on service context<br>
	 * !!! Important !!!<br>
	 * this method fetch service context from thread local, and drop it post persistence.
	 * it's used for buildServiceContext(?) method only
	 **/
	public static void stampContext(Exception e){
		
		ServiceContext<?> svcctx = getContext();
		
		// if valid ServiceContext continue work.
		if(null != svcctx){
			// fail persist audit data in ServiceContext.close();
//			if(e.getSuppressed() != null){
//				svcctx.endOperation(ExecState.EXCEP, "error during persist audit data");
//			}else{
				
				svcctx.endAudit(ExecState.EXCEP, e.getMessage());
//			}
		}
	}
}
