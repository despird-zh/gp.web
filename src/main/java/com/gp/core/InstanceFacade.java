package com.gp.core;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.collections.CollectionUtils;
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
import com.gp.common.Instances.State;
import com.gp.exception.CoreException;
import com.gp.exception.ServiceException;
import com.gp.info.InfoId;
import com.gp.info.InstanceInfo;
import com.gp.pagination.PageQuery;
import com.gp.pagination.PageWrapper;
import com.gp.svc.InstanceService;
import com.gp.validate.ValidateMessage;
import com.gp.validate.ValidateUtils;

@Component
public class InstanceFacade {

	static Logger LOGGER = LoggerFactory.getLogger(InstanceFacade.class);
	
	private static InstanceService instanceservice;
	
	@Autowired
	private InstanceFacade(InstanceService instanceservice){
		InstanceFacade.instanceservice = instanceservice;
	}
	

	/**
	 * Get the local instance information 
	 **/
	public static InstanceInfo findInstance(AccessPoint accesspoint,
			Principal principal,
			InfoId<Integer> instanceid) throws CoreException{

		InstanceInfo rst = null;
		
		if(!InfoId.isValid(instanceid)){
			CoreException cexcp = new CoreException(principal.getLocale(), "excp.find.instance");
			cexcp.addValidateMessage("prop.instanceid", "mesg.prop.miss");
			throw cexcp;
		}
		
		try (ServiceContext svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.FIND_INSTANCE)){
			
			svcctx.setAuditObject(instanceid);
			
			rst = instanceservice.getInstnaceInfo(svcctx, instanceid);
		} catch (ServiceException e)  {
			ContextHelper.stampContext(e, "excp.find.instance");
		}finally{
			ContextHelper.handleContext();
		}
		return rst;
	}
	
	public static Boolean changeInstanceState(AccessPoint accesspoint,
			Principal principal,
			InfoId<Integer> instance, State state)throws CoreException{
		
		Boolean result = false;
		try (ServiceContext svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.UPDATE_INSTANCE)){
			
			svcctx.setAuditObject(instance);
			svcctx.addAuditPredicates(new DefaultKeyValue("state", state.name()));
			
			result =  instanceservice.changeInstanceState(svcctx, instance, state);

		} catch (ServiceException e)  {
			ContextHelper.stampContext(e, "excp.update.instance");
		}finally{
			
			ContextHelper.handleContext();
		}
		return result;
	}
	
	public static Boolean saveInstance(AccessPoint accesspoint,
			Principal principal,
			InstanceInfo instance)throws CoreException{
		
		Boolean result = false;
		if(!InfoId.isValid(instance.getInfoId())){
			CoreException cexcp = new CoreException(principal.getLocale(), "excp.save.instance");
			cexcp.addValidateMessage("prop.instanceid", "mesg.prop.miss");
			throw cexcp;
		}
		
		try (ServiceContext svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.UPDATE_INSTANCE)){
			
			svcctx.setAuditObject(instance.getInfoId());
			svcctx.addAuditPredicates(instance);
			// check the validation of user information
			Set<ValidateMessage> vmsg = ValidateUtils.validate(principal.getLocale(), instance);
			if(!CollectionUtils.isEmpty(vmsg)){ // fail pass validation
				CoreException cexcp = new CoreException(principal.getLocale(), "excp.validate");
				cexcp.addValidateMessages(vmsg);
				throw cexcp;
			}
			result =  instanceservice.saveInstnace(svcctx, instance);
		} catch (ServiceException e)  {
			ContextHelper.stampContext(e , "excp.save.instance");
		}finally{
			ContextHelper.handleContext();
		}
		return result;
	}

	public static Boolean saveExtInstance(AccessPoint accesspoint,
			Principal principal,
			InstanceInfo instance)throws CoreException{
		
		Boolean result = false;
		
		try (ServiceContext svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.NEW_EXT_INSTANCE)){
			
			InfoId<Integer> instanceId = CommonFacade.generateId(IdKey.INSTANCE, Integer.class);
			
			svcctx.setAuditObject(instanceId);
			svcctx.addAuditPredicates(instance);
			// check the validation of user information
			Set<ValidateMessage> vmsg = ValidateUtils.validate(principal.getLocale(), instance);
			if(null != vmsg && vmsg.size() > 0){ // fail pass validation
				CoreException cexcp = new CoreException(principal.getLocale(), "excp.validate");
				cexcp.addValidateMessages(vmsg);
				throw cexcp;
			}
			instance.setInfoId(instanceId);
			result =  instanceservice.addExtInstnace(svcctx, instance);
			
		} catch (ServiceException e)  {
			ContextHelper.stampContext(e, "excp.save.instance");
		}finally{
			
			ContextHelper.handleContext();
		}
		return result;
	}
	
	public static List<InstanceInfo> findInstances(AccessPoint accesspoint,
			Principal principal,
			String instancename)throws CoreException{
		
		List<InstanceInfo> result = null;
		
		try(ServiceContext svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.FIND_INSTANCES)){
			
			String[][] parms = new String[][]{
				{"instancename",instancename}};				
			Map<?,?> parmap = ArrayUtils.toMap(parms);			
			svcctx.addAuditPredicates(parmap);
						
			// query accounts information
			result = instanceservice.getInstances(svcctx, instancename);
			
		} catch (Exception e) {
			ContextHelper.stampContext(e,"excp.find.instance");
		}finally{
			ContextHelper.handleContext();
		}
		return result;
	}
	
	
	public static PageWrapper<InstanceInfo> findInstances(AccessPoint accesspoint,
			Principal principal,
			String instancename, PageQuery pquery)throws CoreException{
		
		PageWrapper<InstanceInfo> result = null;
		
		try(ServiceContext svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.FIND_INSTANCES)){
			
			String[][] parms = new String[][]{
				{"instancename",instancename}};				
			Map<?,?> parmap = ArrayUtils.toMap(parms);			
			svcctx.addAuditPredicates(parmap);
						
			// query accounts information
			result = instanceservice.getInstances(svcctx, instancename, pquery);
			
		} catch (Exception e) {
			ContextHelper.stampContext(e,"excp.find.instance");
		}finally{
			
			ContextHelper.handleContext();
		}
		return result;
	}
	
	public static Map<String,InstanceInfo> findInstances(AccessPoint accesspoint,
			Principal principal,
			List<String> accounts)throws CoreException{
		
		Map<String,InstanceInfo> result = null;
		
		if(CollectionUtils.isEmpty(accounts)){
			throw new CoreException(principal.getLocale(),"mesg.account.miss");
		}
		
		try(ServiceContext svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.FIND_INSTANCES)){
						
			// query accounts information
			result = instanceservice.getAccountSources(svcctx, accounts);
			
		} catch (Exception e) {
			ContextHelper.stampContext(e, "excp.find.instance");
		}finally{
			ContextHelper.handleContext();
		}
		return result;
	}
}
