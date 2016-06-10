package com.gp.core;

import java.util.ArrayList;
import java.util.List;

import com.gp.validate.ValidateMessage;

/**
 * Wrap the result value and necessary message, it's mostly used in core facade classed.
 * 
 *  @author gary diao
 *  @version 0.1 2015-12-12
 *  
 **/
public class GeneralResult<R> {

	private static String SUCCESS = "success";
	private static String FAIL = "fail";
	/** the return value */
	private R returnValue = null;
	/** the message holder */
	private List<ValidateMessage> messages = null;
	
	private ValidateMessage defaultmsg = new ValidateMessage(SUCCESS, null);
	
	/**
	 * get the return value 
	 **/
	public R getReturnValue(){
		
		return returnValue;
	}
	
	/**
	 * set the return value 
	 **/
	public void setReturnValue(R value){
		
		this.returnValue = value;
	}
	
	/**
	 * check has error message or not 
	 **/
	public boolean hasValidationMessage(){
		
		return (null != messages) && !messages.isEmpty();
	}
	
	/**
	 * if the result is success.
	 **/
	public boolean isSuccess(){
		
		return SUCCESS.equals(this.defaultmsg.getProperty());
	}
	
	/**
	 * get the message  
	 **/
	public List<ValidateMessage> getMessages(){
		
		return messages;
	}
	
	/**
	 * put validation message list of certain category
	 **/
	public void addMessages(List<ValidateMessage> messagelist){
		
		if(messages == null){
			messages = messagelist;
			return;
		}
		messages.addAll(messagelist);
	}
		
	/**
	 * get the message list of default 
	 **/
	public String getMessage(){
		
		return this.defaultmsg.getMessage();
	}
	
	/**
	 * Set success or fail message text
	 **/
	public void setMessage(String message, boolean success){

		this.defaultmsg.setProperty(success ? SUCCESS : FAIL);
		this.defaultmsg.setMessage(message);
	}
	
	/**
	 * put message to certain category
	 **/
	public void addMessage(ValidateMessage message){
		if(messages == null){
			messages = new ArrayList<ValidateMessage>();
		}
		messages.add(message);
	}
}
