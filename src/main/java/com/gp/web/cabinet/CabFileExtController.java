package com.gp.web.cabinet;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.math.NumberUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gp.audit.AccessPoint;
import com.gp.common.IdKey;
import com.gp.common.Principal;
import com.gp.core.CabinetFacade;
import com.gp.core.GeneralResult;
import com.gp.info.CabVersionInfo;
import com.gp.info.InfoId;
import com.gp.web.ActionResult;
import com.gp.web.BaseController;
import com.gp.web.model.Version;

@Controller("cab-file-ext-ctrl")
@RequestMapping("/cabinet")
public class CabFileExtController extends BaseController{
	
	@RequestMapping("tag-search")
	public ModelAndView doTagSearch(HttpServletRequest request){
		return null;
		
	}
	
	@RequestMapping("tag-attach")
	public ModelAndView doTagAttach(HttpServletRequest request){
		return null;
		
	}
	
	@RequestMapping("tag-detach")
	public ModelAndView doTagDetach(HttpServletRequest request){
		return null;
		
	}
	
	@RequestMapping("file-version")
	public ModelAndView doVersionSearch(HttpServletRequest request){
		
		ModelAndView  mav = super.getJspModelView("dialog/version-list");
		
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
