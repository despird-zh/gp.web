package com.gp.web.workgroup;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gp.web.BaseController;

@Controller("wg-meta-ctrl")
@RequestMapping("/workgroup")
public class MetaController extends BaseController{

	@RequestMapping("meta-info")
	public ModelAndView doProfileInitial(){
		
		ModelAndView mav = getJsonModelView();
		
		return mav;
	}

}
