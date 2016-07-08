package com.gp.web.common;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gp.audit.AccessPoint;
import com.gp.common.Principal;
import com.gp.core.MeasureFacade;
import com.gp.core.OrgHierFacade;
import com.gp.core.PersonalFacade;
import com.gp.core.SecurityFacade;
import com.gp.exception.CoreException;
import com.gp.info.CombineInfo;
import com.gp.info.OrgHierInfo;
import com.gp.info.UserInfo;
import com.gp.info.UserSumInfo;
import com.gp.svc.info.UserExt;
import com.gp.web.ActionResult;
import com.gp.web.BaseController;
import com.gp.web.model.TreeNode;
import com.gp.web.model.UserMetaSummary;

@Controller("comm-personal-ctlr")
@RequestMapping("/common")
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
