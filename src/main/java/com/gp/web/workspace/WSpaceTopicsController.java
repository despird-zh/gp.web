package com.gp.web.workspace;

import com.gp.common.Principal;
import com.gp.dao.info.PostInfo;
import com.gp.web.model.Post;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gp.web.BaseController;

@Controller("ws-topic-ctrl")
@RequestMapping("/workspace")
public class WSpaceTopicsController extends BaseController{

	@RequestMapping("topics")
	public ModelAndView doInitial(){

		Principal principal = super.getPrincipal();

		ModelAndView mav = getJspModelView("workspace/topics");
		mav.addObject("user_id", principal.getUserId().getId());
		return mav;
	}

	@RequestMapping("post-save")
	public ModelAndView doPostSave(){

		ModelAndView mav = getJsonModelView();
		String wgid = super.readRequestParam("wgroup_id");
		Post post = new Post();
		super.readRequestData(post);

		PostInfo pinfo = new PostInfo();
		pinfo.setSubject(post.getSubject());
		pinfo.setState("DRAFT");
		mav.addObject("wgroup_id",  wgid);
		return mav;
	}

	@RequestMapping("post-search")
	public ModelAndView doPostSearch(){

		ModelAndView mav = getJsonModelView();
		String wgid = super.readRequestParam("wgroup_id");



		mav.addObject("wgroup_id",  wgid);
		return mav;
	}
}
