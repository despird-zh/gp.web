package com.gp.web.workgroup;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gp.audit.AccessPoint;
import com.gp.common.GeneralConfig;
import com.gp.common.IdKey;
import com.gp.common.Principal;
import com.gp.common.SystemOptions;
import com.gp.core.CabinetFacade;
import com.gp.core.GeneralResult;
import com.gp.core.ImageFacade;
import com.gp.core.OrgHierFacade;
import com.gp.core.StorageFacade;
import com.gp.core.WorkgroupFacade;
import com.gp.info.CabinetInfo;
import com.gp.info.ImageInfo;
import com.gp.info.InfoId;
import com.gp.info.OrgHierInfo;
import com.gp.info.StorageInfo;
import com.gp.info.WorkgroupExInfo;
import com.gp.info.WorkgroupUserExInfo;
import com.gp.pagination.PageQuery;
import com.gp.pagination.PageWrapper;
import com.gp.pagination.PaginationInfo;
import com.gp.util.CommonUtils;
import com.gp.util.DateTimeUtils;
import com.gp.web.ActionResult;
import com.gp.web.BaseController;
import com.gp.web.model.Account;
import com.gp.web.model.WGroupMember;
import com.gp.web.model.Workgroup;


@Controller("wg-profile-ctrl")
@RequestMapping("/workgroup")
public class ProfileController extends BaseController{
	
	static String imagePath = GeneralConfig.getString(SystemOptions.IMAGE_CACHE_PATH);
	
	@RequestMapping("profile")
	public ModelAndView doInitial(HttpServletRequest request){
		
		ModelAndView mav = getJspModelView("workgroup/profile");
		// initial the work group id
		String wgroupid = super.readRequestParam("wgroup_id");
		mav.addObject("wgroup_id",  wgroupid);
		// initial group members, prepare the inifinite setting		
		Principal principal = super.getPrincipalFromShiro();
		AccessPoint accesspoint = super.getAccessPoint(request);
		PageQuery pquery = new PageQuery(12,1);
		this.readRequestData(request, pquery);
		InfoId<Long> wkey = null;
		if(StringUtils.isNotBlank(wgroupid) && CommonUtils.isNumeric(wgroupid)){
			
			wkey = IdKey.WORKGROUP.getInfoId(Long.valueOf(wgroupid));
		}
		List<Account> list = new ArrayList<Account>();
		GeneralResult<PageWrapper<WorkgroupUserExInfo>> gresult = WorkgroupFacade.findWorkgroupMembers(accesspoint, principal, wkey, null, null,pquery);
		Boolean hasMore = false;
		Integer nextPage = -1;
		if(gresult.isSuccess()){
			List<WorkgroupUserExInfo> ulist = gresult.getReturnValue().getRows();
			for(WorkgroupUserExInfo info: ulist){
				
				Account ui = new Account();
				ui.setSourceId(info.getInstanceId());
				ui.setUserId(info.getUserId().getId());
				ui.setAccount(info.getAccount());
				ui.setEmail(info.getEmail());
				ui.setType(info.getUserType());
				ui.setName(info.getUserName());
	
				list.add(ui);
			}
			PaginationInfo pginfo = gresult.getReturnValue().getPagination();
			hasMore = pginfo.getNext();
			nextPage = pginfo.getNextPage();
		}
		mav.addObject("members", list);
		mav.addObject("hasMore", hasMore);
		mav.addObject("nextPage", nextPage);
		return mav;
		
	}

