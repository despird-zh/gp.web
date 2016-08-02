package com.gp.web.workspace;

import com.gp.audit.AccessPoint;
import com.gp.common.GeneralConstants;
import com.gp.common.Posts;
import com.gp.common.Principal;
import com.gp.core.PostFacade;
import com.gp.dao.info.PostInfo;
import com.gp.exception.CoreException;
import com.gp.info.CombineInfo;
import com.gp.svc.info.PostExt;
import com.gp.web.model.Post;
import com.gp.web.util.CustomWebUtils;
import com.gp.web.util.ExcerptUtils;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gp.web.ActionResult;
import com.gp.web.BaseController;

@Controller("ws-topic-ctrl")
@RequestMapping("/workspace")
public class WSpaceTopicsController extends BaseController{

	static Logger LOGGER = LoggerFactory.getLogger(WSpaceTopicsController.class);

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

		CustomWebUtils.dumpRequestBody(request);
		Post post = new Post();
		//super.readRequestData(post);
		String attendeestr = request.getParameter("attendees");
		String[] attendees = null;
		if(StringUtils.isNotBlank(attendeestr)){
			attendees = StringUtils.split(attendeestr,GeneralConstants.KVPAIRS_SEPARATOR);
		}
		PostInfo pinfo = new PostInfo();
		pinfo.setOwner(principal.getAccount());
		/*
		pinfo.setSubject(post.getSubject());
		pinfo.setContent(post.getContent());
		pinfo.setCommentOn(post.getCommentOn());
		pinfo.setClassification(post.getClassification());
		*/
		pinfo.setSubject(request.getParameter("subject"));
		pinfo.setContent(request.getParameter("content"));
		pinfo.setCommentOn(Boolean.valueOf(request.getParameter("commentOn")));
		pinfo.setClassification(request.getParameter("classification"));
		
		pinfo.setWorkgroupId(GeneralConstants.PERSONAL_WORKGROUP);
		pinfo.setState(Posts.State.DRAFT.name());
		pinfo.setPostType(Posts.Type.DISCUSSION.name());
		pinfo.setScope(Posts.Scope.PRIVATE.name());
		pinfo.setPostDate(new Date());
		pinfo.setPriority(1);
		pinfo.setOwm(1l);
		try{
			pinfo.setExcerpt(ExcerptUtils.getExcerptCode(post.getContent()));
			if(LOGGER.isDebugEnabled()) {
				LOGGER.debug("Post Content : {}", pinfo.getContent());
				LOGGER.debug("Excerpt Content : {}", pinfo.getExcerpt());
			}
			PostFacade.newPost(accesspoint, principal, pinfo, attendees);
			result.setState(ActionResult.SUCCESS);
			result.setMessage(getMessage("mesg.save.post"));
		}catch(CoreException ce){
			
			result.setState(ActionResult.FAIL);
			result.setMessage(ce.getMessage());
			result.setDetailmsgs(ce.getValidateMessages());
		}
		
		return mav.addAllObjects(result.asMap());
	}

	@RequestMapping("post-search")
	public ModelAndView doPostSearch(HttpServletRequest request){

		Principal principal = super.getPrincipal();
		AccessPoint accesspoint = super.getAccessPoint(request);
		ActionResult result = new ActionResult();
		ModelAndView mav = getJsonModelView();
		String state = super.readRequestParam("state");
		String type = super.readRequestParam("type");
		String scope = super.readRequestParam("scope");
		try{
			List<CombineInfo<PostInfo, PostExt>> postlist = PostFacade.findPersonalPosts(
					accesspoint,
					principal,
					state,
					type,
					scope
			);

			List<Post> plist = new ArrayList<>();
			for(CombineInfo<PostInfo, PostExt> cinfo : postlist){
				Post post = new Post();
				post.setState(cinfo.getPrimary().getState());
				post.setOwner(cinfo.getPrimary().getOwner());
				post.setClassification(cinfo.getPrimary().getClassification());
				post.setOwnerName(cinfo.getExtended().getOwnerName());
				post.setCommentOn(cinfo.getPrimary().isCommentOn());
				post.setContent(cinfo.getPrimary().getContent());
				post.setExcerpt(cinfo.getPrimary().getExcerpt());
				post.setPostId(cinfo.getPrimary().getInfoId().getId());
				post.setSubject(cinfo.getPrimary().getSubject());
				post.setPostTime(cinfo.getPrimary().getPostDate().toString());
				post.setPriority(String.valueOf(cinfo.getPrimary().getPriority()));

				plist.add(post);
			}
			result.setData(plist);
			result.setState(ActionResult.SUCCESS);
			result.setMessage(getMessage("mesg.find.personal.post"));
		}catch(CoreException ce){

			result.setState(ActionResult.FAIL);
			result.setMessage(ce.getMessage());
			result.setDetailmsgs(ce.getValidateMessages());
		}

		return mav.addAllObjects(result.asMap());
	}
}
