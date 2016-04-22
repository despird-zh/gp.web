package com.gp.ga.config;

import java.util.ArrayList;
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
import com.gp.core.OrgHierFacade;
import com.gp.info.InfoId;
import com.gp.info.OrgHierInfo;
import com.gp.info.UserInfo;
import com.gp.pagination.PageQuery;
import com.gp.pagination.PageWrapper;
import com.gp.util.CommonUtils;
import com.gp.util.DateTimeUtils;
import com.gp.web.ActionResult;
import com.gp.web.BaseController;
import com.gp.web.CustomWebUtils;
import com.gp.web.model.Account;
import com.gp.web.model.OrgNode;

@Controller("ga-orghier-ctlr")
@RequestMapping("/ga")
public class OrgHierController extends BaseController{

	static Logger LOGGER = LoggerFactory.getLogger(OrgHierController.class);
	
	@RequestMapping("orghier")
	public ModelAndView doInitial(){
		
		return getJspModelView("ga/config/orghier");
	}
	
	@RequestMapping("orghier-add")
	public ModelAndView doAddOrgHier(HttpServletRequest request){
		
		if(LOGGER.isDebugEnabled()){
			CustomWebUtils.dumpRequestAttributes(request);
		}
		ActionResult aresult = new ActionResult();
		ModelAndView mav = getJsonModelView();
		OrgNode params = new OrgNode();		
		readRequestData(request, params);
		Long parentId = null;
		if(StringUtils.isNotBlank(params.getParent()) && CommonUtils.isNumeric(params.getParent())){
		
			parentId = Long.valueOf(params.getParent());
		}else {
			
			parentId = GeneralConstants.ORGHIER_ROOT;
		}
		OrgHierInfo orghier = new OrgHierInfo();
		
		orghier.setParentOrg(parentId);
		orghier.setAdmin(params.getAdmin());
		orghier.setDescription(params.getDescription());
		orghier.setEmail(params.getEmail());
		orghier.setManager(params.getManager());
		orghier.setOrgName(params.getText());
		
		Principal principal = super.getPrincipalFromShiro();
		AccessPoint accesspoint = super.getAccessPoint(request);
		GeneralResult<InfoId<Long>> gresult = OrgHierFacade.newOrgHier(accesspoint, principal, orghier);
		
		if(!gresult.isSuccess()){
			aresult.setState(ActionResult.ERROR);
			aresult.setMessage(gresult.getMessage());
			aresult.setDetailmsgs(gresult.getMessages());
		}else{
			
			aresult.setState(ActionResult.SUCCESS);
			aresult.setMessage(gresult.getMessage());
		}
		
		mav.addAllObjects(aresult.asMap());
		return mav;
	}
	
	@RequestMapping("orghier-save")
	public ModelAndView doSaveOrgHier(HttpServletRequest request){
		
		if(LOGGER.isDebugEnabled()){
			CustomWebUtils.dumpRequestAttributes(request);
		}
		ActionResult aresult = new ActionResult();
		ModelAndView mav = getJsonModelView();
		OrgNode params = new OrgNode();		
		readRequestData(request, params);
		InfoId<Long> nodeId = null;
		if(StringUtils.isNotBlank(params.getId()) && CommonUtils.isNumeric(params.getId())){
		
			Long nid = Long.valueOf(params.getId());
			nodeId = IdKey.ORG_HIER.getInfoId( nid);
		}else {
			
			aresult.setState(ActionResult.ERROR);
			aresult.setMessage("node id must be specified");
			mav.addAllObjects(aresult.asMap());
			return mav;
		}
		
		Principal principal = super.getPrincipalFromShiro();
		AccessPoint accesspoint = super.getAccessPoint(request);
		OrgHierInfo orghier = null;
		GeneralResult<OrgHierInfo> orgresult = OrgHierFacade.findOrgHier(accesspoint, principal, nodeId);
		
		if(orgresult.isSuccess()){
			orghier = orgresult.getReturnValue();
			orghier.setAdmin(params.getAdmin());
			orghier.setDescription(params.getDescription());
			orghier.setEmail(params.getEmail());
			orghier.setManager(params.getManager());
			orghier.setOrgName(params.getText());
		}
		GeneralResult<Boolean> gresult = OrgHierFacade.saveOrgHier(accesspoint, principal, orghier);
		
		if(!gresult.isSuccess()){
			aresult.setState(ActionResult.ERROR);
			aresult.setMessage(gresult.getMessage());
			aresult.setDetailmsgs(gresult.getMessages());
		}else{
			
			aresult.setState(ActionResult.SUCCESS);
			aresult.setMessage(gresult.getMessage());
		}
		
		mav.addAllObjects(aresult.asMap());
		return mav;
	}
	
