package com.gp.web.workgroup;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gp.web.BaseController;


@Controller("wg-task-ctrl")
@RequestMapping("/workgroup")
public class TasksController extends BaseController{

	@RequestMapping("tasks")
	public ModelAndView doInitial(){
		
		return getJspModelView("workgroup/tasks");
	}
}
