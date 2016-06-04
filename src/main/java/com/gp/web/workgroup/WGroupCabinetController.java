package com.gp.web.workgroup;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.NumberUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gp.audit.AccessPoint;
import com.gp.common.Cabinets;
import com.gp.common.IdKey;
import com.gp.common.Principal;
import com.gp.core.CabinetFacade;
import com.gp.core.GeneralResult;
import com.gp.core.WorkgroupFacade;
import com.gp.info.CabEntryInfo;
import com.gp.info.CabFileInfo;
import com.gp.info.CabFolderInfo;
import com.gp.info.InfoId;
import com.gp.info.TagInfo;
import com.gp.info.WorkgroupInfo;
import com.gp.pagination.PageQuery;
import com.gp.pagination.PageWrapper;
import com.gp.util.DateTimeUtils;
import com.gp.web.ActionResult;
import com.gp.web.BaseController;
import com.gp.web.model.CabinetItem;
import com.gp.web.model.ItemStat;
import com.gp.web.model.Tag;
/**
 * This controller wrap the operation on cabinet and repository 
 **/
@Controller("wg-cabinet-ctrl")
@RequestMapping("/workgroup")
public class WGroupCabinetController extends BaseController{
	
	List<String > TIMESTRINGS = Arrays.asList("年","月","天","小时","分钟","秒");
	
	@RequestMapping("publish")
	public ModelAndView doPublishInitial(HttpServletRequest request){
		
		ModelAndView mav = getJspModelView("workgroup/publish");
		String wgid = super.readRequestParam("wgroup_id");
		Principal principal = super.getPrincipalFromShiro();
		AccessPoint accesspoint = super.getAccessPoint(request);
		InfoId<Long> wkey = IdKey.WORKGROUP.getInfoId(NumberUtils.toLong(wgid));
		GeneralResult<WorkgroupInfo> gresult = WorkgroupFacade.findWorkgroup(accesspoint, principal, wkey);
		
		mav.addObject("wgroup_id",  wgid);
		mav.addObject("cabinet_id",  gresult.getReturnValue().getNetdiskCabinet());
		return mav;
	}
	
	/**
	 * Initial the netdisk page 
	 **/
	@RequestMapping("netdisk")
	public ModelAndView doNetdiskInitial(HttpServletRequest request){
		ModelAndView mav = getJspModelView("workgroup/netdisk");
		String wgid = super.readRequestParam("wgroup_id");
		
		Principal principal = super.getPrincipalFromShiro();
		AccessPoint accesspoint = super.getAccessPoint(request);
		
		InfoId<Long> wkey = IdKey.WORKGROUP.getInfoId(NumberUtils.toLong(wgid));
		GeneralResult<WorkgroupInfo> gresult = WorkgroupFacade.findWorkgroup(accesspoint, principal, wkey);
		
		mav.addObject("wgroup_id",  wgid);
		mav.addObject("cabinet_id",  gresult.getReturnValue().getNetdiskCabinet());
		return mav;
	}	
	
