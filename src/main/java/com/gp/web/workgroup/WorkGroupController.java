package com.gp.web.workgroup;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gp.web.BaseController;

@Controller("wg-groups-ctrl")
@RequestMapping("/workgroup")
public class WorkGroupController extends BaseController{

	@RequestMapping("workgroup-profile")
	public ModelAndView doProfileInitial(){
		
		return getJspModelView("workgroup/workgroup-profile");
	}
	
	@RequestMapping("workgroup-grid")
	public ModelAndView doGridInitial(){
		
		return getJspModelView("workgroup/workgroup-grid");
	}
	
	@RequestMapping("workgroup-list")
	public ModelAndView doListInitial(){
		
		return getJspModelView("workgroup/workgroup-list");
	}
}
