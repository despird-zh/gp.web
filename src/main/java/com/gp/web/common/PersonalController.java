package com.gp.web.common;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gp.audit.AccessPoint;
import com.gp.common.Principal;
import com.gp.core.PersonalFacade;
import com.gp.exception.CoreException;
import com.gp.info.UserInfo;
import com.gp.util.DateTimeUtils;
import com.gp.web.ActionResult;
import com.gp.web.BaseController;
import com.gp.web.model.Account;

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
