package com.gp.audit;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.gp.common.Principal;
import com.gp.common.ServiceContext;
import com.gp.disruptor.EventDispatcher;
import com.gp.info.InfoId;

/**
 * this class extends the audit implementation of service context
 * 
 * @author gary diao
 * @version 0.1 2014-12-12
 **/
public class AuditServiceContext extends ServiceContext{
	
	static Logger LOGGER = LoggerFactory.getLogger(AuditServiceContext.class);
	
	/**
	 * audit data holder 
	 **/
	private AuditData auditdata = null;

	/**
	 * AuditState
	 **/
	private ExecState execstate = ExecState.UNKNOWN;
	
	/**
	 * set access point information
	 **/
	@Override
	public void setAccessPoint(String client, String host, String app, String version){
		
		this.auditdata.setAccessPoint(new AccessPoint(client, host, app, version));
	}
	
	/**
	 * constructor with principal 
	 **/
	public AuditServiceContext(Principal principal){
		
		super(principal);
		setAuditable(true);
		auditdata = new AuditData();
	}
	
	/**
	 * constructor with principal and accesspoint 
	 **/
	public AuditServiceContext(Principal principal, AccessPoint accesspoint){
		
		this(principal);
		this.auditdata.setAccessPoint(accesspoint);
	}
	
	@Override
	public void beginAudit(String subject,String verb, InfoId<?> object, Object predicate){
		
		// audit off return 
		if(!isAuditable())
			return;
		
		auditdata.setSubject(subject);
		AuditVerb operVerb = new AuditVerb(verb, object);
		// convert object to map object so as to save as json
		Map<String,String> predicates = AuditConverter.beanToMap(predicate);		
		operVerb.addPredicates(predicates);
		// set operation primary verb
		auditdata.setAuditVerb(operVerb);
	}
	
	@Override
	public void addAuditPredicates(Object predicate){
		// audit off return 
		if(!isAuditable())
			return;
		Map<String,String> predicates = AuditConverter.beanToMap(predicate);
		// set operation primary verb predicates
		auditdata.addAuditVerbPredicates(predicates);
	}
	
	@Override 
	public void setAuditObject(InfoId<?> object){
		
		AuditVerb av = auditdata.getAuditVerb();
		if(null != av){
			av.setObject(object);
		}
	}
	
	/**
	 * endOperation will only be called once. 
	 **/
	@Override
	public void endAudit(ExecState state, String message){
		
		// audit off or already end, then return immediately
		if(!isAuditable())
			return;
		
		// already be set to other non-success state, don't change it to success.
		if(execstate != ExecState.UNKNOWN && state == ExecState.SUCCESS)
			return ;
		
		execstate = state;
		auditdata.endAuditVerb(state.name(), message);
	}

	/**
	 * Set the work group key of current context
	 **/
	public void setWorkgroupId(InfoId<Long> workgroupId){
		
		super.setWorkgroupId(workgroupId);
		auditdata.setWorkgroupId(workgroupId);
	}
	
	/**
	 * Get the work group key of current context.
	 **/
	public InfoId<Long> getWorkgroupId(){
		
		return super.getWorkgroupId();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public <A> A getAuditData(Class<A> clazz){

		return (A)auditdata;
	}
	
	@Override 
	public void persistAuditData(){
		// hand over the audit data to engine
		EventDispatcher.getInstance().sendPayload(auditdata);
	}
	
	/**
	 * enter this method means no exception occurs, then end operation.
	 * close : end the operation automatically. 
	 **/
	@Override
	public void close(){
			
		endAudit(ExecState.SUCCESS, "operation success.");

	}
}
