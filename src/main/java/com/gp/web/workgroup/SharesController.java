package com.gp.web.workgroup;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gp.web.BaseController;


@Controller("wg-share-ctrl")
@RequestMapping("/workgroup")
public class SharesController extends BaseController{

	@RequestMapping("shares")
	public ModelAndView doInitial(){
		
		return getJspModelView("workgroup/shares");
	}
}
