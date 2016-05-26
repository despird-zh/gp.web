package com.gp.web.common;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gp.web.BaseController;

@Controller("personal-ctlr")
@RequestMapping("/personal")
public class PersonalController extends BaseController{

	static Logger LOGGER = LoggerFactory.getLogger(PersonalController.class);
	
	public ModelAndView doMessagesSearch(){
		
		return null;
		
	}
	
	public ModelAndView doNotificationsSearch(){
		return null;
		
	}
	
	public ModelAndView doTasksSearch(){
		return null;
		
	}
}
