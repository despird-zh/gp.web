package com.gp.web.workgroup;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.math.NumberUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gp.audit.AccessPoint;
import com.gp.common.IdKey;
import com.gp.common.Measures;
import com.gp.common.Principal;
import com.gp.core.GeneralResult;
import com.gp.core.MeasureFacade;
import com.gp.info.MeasureInfo;
import com.gp.web.ActionResult;
import com.gp.web.BaseController;
import com.gp.web.model.WGroupSummary;

@Controller("wg-meta-ctrl")
@RequestMapping("/workgroup")
public class MetaController extends BaseController{

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
			
			wsum.setSumDocs(NumberUtils.toInt(minfo.getColValue(Measures.WG_MEAS_DOC), 0));
			wsum.setSumExtMbrs(NumberUtils.toInt(minfo.getColValue(Measures.WG_MEAS_EXT_MBR), 0));
			wsum.setSumMembers(NumberUtils.toInt(minfo.getColValue(Measures.WG_MEAS_MEMBER), 0));
			wsum.setSumSubGroups(NumberUtils.toInt(minfo.getColValue(Measures.WG_MEAS_SUB_GRP), 0));
			wsum.setSumTopics(NumberUtils.toInt(minfo.getColValue(Measures.WG_MEAS_TOPIC), 0));
			
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

}
