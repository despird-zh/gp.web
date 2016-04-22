package com.gp.ga.workgroup;

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

import com.gp.audit.AccessPoint;
import com.gp.common.GeneralConstants;
import com.gp.common.IdKey;
import com.gp.common.Principal;
import com.gp.core.GeneralResult;
import com.gp.core.WorkgroupFacade;
import com.gp.info.GroupInfo;
import com.gp.info.InfoId;
import com.gp.info.UserInfo;
import com.gp.info.WorkgroupInfo;
import com.gp.info.WorkgroupUserExInfo;
import com.gp.util.CommonUtils;
import com.gp.validation.ValidationMessage;
import com.gp.web.ActionResult;
import com.gp.web.BaseController;
import com.gp.web.CustomWebUtils;
import com.gp.web.ServletUtils;
import com.gp.web.model.Account;
import com.gp.web.model.GroupMember;
import com.gp.web.model.UserGroup;
import com.gp.web.model.Workgroup;
import com.gp.web.model.WorkgroupMember;

@Controller("ga-wg-add-ctlr")
@RequestMapping("/ga")
public class WorkgroupAddController extends BaseController{

	static Logger LOGGER = LoggerFactory.getLogger(WorkgroupAddController.class);
	
	@RequestMapping("workgroup-new")
	public ModelAndView doInitial(){
		
		return getJspModelView("ga/config/workgroup-new");
	}
	
	@RequestMapping("workgroup-add")
	public ModelAndView doWorkgroupAdd(HttpServletRequest request){
		
		if(LOGGER.isDebugEnabled())
			CustomWebUtils.dumpRequestAttributes(request);
		
		ModelAndView mav = getJsonModelView();
		Workgroup group = new Workgroup();
		readRequestData(request, group);
		
		Principal principal = super.getPrincipalFromShiro();
		AccessPoint accesspoint = super.getAccessPoint(request);
		ActionResult result = new ActionResult();
		WorkgroupInfo info = new WorkgroupInfo();
		
		info.setSourceId(GeneralConstants.LOCAL_INSTANCE);// set local workgroup id
		info.setWorkgroupName(group.getWorkgroupName());
		info.setDescription(group.getDescription());
		info.setState(group.getState());
		info.setAdmin(group.getAdmin());
		info.setCreator(principal.getAccount());
		info.setCreateDate(new Date(System.currentTimeMillis()));
		info.setOrgId(group.getOrgId());
		info.setPublishEnable(group.getPublishOn());
		info.setNetdiskEnable(group.getNetdiskOn());
		info.setPostEnable(group.getTopicOn());
		info.setTaskEnable(group.getTaskOn());
		info.setShareEnable(group.getShareOn());
		info.setLinkEnable(group.getLinkOn());
		info.setStorageId(group.getStorageId());
		
		// convert the url into disk path, ignore [..]
		String basePath = ServletUtils.getBaseUrl(request);
		String imagePath = request.getServletContext().getRealPath(group.getImagePath().substring(basePath.length()));
		LOGGER.debug("image file path : {}", imagePath);
		
		GeneralResult<InfoId<Long>> gresult = WorkgroupFacade.newWorkgroup(accesspoint, principal, 
				info, 
				(long)group.getPublishCapacity()*1024*1024, 
				(long)group.getNetdiskCapacity()*1024*1024,
				imagePath);
		
		if(!gresult.isSuccess() && gresult.hasValidationMessage()){
			List<ValidationMessage> msg = gresult.getMessages();
			
			result.setState(ActionResult.ERROR);
			result.setMessage(gresult.getMessage());
			result.setDetailmsgs(msg);
		}else{
			result.setData(gresult.getReturnValue());
			result.setState(ActionResult.SUCCESS);
			result.setMessage(gresult.getMessage());
		}
	
		mav.addAllObjects(result.asMap());

		return mav;

	}
	
