package com.gp.web.common;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gp.audit.AccessPoint;
import com.gp.common.Principal;
import com.gp.exception.CoreException;
import com.gp.web.ActionResult;
import com.gp.web.BaseController;

@Controller("comm-workgroup-ctlr")
@RequestMapping("/common")
public class WorkgroupController extends BaseController{

	static Logger LOGGER = LoggerFactory.getLogger(WorkgroupController.class);
	
	@RequestMapping("workgroup-summary")
	public ModelAndView doWGroupSummarySearch(HttpServletRequest request){
	
		ModelAndView mav = super.getJsonModelView();
		ActionResult result = new ActionResult();
		
		Principal principal = super.getPrincipalFromShiro();
		AccessPoint accesspoint = super.getAccessPoint(request);
		
/*		try{
			
		}catch(CoreException ce){
			
			result.setState(ActionResult.FAIL);
			result.setMessage(ce.getMessage());
		}*/
		
		mav.addAllObjects(result.asMap());
		return mav;
		
	}
}
