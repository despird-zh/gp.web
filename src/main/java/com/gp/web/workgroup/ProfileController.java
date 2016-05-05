package com.gp.web.workgroup;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gp.web.BaseController;


@Controller("wg-profile-ctrl")
@RequestMapping("/workgroup")
public class ProfileController extends BaseController{

	@RequestMapping("profile")
	public ModelAndView doInitial(){
		
		return getJspModelView("workgroup/profile");
	}
}
