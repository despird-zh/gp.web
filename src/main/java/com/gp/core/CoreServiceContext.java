package com.gp.core;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.gp.audit.AccessPoint;
import com.gp.audit.AuditConverter;
import com.gp.audit.AuditEventLoad;
import com.gp.audit.AuditVerb;
import com.gp.common.Principal;
import com.gp.common.ServiceContext;
import com.gp.disruptor.EventDispatcher;
import com.gp.info.InfoId;

/**
 * this class extends service context, collect necessary data of one operation.
 * these operation data is stored in a AuditData.
 * 
 * @author gary diao
 * @version 0.1 2014-12-12
 **/
public class CoreServiceContext extends ServiceContext{
	
	static Logger LOGGER = LoggerFactory.getLogger(CoreServiceContext.class);
	
	/**
	 * audit data holder 
	 **/
	private AuditEventLoad auditload = null;

	/**
	 * AuditState
	 **/
	private ExecState execstate = ExecState.UNKNOWN;
	
	/**
	 * constructor with principal 
	 **/
	public CoreServiceContext(Principal principal){
		
		super(principal);
		setAuditable(true);
		auditload = new AuditEventLoad();
	}
	
	/**
	 * constructor with principal and accesspoint 
	 **/
	public CoreServiceContext(Principal principal, AccessPoint accesspoint){
		
		this(principal);
		this.auditload.setAccessPoint(accesspoint);
	}
	
	/**
	 * set access point information
	 **/
	@Override
	public void setAccessPoint(String client, String host, String app, String version){
		
		this.auditload.setAccessPoint(new AccessPoint(client, host, app, version));
	}
	
	@Override
	public void beginOperation(String subject,String verb, InfoId<?> object, Object predicate){

		auditload.setSubject(subject);
		AuditVerb operVerb = new AuditVerb(verb, object);
		// convert object to map object so as to save as json
		Map<String,String> predicates = AuditConverter.beanToMap(predicate);		
		operVerb.addPredicates(predicates);
		// set operation primary verb
		auditload.setAuditVerb(operVerb);
	}
	
	@Override
	public void addOperationPredicates(Object predicate){

		Map<String,String> predicates = AuditConverter.beanToMap(predicate);
		// set operation primary verb predicates
		auditload.addAuditVerbPredicates(predicates);
	}
	
	@Override 
	public void setOperationObject(InfoId<?> object){
		
		AuditVerb av = auditload.getAuditVerb();
		if(null != av){
			av.setObject(object);
		}
	}
	
	/**
	 * endOperation will only be called once. 
	 **/
	@Override
	public void endOperation(ExecState state, String message){
		
		// already be set to other non-success state, don't change it to success.
		if(execstate != ExecState.UNKNOWN && state == ExecState.SUCCESS)
			return ;
		
		execstate = state;
		auditload.endAuditVerb(state.name(), message);
	}

	/**
	 * Set the work group key of current context
	 **/
	public void setWorkgroupId(InfoId<Long> workgroupId){
		
		super.setWorkgroupId(workgroupId);
		auditload.setWorkgroupId(workgroupId);
	}
	
	/**
	 * Get the work group key of current context.
	 **/
	public InfoId<Long> getWorkgroupId(){
		
		return super.getWorkgroupId();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public <A> A getOperationData(Class<A> clazz){

		return (A)auditload;
	}
	
	@Override 
	public void handleOperationData(){
		// trigger the audit event with audit load
		if(this.isAuditable())
			EventDispatcher.getInstance().sendPayload(auditload);
		
		// trigger the core event with core load
		AuditVerb verb = auditload.getAuditVerb();
		CoreEventLoad<Map<String,String>> coreload = new CoreEventLoad<Map<String,String>>(verb.getVerb());
		coreload.setObjectId(verb.getObject());
		coreload.setData(verb.getPredicateMap());
		
		EventDispatcher.getInstance().sendPayload(coreload);
	}
	
	/**
	 * enter this method means no exception occurs, then end operation.
	 * close : end the operation automatically. 
	 **/
	@Override
	public void close(){
			
		endOperation(ExecState.SUCCESS, "operation success.");

	}
}
