package com.gp.web.workspace;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gp.web.BaseController;

@Controller("ws-setting-ctrl")
@RequestMapping("/workspace")
public class SettingController  extends BaseController{
	
	@RequestMapping("setting")
	public ModelAndView doInitial(){
		
		return getJspModelView("workspace/setting");
		
	}
}
