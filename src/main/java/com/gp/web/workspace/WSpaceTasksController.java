package com.gp.web.workspace;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gp.web.BaseController;

@Controller("ws-task-ctrl")
@RequestMapping("/workspace")
public class WSpaceTasksController extends BaseController{

	private static final long serialVersionUID = 1L;

	@RequestMapping("tasks")
	public ModelAndView doInitial(){
		
		return getJspModelView("workspace/tasks");
	}
}