	@RequestMapping("workgroup-member-search")
	public ModelAndView doSearchWorkgroupMembers(HttpServletRequest request){
		
		if(LOGGER.isDebugEnabled())
			CustomWebUtils.dumpRequestAttributes(request);
		
		String account = super.readRequestParam("account");
		String enode = super.readRequestParam("enode_id");
		String wgroupid = super.readRequestParam("wgroup_id");
		
		Principal principal = super.getPrincipalFromShiro();
		AccessPoint accesspoint = super.getAccessPoint(request);

		InfoId<Integer> entityId = null;
		if(StringUtils.isNotBlank(enode) && CommonUtils.isNumeric(enode)){
			
			entityId = IdKey.INSTANCE.getInfoId(Integer.valueOf(enode));
		}
		
		InfoId<Long> wkey = null;
		if(StringUtils.isNotBlank(wgroupid) && CommonUtils.isNumeric(wgroupid)){
			
			wkey = IdKey.WORKGROUP.getInfoId(Long.valueOf(wgroupid));
		}
		GeneralResult<List<WorkgroupUserExInfo>> gresult = WorkgroupFacade.findWorkgroupMembers(accesspoint, principal, 
				wkey, account, entityId);
		
		ModelAndView mav = getJsonModelView();
		List<WorkgroupMember> list = new ArrayList<WorkgroupMember>();
		if(gresult.isSuccess()){
			List<WorkgroupUserExInfo> ulist = gresult.getReturnValue();
			for(WorkgroupUserExInfo info: ulist){
				
				WorkgroupMember wmember = new WorkgroupMember();
				wmember.setAccount(info.getAccount());
				wmember.setEmail(info.getEmail());
				wmember.setInstanceName(info.getInstanceName());
				wmember.setRole(info.getRole());
				wmember.setType(info.getUserType());
				wmember.setUname(info.getUserName());
				
				list.add(wmember);
			}			

			mav.addObject(MODEL_KEY_STATE, ActionResult.SUCCESS);
			mav.addObject(MODEL_KEY_MESSAGE, gresult.getMessage());
			mav.addObject(MODEL_KEY_ROWS, list);
		}else{

			mav.addObject(MODEL_KEY_STATE, ActionResult.ERROR);
			mav.addObject(MODEL_KEY_MESSAGE, gresult.getMessage());
		}
		
		return mav;
	}
	
	@RequestMapping("workgroup-member-remove")
	public ModelAndView doRemoveWorkgroupMember(HttpServletRequest request){
		
		if(LOGGER.isDebugEnabled())
			CustomWebUtils.dumpRequestAttributes(request);
		
		String account = super.readRequestParam("account");
		String wgroupid = super.readRequestParam("wgroup_id");
		
		Principal principal = super.getPrincipalFromShiro();
		AccessPoint accesspoint = super.getAccessPoint(request);
		
		InfoId<Long> wkey = null;
		if(StringUtils.isNotBlank(wgroupid) && CommonUtils.isNumeric(wgroupid)){
			
			wkey = IdKey.WORKGROUP.getInfoId(Long.valueOf(wgroupid));
		}
		
		GeneralResult<Boolean> gresult = WorkgroupFacade.removeWorkgroupMember(accesspoint, principal, wkey, account);
		ActionResult aresult = new ActionResult();
		if(!gresult.isSuccess()){
			aresult.setState(ActionResult.ERROR);
			aresult.setMessage(gresult.getMessage());
			aresult.setDetailmsgs(gresult.getMessages());
		}else{
			
			aresult.setState(ActionResult.SUCCESS);
			aresult.setMessage(gresult.getMessage());
		}
		
		ModelAndView mav = getJsonModelView();
		mav.addAllObjects(aresult.asMap());
		return mav;
	}
	
	@RequestMapping("workgroup-member-add")
	public ModelAndView doAddWorkgroupMember(HttpServletRequest request){
		
		if(LOGGER.isDebugEnabled())
			CustomWebUtils.dumpRequestAttributes(request);
		
		String account = super.readRequestParam("account");
		String wgroupid = super.readRequestParam("wgroup_id");
		String role = super.readRequestParam("role");
		
		Principal principal = super.getPrincipalFromShiro();
		AccessPoint accesspoint = super.getAccessPoint(request);
		
		InfoId<Long> wkey = null;
		if(StringUtils.isNotBlank(wgroupid) && CommonUtils.isNumeric(wgroupid)){
			
			wkey = IdKey.WORKGROUP.getInfoId(Long.valueOf(wgroupid));
		}
		
		GeneralResult<Boolean> gresult = WorkgroupFacade.addWorkgroupMember(accesspoint, principal, wkey, account,role);
		
		ActionResult aresult = new ActionResult();
		if(!gresult.isSuccess()){
			aresult.setState(ActionResult.ERROR);
			aresult.setMessage(gresult.getMessage());
			aresult.setDetailmsgs(gresult.getMessages());
		}else{
			
			aresult.setState(ActionResult.SUCCESS);
			aresult.setMessage(gresult.getMessage());
		}
		
		ModelAndView mav = getJsonModelView();
		mav.addAllObjects(aresult.asMap());
		return mav;
	}
	
