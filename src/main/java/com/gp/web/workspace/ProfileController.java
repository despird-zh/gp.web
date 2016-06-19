package com.gp.web.workspace;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gp.web.BaseController;

@Controller("ws-profile-ctrl")
@RequestMapping("/workspace")
public class ProfileController extends BaseController{

	@RequestMapping("profile")
	public ModelAndView doInitial(){
		
		return getJspModelView("workspace/profile");
	}
}
