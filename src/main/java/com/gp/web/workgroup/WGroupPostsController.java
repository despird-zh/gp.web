package com.gp.web.workgroup;

import java.util.*;

import javax.servlet.http.HttpServletRequest;

import com.gp.common.*;
import com.gp.info.InfoId;
import com.gp.web.ActionResult;
import com.gp.web.common.PostParser;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.NumberUtils;
import org.apache.shiro.util.CollectionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gp.audit.AccessPoint;
import com.gp.core.PostFacade;
import com.gp.core.SecurityFacade;
import com.gp.dao.info.PostCommentInfo;
import com.gp.dao.info.PostInfo;
import com.gp.exception.CoreException;
import com.gp.info.CombineInfo;
import com.gp.pagination.PageQuery;
import com.gp.pagination.PageWrapper;
import com.gp.svc.info.PostExt;
import com.gp.svc.info.UserLite;
import com.gp.util.ConfigSettingUtils;
import com.gp.util.DateTimeUtils;
import com.gp.web.BaseController;
import com.gp.web.model.Comment;
import com.gp.web.model.PostItem;
import com.gp.web.workspace.WSpacePostsController;

@Controller("wg-posts-ctrl")
@RequestMapping("/workgroup")
public class WGroupPostsController extends BaseController{

	static Logger LOGGER = LoggerFactory.getLogger(WGroupPostsController.class);
	
	static String ImagePath = ConfigSettingUtils.getSystemOption(SystemOptions.IMAGE_CACHE_PATH);
	
	@RequestMapping("posts")
	public ModelAndView doInitial(){
		
		Principal principal = super.getPrincipal();
		
		ModelAndView mav = getJspModelView("workgroup/posts");
		String wgid = super.readRequestParam("wgroup_id");
		// set user id and work group id to page
		mav.addObject("user_id", principal.getUserId().getId());
		mav.addObject("wgroup_id",  wgid);
		return mav;
	}

	@RequestMapping("post-save")
	public ModelAndView doPostSave(HttpServletRequest request){

		Principal principal = super.getPrincipal();
		AccessPoint accesspoint = super.getAccessPoint(request);
		ActionResult result = new ActionResult();
		ModelAndView mav = getJsonModelView();

		String wgroupid = request.getParameter("wgroup_id");
		//super.readRequestData(post);
		String attendeestr = request.getParameter("attendees");
		String[] attendees = null;
		if(StringUtils.isNotBlank(attendeestr)){
			attendees = StringUtils.split(attendeestr, GeneralConstants.KVPAIRS_SEPARATOR);
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

		pinfo.setWorkgroupId(NumberUtils.toLong(wgroupid));
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

		ModelAndView mav = super.getJspModelView("workgroup/posts-next");

		PageQuery pquery = new PageQuery(4,1);

		Principal principal = super.getPrincipal();
		AccessPoint accesspoint = super.getAccessPoint(request);

		String state = super.readRequestParam("state");
		String type = super.readRequestParam("type");
		String scope = super.readRequestParam("scope");
		String wgid = super.readRequestParam("wgroup_id");
		InfoId<Long> wgroupId = IdKey.WORKGROUP.getInfoId(NumberUtils.toLong(wgid));
		super.readRequestData(pquery);

		PageWrapper<CombineInfo<PostInfo, PostExt>> presult = PostFacade.findWorkgroupPosts(
				accesspoint, principal,wgroupId, state, type, scope, pquery
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
		Set<String> accounts = new HashSet<String>();
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

			accounts.add(cinfo.getPrimary().getOwner());

			// find the comments and attach them to post.
			List<PostCommentInfo> cinfos = PostFacade.findPostComments(accesspoint,principal,
					cinfo.getPrimary().getInfoId(), null, null);

			List<Comment> comments = new ArrayList<>();
			// prepare to fetch the author avatar etc
			for(PostCommentInfo cmtinfo: cinfos){

				accounts.add(cmtinfo.getAuthor());

				Comment cmt = new Comment();
				cmt.setState(cmtinfo.getState());
				cmt.setAuthor(cmtinfo.getAuthor());
				cmt.setCommentDate(DateTimeUtils.toDateTime(cmtinfo.getCommentDate()));
				cmt.setContent(cmtinfo.getContent());
				cmt.setPostId(cmtinfo.getPostId());

				comments.add(cmt);
			}
			post.setComments(comments);
			// set the attendees
			List<UserLite> attendees = PostFacade.findPostAttendees(accesspoint, principal,
					cinfo.getPrimary().getInfoId());
			for(UserLite ulite : attendees){
				// decorate the link of image
				ulite.setAvatarLink("../"+ImagePath + "/" + ulite.getAvatarLink());
			}
			post.setAttendees(attendees);

			// add post to item list
			items.add(post);
		}
		List<String> userlist = new ArrayList<>();
		userlist.addAll(accounts);
		List<UserLite> allusers = SecurityFacade.findAccountLites(accesspoint, principal,
				null, userlist);
		Map<String, UserLite> allmap = new HashMap<>();
		for(UserLite ulite : allusers){
			
			allmap.put(ulite.getAccount(), ulite);
		}

		for(PostItem item : items){
			// set owner avatar link
			item.setOwnerAvatar("../"+ImagePath + "/" + allmap.get(item.getOwner()).getAvatarLink());
			for(Comment comment: item.getComments()){

				comment.setAuthorAvatar("../"+ImagePath + "/" + allmap.get(comment.getAuthor()).getAvatarLink());
			}
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
