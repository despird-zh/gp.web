package com.gp.web.cabinet;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gp.web.BaseController;

@Controller("common-cabinet-ctlr")
@RequestMapping("/workgroup")
public class CabinetController extends BaseController{

	@RequestMapping("cabinet")
	public ModelAndView doInitial(){
		
		return getJspModelView("workgroup/netdisk");
	}
}
