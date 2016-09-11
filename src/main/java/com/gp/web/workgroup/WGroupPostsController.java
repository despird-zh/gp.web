package com.gp.web.workgroup;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.util.CollectionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gp.audit.AccessPoint;
import com.gp.common.Principal;
import com.gp.common.SystemOptions;
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
	public ModelAndView doPostSave(){

		ModelAndView mav = getJsonModelView();
		String wgid = super.readRequestParam("wgroup_id");

		mav.addObject("wgroup_id",  wgid);
		return mav;
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
