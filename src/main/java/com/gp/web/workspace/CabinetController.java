package com.gp.web.workspace;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gp.web.BaseController;

@Controller("ws-cabinet-ctrl")
@RequestMapping("/workspace")
public class CabinetController extends BaseController{

	@RequestMapping("netdisk")
	public ModelAndView doInitial(){
		
		return getJspModelView("workspace/netdisk");
	}
}
