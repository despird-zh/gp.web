package com.gp.core;

import com.gp.disruptor.EventPayload;
import com.gp.disruptor.EventType;
import com.gp.info.InfoId;

/**
 * This class wrap all the event fired during Core Running, 
 * usually the event is fired by audit event hooker, the root of event is service context 
 * 
 * @author gary diao
 * @version 0.1 2015-12-10
 * 
 **/
public class CoreEventLoad<T> implements EventPayload{

	private EventType eventType;
	
	private InfoId<?> objectId;
	
	private T data;
	
	private String operation;
	
	/**
	 * The constructor 
	 * 
	 * @param operation the operation  
	 **/
	public CoreEventLoad(String operation) {
		this.eventType = EventType.CORE;
		this.setOperation(operation);
	}

	/**
	 * The constructor
	 * @param eventType the event type
	 * @param payload the payload of event 
	 **/
	public CoreEventLoad(EventType eventType, T data) {
		
		this.data = data;
		this.eventType = eventType;		
	}
	
	/**
	 * the object id
	 **/
	public InfoId<?> getObjectId() {
		return objectId;
	}

	public void setObjectId(InfoId<?> objectId) {
		this.objectId = objectId;
	}

	public T getData(){
		
		return this.data;
	}
	
	public void setData( T data){
		
		this.data = data;
	}
	
	@Override
	public EventType getEventType() {
		
		return eventType;
	}

	public String getOperation() {
		return operation;
	}

	public void setOperation(String operation) {
		this.operation = operation;
	}
}
