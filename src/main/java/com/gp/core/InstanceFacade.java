package com.gp.core;

import java.util.List;
import java.util.Map;

import org.apache.commons.collections.keyvalue.DefaultKeyValue;
import org.apache.commons.lang.ArrayUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.gp.audit.AccessPoint;
import com.gp.common.IdKey;
import com.gp.common.Operations;
import com.gp.common.Principal;
import com.gp.common.ServiceContext;
import com.gp.common.GeneralContext.ExecState;
import com.gp.common.Instances.State;
import com.gp.exception.ServiceException;
import com.gp.info.InfoId;
import com.gp.info.InstanceInfo;
import com.gp.pagination.PageQuery;
import com.gp.pagination.PageWrapper;
import com.gp.svc.InstanceService;
import com.gp.validation.ValidationMessage;
import com.gp.validation.ValidationUtils;

@Component
public class InstanceFacade {

	static Logger LOGGER = LoggerFactory.getLogger(InstanceFacade.class);
	
	static InstanceService instanceservice;
	
	@Autowired
	private InstanceFacade(InstanceService instanceservice){
		InstanceFacade.instanceservice = instanceservice;
	}
	

	/**
	 * Get the local instance information 
	 **/
	public static GeneralResult<InstanceInfo> findInstance(AccessPoint accesspoint,
			Principal principal,
			InfoId<Integer> instanceid){

		GeneralResult<InstanceInfo> rst = new GeneralResult<InstanceInfo>();
		
		if(!InfoId.isValid(instanceid)){
			ValidationMessage noidmsg = new ValidationMessage("instance_id", "miss required instance id");
			rst.addMessage(noidmsg);
			rst.setReturnValue(null);
			rst.setMessage("fail to valid the message.", false);
			return rst;
		}
		
		try (ServiceContext<?> svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.FIND_INSTANCE)){
			
			svcctx.setAuditObject(instanceid);
			
			InstanceInfo iinfo = instanceservice.getInstnaceInfo(svcctx, instanceid);
			rst.setReturnValue(iinfo);
			rst.setMessage("success to find instance.", true);
		} catch (ServiceException e)  {
			LOGGER.error("Exception when find instance",e);
			ContextHelper.stampContext(e);
			rst.setMessage("fail to find instance.", false);
		}finally{
			
			ContextHelper.handleContext();
		}
		return rst;
	}
	
	public static GeneralResult<Boolean> changeInstanceState(AccessPoint accesspoint,
			Principal principal,
			InfoId<Integer> instance, State state){
		
		GeneralResult<Boolean> result = new GeneralResult<Boolean>();
		try (ServiceContext<?> svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.UPDATE_INSTANCE)){
			
			svcctx.setAuditObject(instance);
			svcctx.addAuditPredicates(new DefaultKeyValue("state", state.name()));
			
			Boolean success =  instanceservice.changeInstanceState(svcctx, instance, state);
			
			result.setReturnValue(success);			
			result.setMessage("success change instance state", true);
		} catch (ServiceException e)  {
			LOGGER.error("Fail change instance state",e);
			ContextHelper.stampContext(e);
			result.setMessage("fail change instance state", false);
		}finally{
			
			ContextHelper.handleContext();
		}
		return result;
	}
	
	public static GeneralResult<Boolean> saveInstance(AccessPoint accesspoint,
			Principal principal,
			InstanceInfo instance){
		
		GeneralResult<Boolean> result = new GeneralResult<Boolean>();
		
		if(!InfoId.isValid(instance.getInfoId())){
			ValidationMessage noidmsg = new ValidationMessage("instance_id", "miss required instance id");
			result.addMessage(noidmsg);
			result.setMessage("fail to valid the message.", false);
			result.setReturnValue(false);
			return result;
		}
		
		try (ServiceContext<?> svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.UPDATE_INSTANCE)){
			
			svcctx.setAuditObject(instance.getInfoId());
			svcctx.addAuditPredicates(instance);
			// check the validation of user information
			List<ValidationMessage> vmsg = ValidationUtils.validate(principal.getLocale(), instance);
			if(null != vmsg && vmsg.size() > 0){ // fail pass validation
				result.addMessages(vmsg);				
				svcctx.endAudit(ExecState.EXCEP, "row info validation fail");
				return result;
			}
			
			Boolean success =  instanceservice.saveInstnace(svcctx, instance);
			
			result.setReturnValue(success);			
			result.setMessage("success save instance ", true);
		} catch (ServiceException e)  {
			LOGGER.error("Fail query accounts",e);
			ContextHelper.stampContext(e);
			result.setMessage("fail save instance ", false);
		}finally{
			
			ContextHelper.handleContext();
		}
		return result;
	}

	public static GeneralResult<Boolean> saveExtInstance(AccessPoint accesspoint,
			Principal principal,
			InstanceInfo instance){
		
		GeneralResult<Boolean> result = new GeneralResult<Boolean>();
		
		try (ServiceContext<?> svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.NEW_EXT_INSTANCE)){
			
			InfoId<Integer> instanceId = IdGenerator.generateId(IdKey.INSTANCE, Integer.class);
			
			svcctx.setAuditObject(instanceId);
			svcctx.addAuditPredicates(instance);
			// check the validation of user information
			List<ValidationMessage> vmsg = ValidationUtils.validate(principal.getLocale(), instance);
			if(null != vmsg && vmsg.size() > 0){ // fail pass validation
				result.addMessages(vmsg);				
				svcctx.endAudit(ExecState.EXCEP, "row info validation fail");
				result.setMessage("Submitted data fail validation.", false);
				result.setReturnValue(false);
				return result;
			}
			instance.setInfoId(instanceId);
			Boolean success =  instanceservice.addExtInstnace(svcctx, instance);
			
			result.setReturnValue(success);			
			result.setMessage("success save external instance ", true);
		} catch (ServiceException e)  {
			LOGGER.error("Fail query accounts",e);
			ContextHelper.stampContext(e);
			result.setMessage("fail save external instance ", false);
		}finally{
			
			ContextHelper.handleContext();
		}
		return result;
	}
	
	public static GeneralResult<List<InstanceInfo>> findInstances(AccessPoint accesspoint,
			Principal principal,
			String instancename){
		
		GeneralResult<List<InstanceInfo>> result = new GeneralResult<List<InstanceInfo>>();
		
		try(ServiceContext<?> svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.FIND_INSTANCES)){
			
			String[][] parms = new String[][]{
				{"instancename",instancename}};				
			Map<?,?> parmap = ArrayUtils.toMap(parms);			
			svcctx.addAuditPredicates(parmap);
						
			// query accounts information
			List<InstanceInfo> pwrapper = instanceservice.getInstances(svcctx, instancename);
			
			result.setReturnValue(pwrapper);			
			result.setMessage("success get instances ", true);
		} catch (Exception e) {
			LOGGER.error("Fail query instances",e);
			ContextHelper.stampContext(e);
			result.setMessage("fail get instances ", false);
		}finally{
			
			ContextHelper.handleContext();
		}
		return result;
	}
	
	
	public static GeneralResult<PageWrapper<InstanceInfo>> findInstances(AccessPoint accesspoint,
			Principal principal,
			String instancename, PageQuery pquery){
		
		GeneralResult<PageWrapper<InstanceInfo>> result = new GeneralResult<PageWrapper<InstanceInfo>>();
		
		try(ServiceContext<?> svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.FIND_INSTANCES)){
			
			String[][] parms = new String[][]{
				{"instancename",instancename}};				
			Map<?,?> parmap = ArrayUtils.toMap(parms);			
			svcctx.addAuditPredicates(parmap);
						
			// query accounts information
			PageWrapper<InstanceInfo> pwrapper = instanceservice.getInstances(svcctx, instancename, pquery);
			
			result.setReturnValue(pwrapper);			
			result.setMessage("success get instances ", true);
		} catch (Exception e) {
			LOGGER.error("Fail query instances",e);
			ContextHelper.stampContext(e);
			result.setMessage("fail get instances ", false);
		}finally{
			
			ContextHelper.handleContext();
		}
		return result;
	}
}
