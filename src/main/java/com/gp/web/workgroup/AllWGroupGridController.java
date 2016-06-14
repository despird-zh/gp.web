package com.gp.web.workgroup;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.UriUtils;

import com.gp.audit.AccessPoint;
import com.gp.common.GeneralConfig;
import com.gp.common.Images;
import com.gp.common.Principal;
import com.gp.common.SystemOptions;
import com.gp.core.WorkgroupFacade;
import com.gp.exception.CoreException;
import com.gp.info.CombineInfo;
import com.gp.info.WorkgroupInfo;
import com.gp.pagination.PageQuery;
import com.gp.pagination.PageWrapper;
import com.gp.pagination.PaginationInfo;
import com.gp.svc.info.WorkgroupLite;
import com.gp.util.DateTimeUtils;
import com.gp.web.BaseController;
import com.gp.web.model.Workgroup;

@Controller("wg-all-grid-ctrl")
@RequestMapping("/workgroup")
public class AllWGroupGridController extends BaseController{

	static Logger LOGGER = LoggerFactory.getLogger(AllWGroupGridController.class);
	
	static String ImagePath = GeneralConfig.getString(SystemOptions.IMAGE_CACHE_PATH);
	
	@RequestMapping("all-grid")
	public ModelAndView doGridInitial(HttpServletRequest request) throws UnsupportedEncodingException{

		ModelAndView mav = getJspModelView("workgroup/all-grid");		
		
		PageQuery pquery = new PageQuery(12,1);
		this.readRequestData(request, pquery);
		
		Principal principal = super.getPrincipalFromShiro();
		AccessPoint accesspoint = super.getAccessPoint(request);
		
		
		List<Workgroup> wgroups = new ArrayList<Workgroup>();
		Boolean hasMore = false;
		Integer nextPage = -1;
		try{
			PageWrapper<CombineInfo<WorkgroupInfo,WorkgroupLite>> gresult = WorkgroupFacade.findLocalWorkgroups(accesspoint, principal, "", null, pquery);
			for(CombineInfo<WorkgroupInfo,WorkgroupLite> winfo : gresult.getRows()){
				
				Workgroup wgroup = new Workgroup();
				wgroup.setWorkgroupId(winfo.getPrimary().getInfoId().getId());
				wgroup.setWorkgroupName(winfo.getPrimary().getWorkgroupName());
				wgroup.setAdmin(winfo.getPrimary().getAdmin());
				wgroup.setAdminName(winfo.getExtended().getAdminName());
				wgroup.setDescription(winfo.getPrimary().getDescription());
				String imagePath = "../" + ImagePath + "/" + Images.getImgFileName(
						winfo.getExtended().getImageTouch(), winfo.getPrimary().getAvatarId(), winfo.getExtended().getImageExt());
				
				wgroup.setImagePath(imagePath);
				wgroup.setState(winfo.getPrimary().getState());
				wgroup.setDescription(winfo.getPrimary().getDescription());
				wgroup.setCreateDate(DateTimeUtils.toYearMonthDay(winfo.getPrimary().getCreateDate()));
				wgroups.add(wgroup);
			}
			
			PaginationInfo pginfo = gresult.getPagination();
			hasMore = pginfo.getNext();
			nextPage = pginfo.getNextPage();
		}catch(CoreException ce){
			//
		}
		
		mav.addObject("wgroups", wgroups);
		mav.addObject("hasMore", hasMore);
		mav.addObject("nextPage", nextPage);
		mav.addObject("wgroup_name", "");
		
		mav.addObject("tags", "");
		
		return mav;
	}
	
	
	@RequestMapping("all-grid-next")
	public ModelAndView doGridNextLoad(HttpServletRequest request) throws UnsupportedEncodingException{
		
		String pidxstr = this.readRequestParam("pageNumber");
		int pidx = Integer.valueOf(pidxstr);
		PageQuery pquery = new PageQuery(12,1);
		pquery.setPageNumber(pidx);
		ModelAndView mav = getJspModelView("workgroup/all-grid-next");
		String wgroup_name = super.readRequestParam("wgroup_name");
		wgroup_name = StringUtils.isBlank(wgroup_name)?"":UriUtils.decode(wgroup_name, "UTF-8");
		
		String[] tags = request.getParameterValues("tags");
		List<String> taglist = (null == tags) ? null : Arrays.asList(tags);
		
		Principal principal = super.getPrincipalFromShiro();
		AccessPoint accesspoint = super.getAccessPoint(request);

		List<Workgroup> wgroups = new ArrayList<Workgroup>();
		Boolean hasMore = false;
		Integer nextPage = -1;
		try{
			PageWrapper<CombineInfo<WorkgroupInfo,WorkgroupLite>> gresult = WorkgroupFacade.findLocalWorkgroups(accesspoint, principal, wgroup_name, taglist, pquery);
			for(CombineInfo<WorkgroupInfo,WorkgroupLite> winfo : gresult.getRows()){
				
				Workgroup wgroup = new Workgroup();
				wgroup.setWorkgroupId(winfo.getPrimary().getInfoId().getId());
				wgroup.setWorkgroupName(winfo.getPrimary().getWorkgroupName());
				wgroup.setAdmin(winfo.getPrimary().getAdmin());
				wgroup.setAdminName(winfo.getExtended().getAdminName());
				wgroup.setDescription(winfo.getPrimary().getDescription());
				String imagePath = "../" + ImagePath + "/" + Images.getImgFileName(
						winfo.getExtended().getImageTouch(), winfo.getPrimary().getAvatarId(), winfo.getExtended().getImageExt());
				
				wgroup.setImagePath(imagePath);
				wgroup.setState(winfo.getPrimary().getState());
				wgroup.setDescription(winfo.getPrimary().getDescription());
				wgroup.setCreateDate(DateTimeUtils.toYearMonthDay(winfo.getPrimary().getCreateDate()));
				wgroups.add(wgroup);
			}
			
			PaginationInfo pginfo = gresult.getPagination();
			hasMore = pginfo.getNext();
			nextPage = pginfo.getNextPage();
		}catch(CoreException ce){
			//
		}
		
		mav.addObject("wgroups", wgroups);
		mav.addObject("hasMore", hasMore);
		mav.addObject("nextPage", nextPage);
		mav.addObject("wgroup_name", UriUtils.encode(UriUtils.encode(wgroup_name, "UTF-8"), "UTF-8"));
		
		mav.addObject("tags", weaveParameters("tags", tags));

		return mav;
	}
	
	@RequestMapping("all-hier")
	public ModelAndView doHierInitial(){
		
		return getJspModelView("workgroup/all-hier");
	}

}
