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
	
	@RequestMapping("basic-setting")
	public ModelAndView doBasicSettingSearch(HttpServletRequest request){
		
		ModelAndView mav = super.getJsonModelView();
		ActionResult result = new ActionResult();
		
		Principal principal = super.getPrincipalFromShiro();
		AccessPoint accesspoint = super.getAccessPoint(request);
		
		try {
			UserInfo uinfo = PersonalFacade.findAccountBasic(accesspoint, principal, principal.getUserId());
			Account ui = new Account();
			ui.setSourceId(uinfo.getSourceId());
			ui.setUserId(uinfo.getInfoId().getId());
			ui.setAccount(uinfo.getAccount());
			ui.setEmail(uinfo.getEmail());
			ui.setMobile(uinfo.getMobile());
			ui.setPhone(uinfo.getPhone());
			ui.setType(uinfo.getType());

			ui.setName(uinfo.getFullName());
		
			ui.setState(uinfo.getState());
			result.setData(ui);
			
			result.setState(ActionResult.SUCCESS);
			result.setMessage(getMessage("mesg.find.account"));
		} catch (CoreException e) {
			result.setState(ActionResult.FAIL);
			result.setMessage(e.getMessage());
		}
		
		mav.addAllObjects(result.asMap());
		return mav;
	}
}
