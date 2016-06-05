package com.gp.web.cabinet;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.CollectionUtils;
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
import com.gp.info.CabFileInfo;
import com.gp.info.CabFolderInfo;
import com.gp.info.CabVersionInfo;
import com.gp.info.InfoId;
import com.gp.web.ActionResult;
import com.gp.web.BaseController;
import com.gp.web.model.Version;

@Controller("cab-entry-ext-ctrl")
@RequestMapping("/cabinet")
public class CabEntryExtController extends BaseController{
	
	@RequestMapping("entry-tags")
	public ModelAndView doFileTagSearch(HttpServletRequest request){
		
		ModelAndView  mav = super.getJspModelView("dialog/entry-tags");
		
		return mav;
	}
	
	@RequestMapping("tag-attach")
	public ModelAndView doTagAttach(HttpServletRequest request){
		return null;
		
	}
	
	@RequestMapping("tag-detach")
	public ModelAndView doTagDetach(HttpServletRequest request){
		return null;
		
	}
	
	@RequestMapping("entry-properties")
	public ModelAndView doPropertySearch(HttpServletRequest request){
		
		ModelAndView  mav = super.getJspModelView("dialog/entry-properties");
		Long entryid = NumberUtils.toLong(readRequestParam("entry_id"));
		String entryType = readRequestParam("entry_type");
		
		Principal principal = super.getPrincipalFromShiro();
		AccessPoint accesspoint = super.getAccessPoint(request);
		Map<String, Object> propmap = null;
		
		if(Cabinets.EntryType.FOLDER.name().equals(entryType)){
			
			InfoId<Long> folderid = IdKey.CAB_FOLDER.getInfoId(entryid);
			GeneralResult<CabFolderInfo> result = CabinetFacade.findCabinetFolder(accesspoint, principal, folderid);
			CabFolderInfo finfo = result.getReturnValue();
			String propstr = finfo.getProperties();
			propmap = Cabinets.toPropertyMap(propstr);
			
		}else if(Cabinets.EntryType.FILE.name().equals(entryType)){
			
			InfoId<Long> fileid = IdKey.CAB_FILE.getInfoId(entryid);
			GeneralResult<CabFileInfo> result = CabinetFacade.findCabinetFile(accesspoint, principal, fileid);
			CabFileInfo finfo = result.getReturnValue();
			String propstr = finfo.getProperties();
			propmap = Cabinets.toPropertyMap(propstr);
			
		}
		
		mav.addObject("propmap", propmap);
		
		return mav;
		
	}
	
	@RequestMapping("file-versions")
	public ModelAndView doVersionSearch(HttpServletRequest request){
		
		ModelAndView  mav = super.getJspModelView("dialog/file-versions");
		
		ActionResult aresult = new ActionResult();
		Principal principal = super.getPrincipalFromShiro();
		AccessPoint accesspoint = super.getAccessPoint(request);
		Long fid = NumberUtils.toLong(readRequestParam("file_id"));
		InfoId<Long> fileid = IdKey.CAB_FILE.getInfoId(fid);
		
		GeneralResult<List<CabVersionInfo>> gresult = CabinetFacade.findCabinetVersions(accesspoint, 
				principal, 
				fileid);
		
		if(gresult.isSuccess()){
			List<Version> nlist = new ArrayList<Version>();
			List<CabVersionInfo> olist = gresult.getReturnValue();
			if(CollectionUtils.isNotEmpty(olist)){
				for(CabVersionInfo vinfo : olist){
					
					Version v = new Version();
					v.setVersion(vinfo.getVersion());
					v.setAuthor(vinfo.getCreator());
					v.setVersionLabel(vinfo.getVersionLabel());
					v.setDescription(vinfo.getDescription());
					nlist.add(v);
				}
			}
			aresult.setData(nlist);
			aresult.setState(ActionResult.SUCCESS);
			aresult.setMessage(gresult.getMessage());
		}else{
			
			aresult.setState(ActionResult.FAIL);
			aresult.setMessage(gresult.getMessage());
		}
		
		return mav.addAllObjects(aresult.asMap());
		
	}
}
