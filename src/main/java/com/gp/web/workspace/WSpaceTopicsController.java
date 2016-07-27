package com.gp.web.workspace;

import com.gp.audit.AccessPoint;
import com.gp.common.GeneralConstants;
import com.gp.common.Posts;
import com.gp.common.Principal;
import com.gp.core.PostFacade;
import com.gp.dao.info.PostInfo;
import com.gp.exception.CoreException;
import com.gp.web.model.Post;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gp.web.ActionResult;
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
	public ModelAndView doPostSave(HttpServletRequest request){

		Principal principal = super.getPrincipal();
		AccessPoint accesspoint = super.getAccessPoint(request);
		ActionResult result = new ActionResult();
		ModelAndView mav = getJsonModelView();
		String wgid = super.readRequestParam("wgroup_id");
		Post post = new Post();
		super.readRequestData(post);
		String attendeestr = request.getParameter("attendees");
		String[] attendees = null;
		if(StringUtils.isNotBlank(attendeestr)){
			attendees = StringUtils.split(attendeestr,GeneralConstants.KVPAIRS_SEPARATOR);
		}
		PostInfo pinfo = new PostInfo();
		pinfo.setSubject(post.getSubject());
		pinfo.setWorkgroupId(GeneralConstants.PERSON_WORKGROUP);
		pinfo.setState(Posts.State.DRAFT.name());
		pinfo.setContent(post.getContent());
		pinfo.setCommentOn(post.getCommentOn());
		pinfo.setOwner(principal.getAccount());
		pinfo.setPostDate(new Date());
		pinfo.setPostType(Posts.Type.DISCUSSION.name());
		pinfo.setScope(Posts.Scope.PRIVATE.name());
		pinfo.setOwm(1l);
		try{
			PostFacade.newPost(accesspoint, principal, pinfo, attendees);
			result.setState(ActionResult.SUCCESS);
			result.setMessage(getMessage("mesg.save.post"));
		}catch(CoreException ce){
			
			result.setState(ActionResult.FAIL);
			result.setMessage(ce.getMessage());
		}
		
		return mav.addAllObjects(result.asMap());
	}

	@RequestMapping("post-search")
	public ModelAndView doPostSearch(){

		ModelAndView mav = getJsonModelView();
		String wgid = super.readRequestParam("wgroup_id");

		mav.addObject("wgroup_id",  wgid);
		return mav;
	}
}
