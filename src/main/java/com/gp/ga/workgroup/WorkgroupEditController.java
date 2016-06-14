package com.gp.ga.workgroup;

import java.util.Date;
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
import com.gp.core.ImageFacade;
import com.gp.core.OrgHierFacade;
import com.gp.core.StorageFacade;
import com.gp.core.WorkgroupFacade;
import com.gp.exception.CoreException;
import com.gp.info.CabinetInfo;
import com.gp.info.CombineInfo;
import com.gp.info.ImageInfo;
import com.gp.info.InfoId;
import com.gp.info.OrgHierInfo;
import com.gp.info.StorageInfo;
import com.gp.info.WorkgroupInfo;
import com.gp.svc.info.WorkgroupExt;
import com.gp.util.DateTimeUtils;
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
		
		try{
			CombineInfo<WorkgroupInfo, WorkgroupExt> info = WorkgroupFacade.findWorkgroupEx(accesspoint, principal, wgroupId);
			Workgroup wgroup = new Workgroup();
			
			wgroup.setWorkgroupId(info.getPrimary().getInfoId().getId());
			wgroup.setWorkgroupName(info.getPrimary().getWorkgroupName());
			wgroup.setAdmin(info.getPrimary().getAdmin());
			wgroup.setManager(info.getPrimary().getManager());
			wgroup.setDescription(info.getPrimary().getDescription());
			wgroup.setInstanceName(info.getExtended().getInstanceName());
			wgroup.setState(info.getPrimary().getState());
			wgroup.setDescription(info.getPrimary().getDescription());
			wgroup.setCreateDate(DateTimeUtils.toYearMonthDay(info.getPrimary().getCreateDate()));
			wgroup.setEntityCode(info.getExtended().getEntityCode());
			wgroup.setNodeCode(info.getExtended().getNodeCode());
			
			wgroup.setPublishOn(info.getPrimary().getPublishEnable());
			wgroup.setNetdiskOn(info.getPrimary().getNetdiskEnable());
			wgroup.setTopicOn(info.getPrimary().getPostEnable());
			wgroup.setTaskOn(info.getPrimary().getTaskEnable());
			wgroup.setShareOn(info.getPrimary().getShareEnable());
			wgroup.setLinkOn(info.getPrimary().getLinkEnable());
			
			// sotrage and organiztion
			wgroup.setStorageId(info.getPrimary().getStorageId());
			StorageInfo storage = StorageFacade.findStorage(accesspoint, principal, IdKey.STORAGE.getInfoId(info.getPrimary().getStorageId()));
			if(null != storage)
				wgroup.setStorageName(storage.getStorageName());
			wgroup.setOrgId(info.getPrimary().getOrgId());
			OrgHierInfo orghier = OrgHierFacade.findOrgHier(accesspoint, principal, IdKey.ORG_HIER.getInfoId(info.getPrimary().getOrgId()));
			if(null != orghier)
				wgroup.setOrgName(orghier.getOrgName());
			// avatar icon
			Long avatarId = info.getPrimary().getAvatarId();
			ImageInfo avatar = ImageFacade.findImage(accesspoint, principal, IdKey.IMAGE.getInfoId(avatarId));
			if(null != avatar){
				wgroup.setImagePath("../" + imagePath + "/" + avatar.getFileName());
			}
			// cabinet capacity
			Long pubcabId = info.getPrimary().getPublishCabinet();
			CabinetInfo pubcab = CabinetFacade.findCabinet(accesspoint, principal, IdKey.CABINET.getInfoId(pubcabId));
			wgroup.setPublishCapacity((int) (pubcab.getCapacity()/ (1024 * 1024)));
			Long pricabId = info.getPrimary().getNetdiskCabinet();
			CabinetInfo pricab = CabinetFacade.findCabinet(accesspoint, principal, IdKey.CABINET.getInfoId(pricabId));
			wgroup.setNetdiskCapacity((int) (pricab.getCapacity()/ (1024 * 1024)));
			
			result.setState(ActionResult.SUCCESS);
			result.setMessage(getMessage("mesg.find.wgroup"));
			result.setData(wgroup);
			
		}catch(CoreException ce){
			result.setState(ActionResult.FAIL);
			result.setMessage(ce.getMessage());
		}
		
		
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
		info.setManager(group.getManager());
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

		try{
			WorkgroupFacade.updateWorkgroup(accesspoint, principal, 
				info, 
				(long)group.getPublishCapacity()*1024*1024, 
				(long)group.getNetdiskCapacity()*1024*1024,
				imagePath);

			result.setState(ActionResult.SUCCESS);
			result.setMessage(getMessage("mesg.save.wgroup"));
					
		}catch(CoreException ce){
			result.setState(ActionResult.ERROR);
			result.setMessage(ce.getMessage());	
			result.setDetailmsgs(ce.getValidateMessages());
		}
	
		mav.addAllObjects(result.asMap());

		return mav;

	}
}
