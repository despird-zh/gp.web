package com.gp.audit;

import java.util.HashMap;
import java.util.Map;

import com.gp.info.InfoId;

/**
 * AuditVerb hold the step level detail information
 * 
 * @author despird
 **/
public class AuditVerb {
	
	/** the time stamp */
	private Long timestamp;	
	/** operation time consuming */
	private Long elapse = 0L;	
	/** start flag */
	private boolean started = false;
	/** the verb */
	private String verb = null;
	/** the target data EntryKey */
	private InfoId<?> object = null;
	/** predicateMap */
	private Map<String, String> predicateMap = null;

	protected AuditVerb(){		
		this.timestamp = System.currentTimeMillis();
		predicateMap = new HashMap<String, String>();
	}
	/**
	 * Constructor with verb 
	 **/
	public AuditVerb(String verb){
		this.verb = verb;
		this.timestamp = System.currentTimeMillis();
		predicateMap = new HashMap<String, String>();
	}

	/**
	 * Constructor with verb and target 
	 **/
	public AuditVerb(String verb, InfoId<?> object){
		this(verb);
		this.object = object;
	}
	
	/**
	 * Get target data 
	 **/
	public InfoId<?> getObject() {
		return object;
	}

	/**
	 * Set target 
	 **/
	public void setObject(InfoId<?> object) {
		this.object = object;
	}
	
	/**
	 * Get verb 
	 **/
	public String getVerb(){
		
		return this.verb;
	}

	/**
	 * Set the verb
	 **/
	public void setVerb(String verb) {
		this.verb = verb;
	}
	
	/**
	 * Set state on/off
	 * @param start true:begin; false:end 
	 **/
	public void setStarted(boolean started){
		
		if(started){
			timestamp = System.currentTimeMillis();// reset start point
		}else{

			elapse = System.currentTimeMillis() - timestamp;
		}
		this.started = started;		
	}
	
	/**
	 * Get elapse time 
	 **/
	public long getElapse(){
		
		if(!started){
			
			return elapse;
		}else{
			
			long tempelapse = System.currentTimeMillis() - timestamp;
			return tempelapse;
		}
	}
	
	public void setElapse(Long elapse){
		
		this.elapse = elapse;
	}
	/**
	 * Audit state check
	 * @return true:audit on; false :audit off 
	 **/
	public boolean isStarted(){
		
		return this.started;
	}
	
	public Long getTimestamp(){
		
		return this.timestamp;
	}
	
	public void setTimestamp(Long timestamp){
		
		this.timestamp = timestamp;
	}
	
	/**
	 * Add predicate to map 
	 **/
	public void addPredicate(Predicate predicate) {

		predicateMap.put(predicate.getName(), predicate.getValue());
	}

	/**
	 * Add predicate to map 
	 **/
	public void addPredicate(String predicateName, String predicateValue) {

		predicateMap.put(predicateName, predicateValue);
	}
	
	/**
	 * Add predicate to map 
	 **/
	public void addPredicate(String predicateName, Object predicateValue) {
		
		if(predicateValue == null)
			predicateMap.put(predicateName, null);
		else
			predicateMap.put(predicateName, predicateValue.toString());
	}
	
	/**
	 * Remove predicate via verb name
	 **/
	public void removePredicate(String predicatename) {
		
		predicateMap.remove(predicatename);
	}
	
	/**
	 * Get predicate map 
	 **/
	public Map<String, String> getPredicateMap() {
		return predicateMap;
	}

	public void addPredicates(Map<String, String> predicatemap) {

		if(predicatemap != null)
			this.predicateMap.putAll(predicatemap);
		
	}
	
	public void clearPredicated(){
		if(predicateMap == null)
			return;
		this.predicateMap.clear();
	}
}
