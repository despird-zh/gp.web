package com.gp.ga.sysinfo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gp.audit.AccessPoint;
import com.gp.common.IdKey;
import com.gp.common.Instances.State;
import com.gp.common.Principal;
import com.gp.core.GeneralResult;
import com.gp.core.InstanceFacade;
import com.gp.info.InfoId;
import com.gp.info.InstanceInfo;
import com.gp.util.CommonUtils;
import com.gp.web.ActionResult;
import com.gp.web.BaseController;
import com.gp.web.CustomWebUtils;
import com.gp.web.model.Instance;

@Controller("ga-base-ctlr")
@RequestMapping("/ga")
public class BasicInfoController extends BaseController{

	static Logger LOGGER = LoggerFactory.getLogger(BasicInfoController.class);
	
	@RequestMapping("basic")
	public ModelAndView doInitial(){
		
		return getJspModelView("ga/sysinfo/basicinfo");
	}
	
	@RequestMapping("instance-info")
	public ModelAndView doGetInstance(HttpServletRequest request){
		
		if(LOGGER.isDebugEnabled())
			CustomWebUtils.dumpRequestAttributes(request);
		
		String instanceId = request.getParameter("instanceid");
		
		ModelAndView mav = super.getJsonModelView();
		ActionResult rst = new ActionResult();

		if(StringUtils.isBlank(instanceId)){
			rst.setState(ActionResult.ERROR);
			rst.setMessage("parameter [instanceid] is required.");
		}
		else if(!CommonUtils.isNumeric(instanceId)){
			rst.setState(ActionResult.ERROR);
			rst.setMessage("parameter [instanceid] must be number.");
		}else{
			Principal princ = super.getPrincipalFromShiro();
			AccessPoint ap = super.getAccessPoint(request);
			
			InfoId<Integer> id = IdKey.INSTANCE.getInfoId(Integer.valueOf(instanceId));
			InstanceInfo instinfo ;
			GeneralResult<InstanceInfo> gresult = InstanceFacade.findInstance(ap, princ, id);
			instinfo = gresult.getReturnValue();
			if(!gresult.isSuccess() || instinfo == null){
				
				rst.setState(ActionResult.ERROR);
				rst.setMessage(gresult.getMessage());
			}else{
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
				data.setGlobalId(instinfo.getHashKey());
				rst.setData(data);
				rst.setMessage(gresult.getMessage());
			}				
		}
	
		mav.addAllObjects(rst.asMap());
		return mav;
	}
	
	@RequestMapping("instance-change-state")
	public ModelAndView doChangeInstanceState(HttpServletRequest request){

		ModelAndView mav = super.getJsonModelView();
		ActionResult rst = new ActionResult();
		String instanceIdStr = request.getParameter("instance_id");
		String stateStr = request.getParameter("instance_state");
		Integer instanceId = StringUtils.isBlank(instanceIdStr) ? -1 : Integer.valueOf(instanceIdStr);
		InfoId<Integer> id = IdKey.INSTANCE.getInfoId(instanceId);
		
		Principal princ = super.getPrincipalFromShiro();
		AccessPoint ap = super.getAccessPoint(request);
		
		GeneralResult<Boolean> grst = InstanceFacade.changeInstanceState(ap, princ, id, State.valueOf(stateStr));
		if(!grst.isSuccess() || !grst.getReturnValue()){
			rst.setState(ActionResult.ERROR);
			rst.setMessage(grst.getMessage());
			rst.setDetailmsgs(grst.getMessages());
		}else{
			
			rst.setState(ActionResult.SUCCESS);
			rst.setMessage(grst.getMessage());
		}
		
		mav.addAllObjects(rst.asMap());
		return mav;
	}
	
