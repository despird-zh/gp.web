package com.gp.web.common;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.keyvalue.DefaultKeyValue;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gp.web.ActionResult;
import com.gp.web.BaseController;
import com.gp.web.model.Account;
import com.gp.web.model.OrgNode;
import com.gp.audit.AccessPoint;
import com.gp.common.GeneralConstants;
import com.gp.common.IdKey;
import com.gp.common.Principal;
import com.gp.core.GeneralResult;
import com.gp.core.InstanceFacade;
import com.gp.core.OrgHierFacade;
import com.gp.core.SecurityFacade;
import com.gp.core.StorageFacade;
import com.gp.core.WorkgroupFacade;
import com.gp.exception.WebException;
import com.gp.info.InfoId;
import com.gp.info.InstanceInfo;
import com.gp.info.OrgHierInfo;
import com.gp.info.StorageInfo;
import com.gp.info.UserExInfo;
import com.gp.info.WorkgroupUserExInfo;
import com.gp.pagination.PageQuery;
import com.gp.pagination.PageWrapper;
import com.gp.util.CommonUtils;

/**
 * This controller process the request from dialog etc. common request normally.
 * @author despird zhang
 * @version 0.1 2015-3-6 
 **/
@Controller("common-ctlr")
@RequestMapping("/common")
public class CommonController extends BaseController{

	static Logger LOGGER = LoggerFactory.getLogger(CommonController.class);
	
	@RequestMapping("entity-list")
	public ModelAndView doGetEntityNodeList(HttpServletRequest request) throws WebException {
		
		GeneralResult<PageWrapper<InstanceInfo>> gresult = null;
		
		PageQuery pquery = new PageQuery(10,1);
		this.readRequestData(request, pquery);
		String namecond = this.readRequestParam("instance_name");
		String alloption = this.readRequestParam("all_option");
		
		boolean allsupport = StringUtils.isBlank(alloption)? false:(Boolean.valueOf(alloption));
		
		Principal principal = super.getPrincipalFromShiro();
		AccessPoint accesspoint = super.getAccessPoint(request);
		
		ModelAndView mav = getJsonModelView();		
		List<DefaultKeyValue> enlist = new ArrayList<DefaultKeyValue>();
		int totalcnt = -1;
		gresult = InstanceFacade.findInstances(accesspoint, principal, namecond, pquery);
		if(gresult.isSuccess() && gresult.getReturnValue().getRows() != null){
			
			for(InstanceInfo einfo : gresult.getReturnValue().getRows()){
				
				DefaultKeyValue kv = new DefaultKeyValue(einfo.getInfoId().getId(), einfo.getInstanceName());
				enlist.add(kv);
			}
			totalcnt = gresult.getReturnValue().getPagination().getTotalRows();
			if(allsupport && pquery.getPageNumber() == 1){
				enlist.add(0,new DefaultKeyValue("_all", "All"));
				totalcnt += 1;
			}

		}else{
			totalcnt = 0;
			if(allsupport && pquery.getPageNumber() == 1){
				enlist.add(new DefaultKeyValue("_all", "All"));
				totalcnt += 1;
			}
		}
		
		mav.addObject("items", enlist);
		mav.addObject("total_count", totalcnt);
		
		return mav;
	}
	
	@RequestMapping("storage-info")
	public ModelAndView doGetStorageInfo(HttpServletRequest request){
		
		Principal principal = super.getPrincipalFromShiro();
		AccessPoint accesspoint = super.getAccessPoint(request);
		
		ModelAndView mav = super.getJsonModelView();
		String id = this.readRequestParam("storage_id");
		if(StringUtils.isNotBlank(id)){
			StorageInfo sinfo = StorageFacade.findStorage(accesspoint, principal, IdKey.STORAGE.getInfoId(Integer.valueOf(id))).getReturnValue();
			if(null != sinfo){
				mav.addObject("id", id);
				mav.addObject("text", sinfo.getStorageName());
			}				
		}
		return mav;
	}
	