	@RequestMapping("netdisk-content")
	public ModelAndView doNetdiskContent(HttpServletRequest request){
		
		ModelAndView mav = super.getJsonModelView();
		List<CabinetItem> clist = new ArrayList<CabinetItem>();
		ActionResult actrst = new ActionResult();
		
		String cabinetId = super.readRequestParam("cabinet_id");
		String folderId = super.readRequestParam("folder_id");
		
		InfoId<Long> cabid = IdKey.CABINET.getInfoId(NumberUtils.toLong(cabinetId));
		InfoId<Long> folderid = IdKey.CAB_FOLDER.getInfoId(NumberUtils.toLong(folderId));
		
		Principal principal = super.getPrincipalFromShiro();
		AccessPoint accesspoint = super.getAccessPoint(request);
		
		//GeneralResult<List<CabFolderInfo>> fresult = CabinetFacade.findCabinetFolders(accesspoint, principal, cabid, folderid, "" );
		GeneralResult<PageWrapper<CabEntryInfo>> fresult = CabinetFacade.findCabinetEntries(accesspoint, principal, 
				cabid, folderid, "", new PageQuery(20,1) );
		
		List<CabEntryInfo> entries = fresult.getReturnValue().getRows();
		List<CabinetItem> items = new ArrayList<CabinetItem>();
		List<InfoId<Long>> ids = new ArrayList<InfoId<Long>>();
		for(int i = 0; i< entries.size() ; i++){
			CabinetItem item = new CabinetItem();
			CabEntryInfo entry = entries.get(i);
			
			item.setItemId(entry.getInfoId().getId());			
			item.setAccount(entry.getOwner());
			item.setDescription(entry.getDescription());
			item.setTimeElapse(toDuration(System.currentTimeMillis() - entry.getModifyDate().getTime(), principal.getLocale()));
			item.setExternalOwned(false);
			item.setClassification(entry.getClassification());
			item.setItemName(entry.getEntryName());
			item.setItemType(entry.isFolder()? Cabinets.EntryType.FOLDER.name():Cabinets.EntryType.FILE.name());
			
			if(entry.isFolder()){
				CabFolderInfo fldr = (CabFolderInfo)entry;
				ItemStat childstat = new ItemStat();
				childstat.setStatText(String.valueOf(fldr.getFileCount() + fldr.getFolderCount()));
				childstat.setStatTooltip( fldr.getFolderCount() +"Folders " + fldr.getFileCount() + "files" + fldr.getTotalSize() + " bytes");
				item.setChildStat(childstat);
				
				if(StringUtils.isNotBlank(fldr.getProfile())){
					
					item.setPropStat(new ItemStat());
				}
			}else{
				CabFileInfo file = (CabFileInfo)entry;
				ItemStat childstat = new ItemStat();
				childstat.setStatTooltip( file.getSize() + " bytes");
				item.setChildStat(childstat);
				
				ItemStat verstat = new ItemStat();
				verstat.setStatText(file.getVersion());
				verstat.setStatTooltip(file.getVersionLabel());
				item.setVersionStat(verstat);
				
				if(StringUtils.isNotBlank(file.getProfile())){
					
					item.setPropStat(new ItemStat());
				}
			}

			ids.add(entries.get(i).getInfoId());
			items.add(item);
		}
		// decorate tag information
		Map<InfoId<Long>, Set<TagInfo>> tagmap = CabinetFacade.findCabEntriesTags(accesspoint,
				principal, ids).getReturnValue();
		// set tags
		for(int i = 0; i< ids.size() ; i++){
			Set<TagInfo> tinfos = tagmap.get(ids.get(i));
			Set<Tag> tags = new HashSet<Tag>();
			for(TagInfo tinfo : tinfos){
				Tag tag = new Tag();
				tag.setCategory(tinfo.getCategory());
				tag.setTagColor(tinfo.getTagColor());
				tag.setTagName(tinfo.getTagName());
				tags.add(tag);
			}
			items.get(i).setTags(tags);
		}
		// decorate favorite summary
		Map<InfoId<Long>, Integer> favmap = CabinetFacade.findCabEntriesFavSummary(accesspoint,
				principal, ids).getReturnValue();
		for(int i = 0; i< ids.size() ; i++){
			Integer favsum = favmap.get(ids.get(i));
			ItemStat stat = new ItemStat();
			stat.setStatText(String.valueOf(favsum));
			stat.setStatTooltip(favsum + "People favorite");
			items.get(i).setFavoriteStat(stat);
		}
		actrst.setData(items);
		actrst.setState(ActionResult.SUCCESS);
		actrst.setMessage(fresult.getMessage());
		
		mav.addAllObjects(actrst.asMap());
		
		return mav;
	}

	private String toDuration(Long elapse, Locale locale){
		
		return DateTimeUtils.toDuration(elapse, TIMESTRINGS, locale);
	}
}