	@RequestMapping("ext-instance-save")
	public ModelAndView doSaveExtInstance(HttpServletRequest request){

		Instance data = new Instance();
		ModelAndView mav = super.getJsonModelView();
		ActionResult rst = new ActionResult();
		// read request parameters
		super.readRequestData(request, data);

		Principal princ = super.getPrincipalFromShiro();
		AccessPoint ap = super.getAccessPoint(request);
		
		InstanceInfo instinfo = new InstanceInfo();
		instinfo.setAbbr(data.getAbbr());
		instinfo.setAdmin(data.getAdmin());
		instinfo.setBinaryUrl(data.getBinaryUrl());
		instinfo.setServiceUrl(data.getServiceUrl());
		instinfo.setDescription(data.getDescription());
		instinfo.setEmail(data.getEmail());
		instinfo.setEntityCode(data.getEntityCode());
		instinfo.setNodeCode(data.getNodeCode());
		instinfo.setShortName(data.getShortName());
		instinfo.setInstanceName(data.getName());
		instinfo.setHashKey(data.getGlobalId());

		GeneralResult<Boolean> grst = InstanceFacade.saveExtInstance(ap, princ, instinfo);
		if(!grst.isSuccess() || !grst.getReturnValue()){
			rst.setState(ActionResult.ERROR);
			rst.setMessage(grst.getMessage());
			rst.setDetailmsgs(grst.getMessages());
		}else{
			
			rst.setState(ActionResult.SUCCESS);
			rst.setMessage(grst.getMessage());
		}
		
		mav.addAllObjects(rst.asMap());
		return mav;
	}
	
	@RequestMapping("instance-save")
	public ModelAndView doSaveInstance(HttpServletRequest request){

		Instance data = new Instance();
		ModelAndView mav = super.getJsonModelView();
		ActionResult rst = new ActionResult();
		// read request parameters
		super.readRequestData(request, data);

		InfoId<Integer> id = IdKey.INSTANCE.getInfoId(data.getInstanceId());
		
		Principal princ = super.getPrincipalFromShiro();
		AccessPoint ap = super.getAccessPoint(request);
		
		InstanceInfo instinfo = new InstanceInfo();
		instinfo.setInfoId(id);
		instinfo.setAbbr(data.getAbbr());
		instinfo.setAdmin(data.getAdmin());
		instinfo.setBinaryUrl(data.getBinaryUrl());
		instinfo.setServiceUrl(data.getServiceUrl());
		instinfo.setDescription(data.getDescription());
		instinfo.setEmail(data.getEmail());
		instinfo.setEntityCode(data.getEntityCode());
		instinfo.setNodeCode(data.getNodeCode());
		instinfo.setShortName(data.getShortName());
		instinfo.setInstanceName(data.getName());
		instinfo.setHashKey(data.getGlobalId());

		GeneralResult<Boolean> grst = InstanceFacade.saveInstance(ap, princ, instinfo);
		if(!grst.isSuccess() || !grst.getReturnValue()){
			rst.setState(ActionResult.ERROR);
			rst.setMessage(grst.getMessage());
			rst.setDetailmsgs(grst.getMessages());
		}else{
			
			rst.setState(ActionResult.SUCCESS);
			rst.setMessage(grst.getMessage());
		}
		
		mav.addAllObjects(rst.asMap());
		return mav;
	}
	
	@RequestMapping("instance-search")
	ModelAndView doSearchInstance(HttpServletRequest request){
		
		if(LOGGER.isDebugEnabled())
			CustomWebUtils.dumpRequestAttributes(request);
		String name = request.getParameter("instanceName");

		List<Instance> list = new ArrayList<Instance>();
		Principal principal = super.getPrincipalFromShiro();
		Map<String,Object> pagedata = new HashMap<String,Object>();

		GeneralResult<List<InstanceInfo>> gresult = InstanceFacade.findInstances(getAccessPoint(request), principal, name);
		if(gresult.isSuccess()){
			List<InstanceInfo> instances = gresult.getReturnValue();
			for(InstanceInfo instinfo: instances){
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
				data.setGlobalId(instinfo.getHashKey());
				data.setState(instinfo.getState());
				list.add(data);
			}
			pagedata.put(MODEL_KEY_STATE, ActionResult.SUCCESS);
			pagedata.put(MODEL_KEY_MESSAGE, gresult.getMessage());
			pagedata.put(MODEL_KEY_ROWS, list);
		}else{
			pagedata.put(MODEL_KEY_STATE, ActionResult.ERROR);
			pagedata.put(MODEL_KEY_MESSAGE, gresult.getMessage());
		}
		ModelAndView mav = getJsonModelView();		
		mav.addAllObjects(pagedata);

		return mav;		
	}
}
