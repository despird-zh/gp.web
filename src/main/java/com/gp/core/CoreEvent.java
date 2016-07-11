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
public class CoreEvent<T> implements EventPayload{

	private EventType eventType;
	
	private InfoId<?> objectId;
	
	private T payload;
	
	private String operation;
	
	public CoreEvent(String operation) {
		this.eventType = EventType.CORE;
		this.setOperation(operation);
	}

	public CoreEvent(EventType eventType, T payload) {
		
		this.payload = payload;
		this.eventType = eventType;		
	}
	
	public InfoId<?> getObjectId() {
		return objectId;
	}

	public void setObjectId(InfoId<?> objectId) {
		this.objectId = objectId;
	}

	public T getData(){
		
		return this.payload;
	}
	
	public void setData( T data){
		
		this.payload = data;
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