	@RequestMapping("workgroup-group-add")
	public ModelAndView doAddWorkgroupGroup(HttpServletRequest request){
		
		if(LOGGER.isDebugEnabled())
			CustomWebUtils.dumpRequestAttributes(request);
		
		String group = super.readRequestParam("group");
		String wgroupid = super.readRequestParam("wgroup_id");
		String description = super.readRequestParam("description");
		
		Principal principal = super.getPrincipalFromShiro();
		AccessPoint accesspoint = super.getAccessPoint(request);
		
		GroupInfo ginfo = new GroupInfo();

		if(StringUtils.isNotBlank(wgroupid) && CommonUtils.isNumeric(wgroupid)){
			
			ginfo.setWorkgroupId(Long.valueOf(wgroupid));
		}
		ginfo.setDescription(description);
		ginfo.setGroupName(group);
		
		GeneralResult<Boolean> gresult = WorkgroupFacade.newWorkgroupGroup(accesspoint, principal, ginfo);
		
		ActionResult aresult = new ActionResult();
		if(!gresult.isSuccess()){
			aresult.setState(ActionResult.ERROR);
			aresult.setMessage(gresult.getMessage());
			aresult.setDetailmsgs(gresult.getMessages());
		}else{
			
			aresult.setState(ActionResult.SUCCESS);
			aresult.setMessage(gresult.getMessage());
		}
		
		ModelAndView mav = getJsonModelView();
		mav.addAllObjects(aresult.asMap());
		return mav;
	}
	
	@RequestMapping("workgroup-group-search")
	public ModelAndView doSearchWorkgroupGroup(HttpServletRequest request){
		
		if(LOGGER.isDebugEnabled())
			CustomWebUtils.dumpRequestAttributes(request);
		
		String group = super.readRequestParam("group");
		String wgroupid = super.readRequestParam("wgroup_id");
		
		Principal principal = super.getPrincipalFromShiro();
		AccessPoint accesspoint = super.getAccessPoint(request);
		InfoId<Long> wkey = null;
		if(StringUtils.isNotBlank(wgroupid) && CommonUtils.isNumeric(wgroupid)){
			
			wkey = IdKey.WORKGROUP.getInfoId(Long.valueOf(wgroupid));
		}
		
		GeneralResult<List<GroupInfo>> gresult = WorkgroupFacade.findWorkgroupGroups(accesspoint, principal, wkey, group);
		ModelAndView mav = getJsonModelView();
		List<UserGroup> list = new ArrayList<UserGroup>();
		if(gresult.isSuccess()){
			List<GroupInfo> ulist = gresult.getReturnValue();
			for(GroupInfo info: ulist){
				
				UserGroup ug = new UserGroup();
				ug.setGroupId(info.getInfoId().getId());
				ug.setDescription(info.getDescription());
				ug.setGroup(info.getGroupName());
				ug.setWorkgroupId(info.getWorkgroupId());
				list.add(ug);
			}

			mav.addObject(MODEL_KEY_STATE, ActionResult.SUCCESS);
			mav.addObject(MODEL_KEY_MESSAGE, gresult.getMessage());

			mav.addObject(MODEL_KEY_ROWS, list);
		}else{

			mav.addObject(MODEL_KEY_STATE, ActionResult.ERROR);
			mav.addObject(MODEL_KEY_MESSAGE, gresult.getMessage());
		}
		
		return mav;		
	}
	
	@RequestMapping("workgroup-group-remove")
	public ModelAndView doRemoveWorkgroupGroup(HttpServletRequest request){
		
		if(LOGGER.isDebugEnabled())
			CustomWebUtils.dumpRequestAttributes(request);
		
		String groupid = super.readRequestParam("group_id");

		Principal principal = super.getPrincipalFromShiro();
		AccessPoint accesspoint = super.getAccessPoint(request);
		
		InfoId<Long> gid = null;
		if(StringUtils.isNotBlank(groupid) && CommonUtils.isNumeric(groupid)){
			
			gid = IdKey.GROUP.getInfoId(Long.valueOf(groupid));
		}
		
		GeneralResult<Boolean> gresult = WorkgroupFacade.removeWorkgroupGroup(accesspoint, principal, gid);
		ActionResult aresult = new ActionResult();
		if(!gresult.isSuccess()){
			aresult.setState(ActionResult.ERROR);
			aresult.setMessage(gresult.getMessage());
			aresult.setDetailmsgs(gresult.getMessages());
		}else{
			
			aresult.setState(ActionResult.SUCCESS);
			aresult.setMessage(gresult.getMessage());
		}
		
		ModelAndView mav = getJsonModelView();
		mav.addAllObjects(aresult.asMap());
		return mav;
	}
	
