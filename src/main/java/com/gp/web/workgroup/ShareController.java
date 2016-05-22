package com.gp.web.workgroup;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gp.web.BaseController;


@Controller("wg-share-ctrl")
@RequestMapping("/workgroup")
public class ShareController extends BaseController{

	@RequestMapping("share")
	public ModelAndView doInitial(){

		ModelAndView mav = getJspModelView("workgroup/share");
		String wgid = super.readRequestParam("wgroup_id");
		mav.addObject("wgroup_id",  wgid);
		return mav;
	}
}