	@RequestMapping("workgroup-info")
	public ModelAndView doFindWorkgroup(HttpServletRequest request){
		
		String wgid = super.readRequestParam("wgroup_id");
		Principal principal = super.getPrincipalFromShiro();
		AccessPoint accesspoint = super.getAccessPoint(request);
		ActionResult result = new ActionResult();
		ModelAndView mav = getJsonModelView();
		
		if(StringUtils.isBlank(wgid)){
			result.setState(ActionResult.FAIL);
			result.setMessage("request workgroup id not exist");
			
			mav.addAllObjects(result.asMap());
			return mav;
		}
		InfoId<Long> wgroupId = IdKey.WORKGROUP.getInfoId(Long.valueOf(wgid));
		
		GeneralResult<WorkgroupExInfo> gresult = WorkgroupFacade.findWorkgroupEx(accesspoint, principal, wgroupId);
		if(gresult.isSuccess() && null != gresult.getReturnValue()){
			WorkgroupExInfo info = gresult.getReturnValue();
			Workgroup wgroup = new Workgroup();
			
			wgroup.setWorkgroupId(info.getInfoId().getId());
			wgroup.setWorkgroupName(info.getWorkgroupName());
			wgroup.setAdmin(info.getAdmin());
			wgroup.setDescription(info.getDescription());
			wgroup.setInstanceName(info.getInstanceName());
			wgroup.setState(info.getState());
			wgroup.setDescription(info.getDescription());
			wgroup.setCreateDate(DateTimeUtils.toYearMonthDay(info.getCreateDate()));
			wgroup.setEntityCode(info.getEntityCode());
			wgroup.setNodeCode(info.getNodeCode());
			
			wgroup.setPublishOn(info.getPublishEnable());
			wgroup.setNetdiskOn(info.getNetdiskEnable());
			wgroup.setTopicOn(info.getPostEnable());
			wgroup.setTaskOn(info.getTaskEnable());
			wgroup.setShareOn(info.getShareEnable());
			wgroup.setLinkOn(info.getLinkEnable());
			
			// sotrage and organiztion
			wgroup.setStorageId(info.getStorageId());
			StorageInfo storage = StorageFacade.findStorage(accesspoint, principal, IdKey.STORAGE.getInfoId(info.getStorageId())).getReturnValue();
			if(null != storage)
				wgroup.setStorageName(storage.getStorageName());
			wgroup.setOrgId(info.getOrgId());
			OrgHierInfo orghier = OrgHierFacade.findOrgHier(accesspoint, principal, IdKey.ORG_HIER.getInfoId(info.getOrgId())).getReturnValue();
			if(null != orghier)
				wgroup.setOrgName(orghier.getOrgName());
			// avatar icon
			Long avatarId = info.getAvatarId();
			ImageInfo avatar = ImageFacade.findImage(accesspoint, principal, IdKey.IMAGE.getInfoId(avatarId)).getReturnValue();
			if(null != avatar){
				wgroup.setImagePath("../" + imagePath + "/" + avatar.getFileName());
			}
			// cabinet capacity
			Long pubcabId = info.getPublishCabinet();
			CabinetInfo pubcab = CabinetFacade.findCabinet(accesspoint, principal, IdKey.CABINET.getInfoId(pubcabId)).getReturnValue();
			wgroup.setPublishCapacity((int) (pubcab.getCapacity()/ (1024 * 1024)));
			Long pricabId = info.getNetdiskCabinet();
			CabinetInfo pricab = CabinetFacade.findCabinet(accesspoint, principal, IdKey.CABINET.getInfoId(pricabId)).getReturnValue();
			wgroup.setNetdiskCapacity((int) (pricab.getCapacity()/ (1024 * 1024)));
			
			result.setState(ActionResult.SUCCESS);
			result.setData(wgroup);
			
		}else{
			result.setState(ActionResult.FAIL);
		}
		
		result.setMessage(gresult.getMessage());
		mav.addAllObjects(result.asMap());
		
		return mav;
	}
	
	@RequestMapping("members-next")
	public ModelAndView doMembersNext(HttpServletRequest request){
		
		ModelAndView mav = getJspModelView("workgroup/profile-members-next");
		// initial the work group id
		String wgroupid = super.readRequestParam("wgroup_id");
		mav.addObject("wgroup_id",  wgroupid);
		// initial group members, prepare the inifinite setting		
		Principal principal = super.getPrincipalFromShiro();
		AccessPoint accesspoint = super.getAccessPoint(request);
		PageQuery pquery = new PageQuery(12,1);
		this.readRequestData(request, pquery);
		InfoId<Long> wkey = null;
		if(StringUtils.isNotBlank(wgroupid) && CommonUtils.isNumeric(wgroupid)){
			
			wkey = IdKey.WORKGROUP.getInfoId(Long.valueOf(wgroupid));
		}
		List<WGroupMember> list = new ArrayList<WGroupMember>();
		GeneralResult<PageWrapper<WorkgroupUserExInfo>> gresult = WorkgroupFacade.findWorkgroupMembers(accesspoint, principal, wkey, null, null,pquery);
		Boolean hasMore = false;
		Integer nextPage = -1;
		if(gresult.isSuccess()){
			List<WorkgroupUserExInfo> ulist = gresult.getReturnValue().getRows();
			for(WorkgroupUserExInfo info: ulist){
				
				WGroupMember wmember = new WGroupMember();
				wmember.setAccount(info.getAccount());
				wmember.setEmail(info.getEmail());
				wmember.setInstanceName(info.getInstanceName());
				wmember.setRole(info.getRole());
				wmember.setType(info.getUserType());
				wmember.setUname(info.getUserName());
				
				list.add(wmember);
			}
			PaginationInfo pginfo = gresult.getReturnValue().getPagination();
			hasMore = pginfo.getNext();
			nextPage = pginfo.getNextPage();
		}
		mav.addObject("members", list);
		mav.addObject("hasMore", hasMore);
		mav.addObject("nextPage", nextPage);
		return mav;		
	}
}
