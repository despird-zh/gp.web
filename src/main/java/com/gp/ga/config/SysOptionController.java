package com.gp.ga.config;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.keyvalue.DefaultKeyValue;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gp.audit.AccessPoint;
import com.gp.common.Principal;
import com.gp.core.GeneralResult;
import com.gp.core.MasterFacade;
import com.gp.info.SysOptionInfo;
import com.gp.web.ActionResult;
import com.gp.web.BaseController;
import com.gp.web.model.SysOption;

@Controller("ga-sysopt-ctlr")
@RequestMapping("/ga")
public class SysOptionController extends BaseController{

	static Logger LOGGER = LoggerFactory.getLogger(SysOptionController.class);
	
	@RequestMapping("sys-option")
	public ModelAndView doInitial(){
		
		return getJspModelView("ga/config/sys-option");
	}
	
	@RequestMapping("sys-option-groups")
	public ModelAndView doGetSystemOptionGroups(HttpServletRequest request){
		
		ActionResult ars = new ActionResult();
		List<DefaultKeyValue> groups = new ArrayList<DefaultKeyValue>();
		Principal princ = super.getPrincipalFromShiro();
		AccessPoint ap = super.getAccessPoint(request);

		GeneralResult<List<String>> grst = MasterFacade.findSystemOptionGroups(ap, princ);
		if(grst.isSuccess()){
			for(String group : grst.getReturnValue()){
				DefaultKeyValue item = new DefaultKeyValue(group,group);
				groups.add(item);
			}
			
			ars.setState(ActionResult.SUCCESS);
			ars.setMessage(grst.getMessage());
			ars.setData(groups);
		}else{
			ars.setState(ActionResult.ERROR);
			ars.setMessage(grst.getMessage());
			ars.setData(groups);
		}
		ModelAndView mav = super.getJsonModelView();
		mav.addAllObjects(ars.asMap());
		
		return mav;
	}
	
	@RequestMapping("sys-option-search")
	public ModelAndView doGetSystemOptions(HttpServletRequest request){
		
		List<SysOption> rows = new ArrayList<SysOption>();
		Principal princ = super.getPrincipalFromShiro();
		AccessPoint ap = super.getAccessPoint(request);

		String optgroup = this.readRequestParam("opt_group");
		GeneralResult<List<SysOptionInfo>> grst = MasterFacade.findSystemOptions(ap, princ, optgroup);
		
		ModelAndView mav = super.getJsonModelView();
		
		if(grst.isSuccess()){
			
			for(SysOptionInfo opt : grst.getReturnValue()){
				
				SysOption item = new SysOption();
				item.setGroup(opt.getOptionGroup());
				item.setOption(opt.getOptionKey());
				item.setValue(opt.getOptionValue());
				item.setDescription(opt.getDescription());
				
				rows.add(item);
			}
			
			mav.addObject(MODEL_KEY_STATE, ActionResult.SUCCESS);
			mav.addObject(MODEL_KEY_MESSAGE, grst.getMessage());
			mav.addObject(MODEL_KEY_ROWS, rows);

		}else{
			
			mav.addObject(MODEL_KEY_STATE, ActionResult.ERROR);
			mav.addObject(MODEL_KEY_MESSAGE, grst.getMessage());

		}
		
		return mav;
	}
	
	@RequestMapping("sys-option-save")
	public ModelAndView doSaveSystemOption(HttpServletRequest request){
		
		Principal princ = super.getPrincipalFromShiro();
		AccessPoint ap = super.getAccessPoint(request);
		
		String optkey = this.readRequestParam("option_key");
		String optvalue = this.readRequestParam("option_value");
		
		GeneralResult<Boolean> grst = MasterFacade.saveSystemOption(ap, princ, optkey, optvalue);
		
		ModelAndView mav = super.getJsonModelView();
		
		if(grst.isSuccess()){
						
			mav.addObject(MODEL_KEY_STATE, ActionResult.SUCCESS);
			mav.addObject(MODEL_KEY_MESSAGE, grst.getMessage());

		}else{
			
			mav.addObject(MODEL_KEY_STATE, ActionResult.ERROR);
			mav.addObject(MODEL_KEY_MESSAGE, grst.getMessage());
		}
		
		return mav;
	}
}
