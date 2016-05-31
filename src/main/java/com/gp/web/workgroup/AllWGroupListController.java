package com.gp.web.workgroup;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.keyvalue.DefaultKeyValue;
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
import com.gp.core.GeneralResult;
import com.gp.core.InstanceFacade;
import com.gp.core.WorkgroupFacade;
import com.gp.ga.workgroup.WorkgroupAddController;
import com.gp.info.InstanceInfo;
import com.gp.info.WorkgroupLiteInfo;
import com.gp.pagination.PageQuery;
import com.gp.pagination.PageWrapper;
import com.gp.pagination.PaginationInfo;
import com.gp.util.DateTimeUtils;
import com.gp.web.BaseController;
import com.gp.web.model.Workgroup;

@Controller("wg-all-list-ctrl")
@RequestMapping("/workgroup")
public class AllWGroupListController extends BaseController{

	static Logger LOGGER = LoggerFactory.getLogger(AllWGroupListController.class);
	
	static String ImagePath = GeneralConfig.getString(SystemOptions.IMAGE_CACHE_PATH);
	
	@RequestMapping("all-list")
	public ModelAndView doGridInitial(HttpServletRequest request) throws UnsupportedEncodingException{

		ModelAndView mav = getJspModelView("workgroup/all-list");		
		
		PageQuery pquery = new PageQuery(12,1);
		this.readRequestData(request, pquery);
		
		Principal principal = super.getPrincipalFromShiro();
		AccessPoint accesspoint = super.getAccessPoint(request);
		
		GeneralResult<PageWrapper<WorkgroupLiteInfo>> gresult = WorkgroupFacade.findLocalWorkgroups(accesspoint, principal, "", null, pquery);
		List<Workgroup> wgroups = new ArrayList<Workgroup>();
		Boolean hasMore = false;
		Integer nextPage = -1;
		if(gresult.isSuccess() && gresult.getReturnValue().getRows() != null){
			
			for(WorkgroupLiteInfo winfo : gresult.getReturnValue().getRows()){
				
				Workgroup wgroup = new Workgroup();
				wgroup.setWorkgroupId(winfo.getInfoId().getId());
				wgroup.setWorkgroupName(winfo.getWorkgroupName());
				wgroup.setAdmin(winfo.getAdmin());
				wgroup.setAdminName(winfo.getAdminName());
				wgroup.setDescription(winfo.getDescription());
				String imagePath = "../" + ImagePath + "/" + Images.getImgFileName(
						winfo.getImageTouch(), winfo.getAvatarId(), winfo.getImageExt());
				
				wgroup.setImagePath(imagePath);
				wgroup.setState(winfo.getState());
				wgroup.setDescription(winfo.getDescription());
				wgroup.setCreateDate(DateTimeUtils.toYearMonthDay(winfo.getCreateDate()));
				wgroups.add(wgroup);
			}
			
			PaginationInfo pginfo = gresult.getReturnValue().getPagination();
			hasMore = pginfo.getNext();
			nextPage = pginfo.getNextPage();
		}
		
		mav.addObject("wgroups", wgroups);
		mav.addObject("hasMore", hasMore);
		mav.addObject("nextPage", nextPage);
		mav.addObject("wgroup_name", "");
		
		mav.addObject("tags", "");
		
		return mav;
	}
	
	
	@RequestMapping("all-list-next")
	public ModelAndView doGridNextLoad(HttpServletRequest request) throws UnsupportedEncodingException{
		
		String pidxstr = this.readRequestParam("pageNumber");
		int pidx = Integer.valueOf(pidxstr);
		PageQuery pquery = new PageQuery(12,1);
		pquery.setPageNumber(pidx);
		ModelAndView mav = getJspModelView("workgroup/all-list-next");
		String wgroup_name = super.readRequestParam("wgroup_name");
		wgroup_name = StringUtils.isBlank(wgroup_name)?"":UriUtils.decode(wgroup_name, "UTF-8");
		
		String[] tags = request.getParameterValues("tags");
		List<String> taglist = (null == tags) ? null : Arrays.asList(tags);
		
		Principal principal = super.getPrincipalFromShiro();
		AccessPoint accesspoint = super.getAccessPoint(request);
		
		GeneralResult<PageWrapper<WorkgroupLiteInfo>> gresult = WorkgroupFacade.findLocalWorkgroups(accesspoint, principal, wgroup_name, taglist, pquery);
		List<Workgroup> wgroups = new ArrayList<Workgroup>();
		Boolean hasMore = false;
		Integer nextPage = -1;
		if(gresult.isSuccess() && gresult.getReturnValue().getRows() != null){
			
			for(WorkgroupLiteInfo winfo : gresult.getReturnValue().getRows()){
				
				Workgroup wgroup = new Workgroup();
				wgroup.setWorkgroupId(winfo.getInfoId().getId());
				wgroup.setWorkgroupName(winfo.getWorkgroupName());
				wgroup.setAdmin(winfo.getAdmin());
				wgroup.setAdminName(winfo.getAdminName());
				wgroup.setDescription(winfo.getDescription());
				String imagePath = "../" + ImagePath + "/" + Images.getImgFileName(
						winfo.getImageTouch(), winfo.getAvatarId(), winfo.getImageExt());
				
				wgroup.setImagePath(imagePath);
				wgroup.setState(winfo.getState());
				wgroup.setDescription(winfo.getDescription());
				wgroup.setCreateDate(DateTimeUtils.toYearMonthDay(winfo.getCreateDate()));
				wgroups.add(wgroup);
			}
			
			PaginationInfo pginfo = gresult.getReturnValue().getPagination();
			hasMore = pginfo.getNext();
			nextPage = pginfo.getNextPage();
		}
		
		mav.addObject("wgroups", wgroups);
		mav.addObject("hasMore", hasMore);
		mav.addObject("nextPage", nextPage);
		mav.addObject("wgroup_name", UriUtils.encode(UriUtils.encode(wgroup_name, "UTF-8"), "UTF-8"));
		
		mav.addObject("tags", weaveParameters("tags", tags));

		return mav;
	}

}