	@RequestMapping("orghier-member-add")
	public ModelAndView doAddOrgHierMember(HttpServletRequest request){
		
		if(LOGGER.isDebugEnabled()){
			CustomWebUtils.dumpRequestAttributes(request);
		}
		String orgIdStr = super.readRequestParam("org_id");
		InfoId<Long> nodeId = null;
		if(StringUtils.isNotBlank(orgIdStr) && CommonUtils.isNumeric(orgIdStr)){
			
			Long nid = Long.valueOf(orgIdStr);
			nodeId = IdKey.ORG_HIER.getInfoId(nid);
		}
		Account[] users = super.readRequestJson("users", Account[].class);
		String[] accounts = new String[users.length];
		int count = 0;
		for(Account a: users){
			accounts[count] = a.getAccount();
			count++;
		}
		Principal principal = super.getPrincipalFromShiro();
		AccessPoint accesspoint = super.getAccessPoint(request);
		GeneralResult<Boolean> gresult = OrgHierFacade.addOrgHierMember(accesspoint, principal, nodeId, accounts);
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

	@RequestMapping("orghier-member-remove")
	public ModelAndView doRemoveOrgHierMember(HttpServletRequest request){
		
		if(LOGGER.isDebugEnabled()){
			CustomWebUtils.dumpRequestAttributes(request);
		}
		String orgIdStr = super.readRequestParam("org_id");
		InfoId<Long> nodeId = null;
		if(StringUtils.isNotBlank(orgIdStr) && CommonUtils.isNumeric(orgIdStr)){
			
			Long nid = Long.valueOf(orgIdStr);
			nodeId = IdKey.ORG_HIER.getInfoId( nid);
		}
		String account = super.readRequestParam("account");
		Principal principal = super.getPrincipalFromShiro();
		AccessPoint accesspoint = super.getAccessPoint(request);
		GeneralResult<Boolean> gresult = OrgHierFacade.removeOrgHierMember(accesspoint, principal, nodeId, account);
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
	
	@RequestMapping("orghier-member-search")
	public ModelAndView doOrgHierMemberSearch(HttpServletRequest request){
		
		if(LOGGER.isDebugEnabled()){
			CustomWebUtils.dumpRequestAttributes(request);
		}
		String orgIdStr = super.readRequestParam("org_id");
		InfoId<Long> nodeId = null;
		if(StringUtils.isNotBlank(orgIdStr) && CommonUtils.isNumeric(orgIdStr)){
			
			Long nid = Long.valueOf(orgIdStr);
			nodeId = IdKey.ORG_HIER.getInfoId( nid);
		}
		PageQuery pquery = new PageQuery(5,1);
		this.readRequestData(request, pquery);
		
		Principal principal = super.getPrincipalFromShiro();
		AccessPoint accesspoint = super.getAccessPoint(request);
		
		ModelAndView mav = getJsonModelView();
		GeneralResult<PageWrapper<UserInfo>> gresult = OrgHierFacade.findOrgHierMembers(accesspoint, principal, nodeId, pquery);
		List<Account> list = new ArrayList<Account>();
		if(gresult.isSuccess()){
			
			List<UserInfo> ulist = gresult.getReturnValue().getRows();
			for(UserInfo info: ulist){
				
				Account ui = new Account();
				ui.setSid(String.valueOf(info.getSourceId()));
				ui.setUid(String.valueOf(info.getInfoId().getId()));
				ui.setAccount(info.getAccount());
				ui.setEmail(info.getEmail());
				ui.setMobile(info.getMobile());
				ui.setType(info.getType());
				if(info.getCreateDate() != null)
					ui.setCreateDate(DateTimeUtils.toYearMonthDay(info.getCreateDate()));
				
				ui.setName(info.getFullName());
				ui.setState(info.getState());
	
				list.add(ui);
			}	
			
			mav.addObject(MODEL_KEY_STATE, ActionResult.SUCCESS);
			mav.addObject(MODEL_KEY_MESSAGE, gresult.getMessage());
			mav.addObject(MODEL_KEY_PAGINATION, gresult.getReturnValue().getPagination());
			mav.addObject(MODEL_KEY_ROWS, list);
		}else{
			
			mav.addObject(MODEL_KEY_STATE, ActionResult.ERROR);
			mav.addObject(MODEL_KEY_MESSAGE, gresult.getMessage());
		}

		return mav;
	}
}
