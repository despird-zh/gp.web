package com.gp.web.workspace;

import com.gp.audit.AccessPoint;
import com.gp.common.GeneralConstants;
import com.gp.common.Posts;
import com.gp.common.Principal;
import com.gp.core.PostFacade;
import com.gp.dao.info.PostInfo;
import com.gp.exception.CoreException;
import com.gp.info.CombineInfo;
import com.gp.pagination.PageQuery;
import com.gp.pagination.PageWrapper;
import com.gp.svc.info.PostExt;
import com.gp.web.common.PostParser;
import com.gp.web.model.PostItem;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.shiro.util.CollectionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gp.web.ActionResult;
import com.gp.web.BaseController;

@Controller("ws-post-ctrl")
@RequestMapping("/workspace")
public class WSpacePostsController extends BaseController{

	static Logger LOGGER = LoggerFactory.getLogger(WSpacePostsController.class);

	@RequestMapping("posts")
	public ModelAndView doInitial(){

		Principal principal = super.getPrincipal();

		ModelAndView mav = getJspModelView("workspace/posts");
		mav.addObject("user_id", principal.getUserId().getId());
		return mav;
	}

	@RequestMapping("post-save")
	public ModelAndView doPostSave(HttpServletRequest request){

		Principal principal = super.getPrincipal();
		AccessPoint accesspoint = super.getAccessPoint(request);
		ActionResult result = new ActionResult();
		ModelAndView mav = getJsonModelView();

		//super.readRequestData(post);
		String attendeestr = request.getParameter("attendees");
		String[] attendees = null;
		if(StringUtils.isNotBlank(attendeestr)){
			attendees = StringUtils.split(attendeestr,GeneralConstants.KVPAIRS_SEPARATOR);
		}
		PostInfo pinfo = new PostInfo();
		pinfo.setOwner(principal.getAccount());
		pinfo.setSourceId(GeneralConstants.LOCAL_SOURCE);
		pinfo.setSubject(request.getParameter("subject"));
		// extract the content and excerpt
		PostParser postparser = new PostParser(request.getParameter("content"));
		pinfo.setContent(postparser.getPostContent());
		pinfo.setExcerpt(postparser.getPostExcerpt());
		if(LOGGER.isDebugEnabled()) {
			LOGGER.debug("PostItem Content : {}", pinfo.getContent());
			LOGGER.debug("Excerpt Content : {}", pinfo.getExcerpt());
			LOGGER.debug("PostItem Images : {}", postparser.getPostImages().toString());
		}
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

			PostFacade.newPost(accesspoint, principal, pinfo,postparser.getPostImages(), attendees);
			result.setState(ActionResult.SUCCESS);
			result.setMessage(getMessage("mesg.save.post"));
		}catch(CoreException ce){
			
			result.setState(ActionResult.FAIL);
			result.setMessage(ce.getMessage());
			result.setDetailmsgs(ce.getValidateMessages());
		}
		
		return mav.addAllObjects(result.asMap());
	}

	@RequestMapping("posts-next")
	public ModelAndView doPostContentNext(HttpServletRequest request) throws CoreException{

		ModelAndView mav = super.getJspModelView("workspace/posts-next");

		PageQuery pquery = new PageQuery(4,1);

		Principal principal = super.getPrincipal();
		AccessPoint accesspoint = super.getAccessPoint(request);

		String state = super.readRequestParam("state");
		String type = super.readRequestParam("type");
		String scope = super.readRequestParam("scope");
		super.readRequestData(pquery);

		PageWrapper<CombineInfo<PostInfo, PostExt>> presult = PostFacade.findPersonalPosts(
				accesspoint, principal, state, type, scope, pquery
		);

		List<CombineInfo<PostInfo, PostExt>> entries = presult.getRows();
		if(CollectionUtils.isEmpty(entries)){
			mav.addObject("entries", entries);
			mav.addObject("hasMore", false);
			mav.addObject("nextPage", 1);
			mav.addObject("state", state);
			mav.addObject("type", type);
			mav.addObject("scope", scope);
			return mav;
		}
		List<PostItem> items = new ArrayList<>();

		for(CombineInfo<PostInfo, PostExt> cinfo : entries){
			PostItem post = new PostItem();
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

			items.add(post);
		}

		mav.addObject("entries", items);
		mav.addObject("hasMore", items.size() == 4);
		mav.addObject("nextPage", pquery.getPageNumber() + 1);
		mav.addObject("state", state);
		mav.addObject("type", type);
		mav.addObject("scope", scope);

		return mav;
	}
}
