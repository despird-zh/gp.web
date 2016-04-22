package com.gp.web.workgroup;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gp.web.BaseController;

@Controller("wg-all-ctrl")
@RequestMapping("/workgroup")
public class AllWorkGroupController extends BaseController{

	@RequestMapping("all-grid")
	public ModelAndView doGridInitial(){
		
		return getJspModelView("workgroup/all-grid");
	}
	
	@RequestMapping("all-grid-next")
	public ModelAndView doGridNextLoad(){
		String pidxstr = this.readRequestParam("pageindex");
		int pidx = Integer.valueOf(pidxstr);
		ModelAndView mav = getJspModelView("workgroup/all-grid-next");
		mav.addObject("pageindex", pidx + 1);
		return mav;
	}
	
	@RequestMapping("all-hier")
	public ModelAndView doHierInitial(){
		
		return getJspModelView("workgroup/all-hier");
	}
	
	@RequestMapping("all-list")
	public ModelAndView doListInitial(){
		
		return getJspModelView("workgroup/all-list");
	}
	
	@RequestMapping("all-list-next")
	public ModelAndView doListNextLoad(){
		String pidxstr = this.readRequestParam("pageindex");
		int pidx = Integer.valueOf(pidxstr);
		ModelAndView mav = getJspModelView("workgroup/all-list-next");
		mav.addObject("pageindex", pidx + 1);
		return mav;
	}
}
