package com.gp.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.gp.validation.ValidationMessage;

/**
 **/
public class ActionResult  extends BaseResult{
	
	private String message = null;

	private Object data = null;
	
	private List<ValidationMessage> detailmsgs = null;
	
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}	
	
	/**
	 * convert the action result into map 
	 **/
	public Map<String, Object> asMap(){
		
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("message", this.message);
		map.put("data", data);
		map.put("state", super.getState());
		map.put("detailmsgs", detailmsgs);
		
		return map;
	}

	public List<ValidationMessage> getDetailmsgs() {
		return detailmsgs;
	}

	public void setDetailmsgs(List<ValidationMessage> detailmsgs) {
		this.detailmsgs = detailmsgs;
	}
}
