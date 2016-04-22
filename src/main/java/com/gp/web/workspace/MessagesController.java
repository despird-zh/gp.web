package com.gp.web.workspace;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gp.web.BaseController;

@Controller("ws-message-ctrl")
@RequestMapping("/workspace")
public class MessagesController extends BaseController{

	@RequestMapping("messages")
	public ModelAndView doInitial(){
		
		return getJspModelView("workspace/messages");
	}
}
