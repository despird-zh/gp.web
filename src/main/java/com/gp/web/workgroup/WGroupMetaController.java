package com.gp.web.workgroup;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.NumberUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gp.audit.AccessPoint;
import com.gp.common.GeneralConfig;
import com.gp.common.IdKey;
import com.gp.common.Measures;
import com.gp.common.Principal;
import com.gp.common.SystemOptions;
import com.gp.core.CabinetFacade;
import com.gp.core.GeneralResult;
import com.gp.core.ImageFacade;
import com.gp.core.MeasureFacade;
import com.gp.core.OrgHierFacade;
import com.gp.core.StorageFacade;
import com.gp.core.WorkgroupFacade;
import com.gp.info.CabinetInfo;
import com.gp.info.ImageInfo;
import com.gp.info.InfoId;
import com.gp.info.MeasureInfo;
import com.gp.info.OrgHierInfo;
import com.gp.info.StorageInfo;
import com.gp.info.TagInfo;
import com.gp.info.WorkgroupExInfo;
import com.gp.util.DateTimeUtils;
import com.gp.web.ActionResult;
import com.gp.web.BaseController;
import com.gp.web.model.Tag;
import com.gp.web.model.WGroupSummary;
import com.gp.web.model.Workgroup;

@Controller("wg-meta-ctrl")
@RequestMapping("/workgroup")
public class WGroupMetaController extends BaseController{

	static Logger LOGGER = LoggerFactory.getLogger(WGroupMetaController.class);
	
	static String imagePath = GeneralConfig.getString(SystemOptions.IMAGE_CACHE_PATH);
	
	/**
	 * Retrieve the work group summary information. these information will be the latest measure record
	 * @param wgroup_id the id of work group
	 **/
	@RequestMapping("meta-summary")
	public ModelAndView doMetaSummary(HttpServletRequest request){
		
		ModelAndView mav = getJsonModelView();
		ActionResult actrst = new ActionResult();
		String widstr = super.readRequestParam("wgroup_id");
		Long wid = Long.valueOf(widstr);
		Principal principal = super.getPrincipalFromShiro();
		AccessPoint accesspoint = super.getAccessPoint(request);
		
		GeneralResult<MeasureInfo> gresult = MeasureFacade.findWorkgroupSummary(accesspoint, principal, 
				IdKey.WORKGROUP.getInfoId(wid));
		WGroupSummary wsum = new WGroupSummary();
		if(gresult.isSuccess()){
			
			MeasureInfo minfo = gresult.getReturnValue();
			if(null != gresult.getReturnValue()){
				wsum.setSumDocs(NumberUtils.toInt(minfo.getColValue(Measures.WG_MEAS_DOC), 0));
				wsum.setSumExtMbrs(NumberUtils.toInt(minfo.getColValue(Measures.WG_MEAS_EXT_MBR), 0));
				wsum.setSumMembers(NumberUtils.toInt(minfo.getColValue(Measures.WG_MEAS_MEMBER), 0));
				wsum.setSumSubGroups(NumberUtils.toInt(minfo.getColValue(Measures.WG_MEAS_SUB_GRP), 0));
				wsum.setSumTopics(NumberUtils.toInt(minfo.getColValue(Measures.WG_MEAS_TOPIC), 0));
			}
			actrst.setState(ActionResult.SUCCESS);
			actrst.setMessage(gresult.getMessage());
		}else{
			
			actrst.setState(ActionResult.FAIL);
			actrst.setMessage(gresult.getMessage());
		}
		
		actrst.setData(wsum);
		mav.addAllObjects(actrst.asMap());
		return mav;
	}

	@RequestMapping("meta-info")
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
		InfoId<Long> wgroupId = IdKey.WORKGROUP.getInfoId(NumberUtils.toLong(wgid));
		Workgroup wgroup = new Workgroup();
		GeneralResult<WorkgroupExInfo> gresult = WorkgroupFacade.findWorkgroupEx(accesspoint, principal, wgroupId);
		if(gresult.isSuccess() && null != gresult.getReturnValue()){
			WorkgroupExInfo info = gresult.getReturnValue();
			
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
		// query the tags information
		GeneralResult<List<TagInfo>> gtags = WorkgroupFacade.findWorkgroupTags(accesspoint, principal, wgroupId);
		if(gtags.isSuccess()){
			List<Tag> tags = new ArrayList<Tag>();
			List<TagInfo> tinfos = gtags.getReturnValue();
			for(TagInfo tinfo: tinfos){
				Tag t = new Tag();
				t.setTagColor(tinfo.getTagColor());
				t.setTagName(tinfo.getTagName());
				t.setCategory(tinfo.getCategory());
				
				tags.add(t);
			}
			
			wgroup.setTags(tags);
		}
		result.setMessage(gresult.getMessage());
		mav.addAllObjects(result.asMap());
		
		return mav;
	}
}