	@RequestMapping("workgroup-group-member-add")
	public ModelAndView doAddWorkgroupGroupMember(HttpServletRequest request){
		
		if(LOGGER.isDebugEnabled())
			CustomWebUtils.dumpRequestAttributes(request);
		
		String groupid = super.readRequestParam("group_id");

		Principal principal = super.getPrincipalFromShiro();
		AccessPoint accesspoint = super.getAccessPoint(request);
		
		InfoId<Long> gid = null;
		if(StringUtils.isNotBlank(groupid) && CommonUtils.isNumeric(groupid)){
			
			gid = IdKey.GROUP.getInfoId(Long.valueOf(groupid));
		}
		Account[] users = super.readRequestJson("users", Account[].class);
		String[] accounts = new String[users.length];
		int count = 0;
		for(Account a: users){
			accounts[count] = a.getAccount();
			count++;
		}
		GeneralResult<Boolean> gresult = WorkgroupFacade.addWorkgroupGroupMembers(accesspoint, principal, gid, accounts);
		ActionResult aresult = new ActionResult();
		if(!gresult.isSuccess()){
			aresult.setState(ActionResult.ERROR);
			aresult.setMessage(gresult.getMessage());
			aresult.setDetailmsgs(gresult.getMessages());
		}else{
			
			aresult.setState(ActionResult.SUCCESS);
			aresult.setMessage(gresult.getMessage());
		}
		
		ModelAndView mav = getJsonModelView();
		mav.addAllObjects(aresult.asMap());
		return mav;
	}
	
	@RequestMapping("workgroup-group-member-search")
	public ModelAndView doSearchWorkgroupGroupMember(HttpServletRequest request){
		
		if(LOGGER.isDebugEnabled())
			CustomWebUtils.dumpRequestAttributes(request);
		
		String groupid = super.readRequestParam("group_id");
		Principal principal = super.getPrincipalFromShiro();
		AccessPoint accesspoint = super.getAccessPoint(request);

		InfoId<Long> gid = null;
		if(StringUtils.isNotBlank(groupid) && CommonUtils.isNumeric(groupid)){
			
			gid = IdKey.GROUP.getInfoId(Long.valueOf(groupid));
		}
		
		GeneralResult<List<UserInfo>> gresult = WorkgroupFacade.findWorkgroupGroupMembers(accesspoint, principal, gid);
		
		ModelAndView mav = getJsonModelView();
		List<GroupMember> list = new ArrayList<GroupMember>();
		if(gresult.isSuccess()){
			List<UserInfo> ulist = gresult.getReturnValue();
			for(UserInfo info: ulist){
				
				GroupMember gm = new GroupMember();
				gm.setUname(info.getFullName());
				gm.setAccount(info.getAccount());
				gm.setEmail(info.getEmail());
				gm.setType(info.getType());
				list.add(gm);
			}

			mav.addObject(MODEL_KEY_STATE, ActionResult.SUCCESS);
			mav.addObject(MODEL_KEY_MESSAGE, gresult.getMessage());

			mav.addObject(MODEL_KEY_ROWS, list);
		}else{

			mav.addObject(MODEL_KEY_STATE, ActionResult.ERROR);
			mav.addObject(MODEL_KEY_MESSAGE, gresult.getMessage());
		}

		return mav;
	}
	
	@RequestMapping("workgroup-group-member-remove")
	public ModelAndView doRemoveWorkgroupGroupMember(HttpServletRequest request){
		
		if(LOGGER.isDebugEnabled())
			CustomWebUtils.dumpRequestAttributes(request);
		
		String groupid = super.readRequestParam("group_id");
		String account = super.readRequestParam("account");
		Principal principal = super.getPrincipalFromShiro();
		AccessPoint accesspoint = super.getAccessPoint(request);
		
		InfoId<Long> gid = null;
		if(StringUtils.isNotBlank(groupid) && CommonUtils.isNumeric(groupid)){
			
			gid = IdKey.GROUP.getInfoId(Long.valueOf(groupid));
		}
		
		GeneralResult<Boolean> gresult = WorkgroupFacade.removeWorkgroupGroupMember(accesspoint, principal, gid, account);
		ActionResult aresult = new ActionResult();
		if(!gresult.isSuccess()){
			aresult.setState(ActionResult.ERROR);
			aresult.setMessage(gresult.getMessage());
			aresult.setDetailmsgs(gresult.getMessages());
		}else{
			
			aresult.setState(ActionResult.SUCCESS);
			aresult.setMessage(gresult.getMessage());
		}
		
		ModelAndView mav = getJsonModelView();
		mav.addAllObjects(aresult.asMap());
		return mav;
	}
}