	@RequestMapping("storage-list")
	public ModelAndView doGetStorageList(HttpServletRequest request){
		
		GeneralResult<PageWrapper<StorageInfo>> gresult = null;
		
		PageQuery pquery = new PageQuery(10,1);
		this.readRequestData(request, pquery);
		
		String namecond = this.readRequestParam("storage_name");
		String alloption = this.readRequestParam("all_option");
		
		boolean allsupport = StringUtils.isBlank(alloption)? false:(Boolean.valueOf(alloption));
		
		Principal principal = super.getPrincipalFromShiro();
		AccessPoint accesspoint = super.getAccessPoint(request);
		
		ModelAndView mav = super.getJsonModelView();
		gresult = StorageFacade.findStorages(accesspoint, principal, namecond, pquery);
		int totalcnt = -1;
		List<DefaultKeyValue> enlist = new ArrayList<DefaultKeyValue>();
		if(gresult.isSuccess()){			
			
			for(StorageInfo sinfo : gresult.getReturnValue().getRows()){
				
				DefaultKeyValue kv = new DefaultKeyValue(sinfo.getInfoId().getId(), 
						sinfo.getStorageName());
				enlist.add(kv);
			}
			
			totalcnt = gresult.getReturnValue().getPagination().getTotalRows();
			if(allsupport && pquery.getPageNumber() == 1){
				enlist.add(0,new DefaultKeyValue("_all", "All"));
				totalcnt += 1;
			}

		}else{
			totalcnt = 0;
			if(allsupport && pquery.getPageNumber() == 1){
				enlist.add(new DefaultKeyValue("_all", "All"));
				totalcnt += 1;
			}
		}
		
		mav.addObject("items", enlist);
		mav.addObject("total_count", totalcnt);
		
		return mav;
	} 
	
	/**
	 * Support Select User Dialog to list all the users in system 
	 **/
	@RequestMapping("user-list")
	public ModelAndView doGetUserList(HttpServletRequest request){
		

		List<Account> list = new ArrayList<Account>();
		Map<String,Object> pagedata = new HashMap<String,Object>();
		
		Principal principal = super.getPrincipalFromShiro();

		String uname = request.getParameter("user_name");

		Integer instanceId = null;

		GeneralResult<List<UserExInfo>> cresult = SecurityFacade.findAccounts(getAccessPoint(request), principal, uname, instanceId, new String[0],new String[0]);
		if(cresult.isSuccess()){
			List<UserExInfo> ulist = cresult.getReturnValue();
			for(UserExInfo info: ulist){
				
				Account ui = new Account();
				ui.setSid(String.valueOf(info.getSourceId()));
				ui.setUid(String.valueOf(info.getInfoId().getId()));
				ui.setAccount(info.getAccount());
				ui.setEmail(info.getEmail());
				ui.setMobile(info.getMobile());
				ui.setType(info.getType());
				ui.setName(info.getFullName());
				ui.setState(info.getState());
				ui.setSourceName(info.getInstanceName());
				list.add(ui);
			}			

			pagedata.put(MODEL_KEY_STATE, ActionResult.SUCCESS);
			pagedata.put(MODEL_KEY_MESSAGE, cresult.getMessage());

			pagedata.put(MODEL_KEY_ROWS, list);
		}else{

			pagedata.put(MODEL_KEY_STATE, ActionResult.ERROR);
			pagedata.put(MODEL_KEY_MESSAGE, cresult.getMessage());
		}
		
		ModelAndView mav = getJsonModelView();		
		mav.addAllObjects(pagedata);

		return mav;
		
	}
	
	@RequestMapping("org-nodes")
	public ModelAndView doGetOrghierNodes(HttpServletRequest request){
		
		String orgIdStr = request.getParameter("org_id");
		
		if(LOGGER.isDebugEnabled())
			LOGGER.debug("request org parent : ", orgIdStr);
		
		List<OrgNode> olist = new ArrayList<OrgNode>();		
		Long orgId = null;
		if(StringUtils.isNotBlank(orgIdStr) && CommonUtils.isNumeric(orgIdStr)){
		
			orgId = Long.valueOf(orgIdStr);
		}else if(StringUtils.isNotBlank(orgIdStr) && !CommonUtils.isNumeric(orgIdStr)){
			
			orgId = GeneralConstants.ORGHIER_ROOT;
		}else{
			
			ModelAndView mav = getJsonModelView(olist);
			return mav;
		}		
		
		Principal principal = super.getPrincipalFromShiro();
		AccessPoint accesspoint = super.getAccessPoint(request);
		
		GeneralResult<List<OrgHierInfo>> gresult = OrgHierFacade.findOrgHiers(accesspoint, principal, orgId);
		
		if(gresult.isSuccess() && gresult.getReturnValue() != null){
			
			List<OrgHierInfo> list = gresult.getReturnValue();
			for(OrgHierInfo orghier : list){
				OrgNode node = new OrgNode();
				
				node.setId(String.valueOf(orghier.getInfoId().getId()));
				
				if(GeneralConstants.ORGHIER_ROOT != orghier.getParentOrg()){
					node.setParent(String.valueOf(orghier.getParentOrg()));
				}				
				node.setText(orghier.getOrgName());
				node.setAdmin(orghier.getAdmin());
				node.setDescription(orghier.getDescription());
				node.setEmail(orghier.getEmail());
				node.setManager(orghier.getManager());
				
				olist.add(node);
			}			
		}
		
		ModelAndView mav = getJsonModelView(olist);
		return mav;		
	}

