package com.gp.ga.sysinfo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gp.common.Principal;
import com.gp.core.InstanceFacade;
import com.gp.exception.CoreException;
import com.gp.info.SourceInfo;
import com.gp.pagination.PageQuery;
import com.gp.web.ActionResult;
import com.gp.web.BaseController;
import com.gp.web.CustomWebUtils;
import com.gp.web.model.Instance;

@Controller("ga-extern-ctlr")
@RequestMapping("/ga")
public class ExternInfoController extends BaseController{

	static Logger LOGGER = LoggerFactory.getLogger(ExternInfoController.class);

	@RequestMapping("ext-instance-search")
	public ModelAndView doExternInstanceSearch(HttpServletRequest request){

		if(LOGGER.isDebugEnabled())
			CustomWebUtils.dumpRequestAttributes(request);
		String name = request.getParameter("instanceName");
		PageQuery pq = new PageQuery(5,1);
		// read paging parameter
		readRequestData(request, pq);
		ActionResult result = new ActionResult();	
		List<Instance> list = new ArrayList<Instance>();
		Principal principal = super.getPrincipalFromShiro();

		try{
			List<SourceInfo> instances = InstanceFacade.findInstances(getAccessPoint(request), principal, name);
			//
			int cnt = 0;
			for(SourceInfo instinfo: instances){
				Instance data = new Instance();
				data.setAbbr(instinfo.getAbbr());
				data.setAdmin(instinfo.getAdmin());
				data.setBinaryUrl(instinfo.getBinaryUrl());
				data.setServiceUrl(instinfo.getServiceUrl());
				data.setDescription(instinfo.getDescription());
				data.setEmail(instinfo.getEmail());
				data.setEntityCode(instinfo.getEntityCode());
				data.setNodeCode(instinfo.getNodeCode());
				data.setShortName(instinfo.getShortName());
				data.setName(instinfo.getInstanceName());
				data.setInstanceId(instinfo.getInfoId().getId());
				data.setGlobalId("qwert"+cnt);
				cnt++;
				list.add(data);
			}
			result.setData(list);
			result.setState(ActionResult.SUCCESS);
			result.setMessage(getMessage("mesg.find.instance"));
		}catch(CoreException ce){
			result.setState(ActionResult.ERROR);
			result.setMessage(ce.getMessage());
			result.setDetailmsgs(ce.getValidateMessages());
		}
		
		ModelAndView mav = getJsonModelView();		
		mav.addAllObjects(result.asMap());

		return mav;		
	}
	
	@RequestMapping("ext-instance-info")
	public ModelAndView doGetExternInstance(HttpServletRequest request){
		
		if(LOGGER.isDebugEnabled())
			CustomWebUtils.dumpRequestAttributes(request);
		
		String globalId = request.getParameter("globalId");
		ActionResult rst = new ActionResult();
		
		Instance data = new Instance();
		data.setAbbr("ABB1");
		data.setAdmin("admin1");
		data.setBinaryUrl("http://sdlfkj:8090/s");
		data.setServiceUrl("http://sdlfkj:8090/s");
		data.setDescription("this a fake description");
		data.setEmail("sddf@13.com");
		data.setEntityCode("E0010");
		data.setNodeCode("N0011");
		data.setShortName("简称001");
		data.setName("测试外部实例");

		data.setGlobalId(globalId);
		
		rst.setState(ActionResult.SUCCESS);
		rst.setMessage("取得外部实例成功");
		rst.setData(data);
		
		ModelAndView mav = getJsonModelView();		
		mav.addAllObjects(rst.asMap());

		return mav;	
	}
}
