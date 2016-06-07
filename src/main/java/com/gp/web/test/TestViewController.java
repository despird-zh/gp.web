package com.gp.web.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gp.web.BaseController;
import com.gp.web.test.TestController.TestBean;

@Controller("test-view-ctlr")
@RequestMapping("/test")
public class TestViewController extends BaseController{
	
	@RequestMapping("test-view")
	public ModelAndView test(){
		
		ModelAndView mav = super.getJspModelView("test/test-view");

		return mav;
	}
}