	/**
	 * This is used in dropdown widget to list available users could be assigned to a given workgroup
	 **/
	@RequestMapping("avail-user-list")
	public ModelAndView doGetAvailableUserList(HttpServletRequest request){
		
		String wgroupid = request.getParameter("wgroup_id");
		String account = super.readRequestParam("account");
		String alloption = this.readRequestParam("all_option");		
		boolean allsupport = StringUtils.isBlank(alloption)? false:(Boolean.valueOf(alloption));
		PageQuery pq = new PageQuery(5,1);
		super.readRequestData(request, pq);
		
		List<Account> list = new ArrayList<Account>();
		Principal principal = super.getPrincipalFromShiro();
		AccessPoint accesspoint = super.getAccessPoint(request);
		
		InfoId<Long> wkey = null;
		if(StringUtils.isNotBlank(wgroupid) && CommonUtils.isNumeric(wgroupid)){
			
			wkey = IdKey.WORKGROUP.getInfoId(Long.valueOf(wgroupid));
		}
		int totalcnt = -1;
		GeneralResult<PageWrapper<UserExInfo>> gresult = WorkgroupFacade.findWrokgroupAvailUsers(accesspoint, principal, wkey, account, pq);
		ModelAndView mav = super.getJsonModelView();
		if(gresult.isSuccess()){
			List<UserExInfo> ulist = gresult.getReturnValue().getRows();
			for(UserExInfo info: ulist){
				
				Account ui = new Account();
				ui.setSid(String.valueOf(info.getSourceId()));
				ui.setUid(String.valueOf(info.getInfoId().getId()));
				ui.setAccount(info.getAccount());
				ui.setEmail(info.getEmail());
				ui.setMobile(info.getMobile());
				ui.setType(info.getType());
				ui.setName(info.getFullName());
				ui.setState(info.getState());
				ui.setSourceName(info.getInstanceName());
				list.add(ui);
			}			

			totalcnt = gresult.getReturnValue().getPagination().getTotalRows();
			if(allsupport && pq.getPageNumber() == 1){
				Account ui = new Account();
				ui.setUid("-1");
				ui.setName("All");
				ui.setAccount("_all");
				list.add(0,ui);
				totalcnt += 1;
			}

		}else{
			totalcnt = 0;
			if(allsupport && pq.getPageNumber() == 1){
				Account ui = new Account();
				ui.setUid("-1");
				ui.setName("All");
				ui.setAccount("_all");
				list.add(0,ui);
				totalcnt += 1;
			}
		}
		
		mav.addObject("items", list);
		mav.addObject("total_count", totalcnt);
		
		return mav;
	}
	
	/**
	 * Find members of give workgroup, result will be used in common dialog to select workgroup member  
	 **/
	@RequestMapping("workgroup-member-list")
	public ModelAndView doGetWorkgroupMemberList(HttpServletRequest request){
		
		String wgroupid = request.getParameter("wgroup_id");
		String account = super.readRequestParam("user_name");

		List<Account> list = new ArrayList<Account>();
		Principal principal = super.getPrincipalFromShiro();
		AccessPoint accesspoint = super.getAccessPoint(request);
		
		InfoId<Long> wkey = null;
		if(StringUtils.isNotBlank(wgroupid) && CommonUtils.isNumeric(wgroupid)){
			
			wkey = IdKey.WORKGROUP.getInfoId(Long.valueOf(wgroupid));
		}
		
		GeneralResult<List<WorkgroupUserExInfo>> gresult = WorkgroupFacade.findWorkgroupMembers(accesspoint, principal, wkey, account, null);
		ModelAndView mav = super.getJsonModelView();
		if(gresult.isSuccess()){
			List<WorkgroupUserExInfo> ulist = gresult.getReturnValue();
			for(WorkgroupUserExInfo info: ulist){
				
				Account ui = new Account();
				ui.setSid(String.valueOf(info.getInstanceId()));
				ui.setUid(String.valueOf(info.getUserId().getId()));
				ui.setAccount(info.getAccount());
				ui.setEmail(info.getEmail());
				ui.setType(info.getUserType());
				ui.setName(info.getUserName());
	
				list.add(ui);
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
}
