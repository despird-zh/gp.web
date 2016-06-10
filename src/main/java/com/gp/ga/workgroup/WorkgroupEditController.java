package com.gp.ga.workgroup;

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
import com.gp.common.GeneralConfig;
import com.gp.common.GeneralConstants;
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
import com.gp.info.WorkgroupInfo;
import com.gp.util.DateTimeUtils;
import com.gp.validate.ValidateMessage;
import com.gp.web.ActionResult;
import com.gp.web.BaseController;
import com.gp.web.CustomWebUtils;
import com.gp.web.ServletUtils;
import com.gp.web.model.Workgroup;

@Controller("ga-wg-edit-ctlr")
@RequestMapping("/ga")
public class WorkgroupEditController extends BaseController{
	
	static Logger LOGGER = LoggerFactory.getLogger(WorkgroupAddController.class);
	
	static String imagePath = GeneralConfig.getString(SystemOptions.IMAGE_CACHE_PATH);
	
	@RequestMapping("workgroup-edit")
	public ModelAndView doPageShow(HttpServletRequest request){
		
		ModelAndView mav = getJspModelView("ga/config/workgroup-edit");
		String wgid = super.readRequestParam("wgroup_id");
		
		mav.addObject("wgroup_id",  wgid);
		
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
	
	@RequestMapping("workgroup-update")
	public ModelAndView doWorkgroupUpdate(HttpServletRequest request){
		
		if(LOGGER.isDebugEnabled())
			CustomWebUtils.dumpRequestAttributes(request);
		
		ModelAndView mav = getJsonModelView();
		Workgroup group = new Workgroup();
		readRequestData(request, group);
		
		Principal principal = super.getPrincipalFromShiro();
		AccessPoint accesspoint = super.getAccessPoint(request);
		ActionResult result = new ActionResult();
		WorkgroupInfo info = new WorkgroupInfo();
		
		InfoId<Long> wgroupId = IdKey.WORKGROUP.getInfoId(group.getWorkgroupId());
		info.setInfoId(wgroupId);
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
		
		GeneralResult<Boolean> gresult = WorkgroupFacade.updateWorkgroup(accesspoint, principal, 
				info, 
				(long)group.getPublishCapacity()*1024*1024, 
				(long)group.getNetdiskCapacity()*1024*1024,
				imagePath);
		
		if(!gresult.isSuccess() || gresult.getReturnValue()){
			if(gresult.hasValidationMessage()){
				List<ValidateMessage> msg = gresult.getMessages();
				result.setDetailmsgs(msg);
			}
			result.setState(ActionResult.ERROR);
			result.setMessage(gresult.getMessage());			
		}else{
			result.setData(gresult.getReturnValue());
			result.setState(ActionResult.SUCCESS);
			result.setMessage(gresult.getMessage());
		}
	
		mav.addAllObjects(result.asMap());

		return mav;

	}
}
