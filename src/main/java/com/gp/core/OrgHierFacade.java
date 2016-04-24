package com.gp.core;

import java.util.List;

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
import com.gp.exception.ServiceException;
import com.gp.info.InfoId;
import com.gp.info.OrgHierInfo;
import com.gp.info.UserInfo;
import com.gp.svc.OrgHierService;
import com.gp.validation.ValidationMessage;
import com.gp.validation.ValidationUtils;

@Component
public class OrgHierFacade {

	static Logger LOGGER = LoggerFactory.getLogger(OrgHierFacade.class);
	
	static OrgHierService orghierservice;
	
	@Autowired
	private OrgHierFacade(OrgHierService orghierservice){
		OrgHierFacade.orghierservice = orghierservice;
	}
	

	public static GeneralResult<List<OrgHierInfo>> findOrgHiers(AccessPoint accesspoint,
			Principal principal, Long orgNodeId){
		
		GeneralResult<List<OrgHierInfo>> gresult = new GeneralResult<List<OrgHierInfo>>();
		
		try(ServiceContext<?> svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.FIND_ORGHIERS)){

			List<OrgHierInfo> groups = orghierservice.getOrgHierNodes(svcctx, orgNodeId);
			gresult.setReturnValue(groups);
			gresult.setMessage("success get organization nodes ", true);
			
		} catch (Exception e) {
			
			LOGGER.error("Fail query organization nodes",e);
			ContextHelper.stampContext(e);
			gresult.setMessage("fail get organization nodes ", false);
			
		}finally{
			
			ContextHelper.handleContext();
		}
		return gresult;
	}
	
	public static GeneralResult<InfoId<Long>> newOrgHier(AccessPoint accesspoint,
			Principal principal, OrgHierInfo orghier){
		
		GeneralResult<InfoId<Long>> result = new GeneralResult<InfoId<Long>>();
		
		if(!InfoId.isValid(orghier.getInfoId())){
			InfoId<Long> id = IdGenerator.generateId(IdKey.ORG_HIER, Long.class);
			if(null == id){
				ValidationMessage noidmsg = new ValidationMessage("org_id", "miss required org node id");
				result.addMessage(noidmsg);
				result.setMessage("fail to valid the message.", false);
				result.setReturnValue(null);
				return result;
			}
			orghier.setInfoId(id);
		}
		
		try (ServiceContext<?> svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.NEW_ORGHIER)){
			
			svcctx.setAuditObject(orghier.getInfoId());
			svcctx.addAuditPredicates(orghier);
			// check the validation of user information
			List<ValidationMessage> vmsg = ValidationUtils.validate(principal.getLocale(), orghier);
			if(null != vmsg && vmsg.size() > 0){ // fail pass validation
				result.addMessages(vmsg);	
				result.setMessage("fail save org hierarchy ", false);
				svcctx.endAudit(ExecState.EXCEP, "row info validation fail");
				return result;
			}
			
			orghierservice.newOrgHierNode(svcctx, orghier);
			
			result.setReturnValue(orghier.getInfoId());		
			result.setMessage("success save org hierarchy ", true);
		} catch (ServiceException e)  {
			LOGGER.error("Fail query accounts",e);
			ContextHelper.stampContext(e);
			result.setMessage("fail save org hierarchy ", false);
		}finally{
			
			ContextHelper.handleContext();
		}
		return result;
		
	}
	
	public static GeneralResult<Boolean> saveOrgHier(AccessPoint accesspoint,
			Principal principal, OrgHierInfo orghier){
		
		GeneralResult<Boolean> result = new GeneralResult<Boolean>();
		
		if(!InfoId.isValid(orghier.getInfoId())){

			ValidationMessage noidmsg = new ValidationMessage("org_id", "miss required org node id");
			result.addMessage(noidmsg);
			result.setMessage("fail to valid the message.", false);
			result.setReturnValue(null);
			return result;
		}
		
		try (ServiceContext<?> svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.UPDATE_ORGHIER)){
			
			svcctx.setAuditObject(orghier.getInfoId());
			svcctx.addAuditPredicates(orghier);
			// check the validation of user information
			List<ValidationMessage> vmsg = ValidationUtils.validate(principal.getLocale(), orghier);
			if(null != vmsg && vmsg.size() > 0){ // fail pass validation
				result.addMessages(vmsg);	
				result.setMessage("fail save org hierarchy ", false);
				svcctx.endAudit(ExecState.EXCEP, "row info validation fail");
				return result;
			}
			
			boolean success =  orghierservice.saveOrgHierNode(svcctx, orghier);
			
			result.setReturnValue(success);			
			result.setMessage("success save org hierarchy ", true);
		} catch (ServiceException e)  {
			LOGGER.error("Fail save org hierarchy",e);
			ContextHelper.stampContext(e);
			result.setMessage("fail save org hierarchy ", false);
		}finally{
			
			ContextHelper.handleContext();
		}
		return result;
		
	}
	
	public static GeneralResult<OrgHierInfo> findOrgHier(AccessPoint accesspoint,
			Principal principal, InfoId<Long> orgid){
		
		GeneralResult<OrgHierInfo> rst = new GeneralResult<OrgHierInfo>();
		
		if(!InfoId.isValid(orgid)){
			ValidationMessage noidmsg = new ValidationMessage("orghier_id", "miss required orghier id");
			rst.addMessage(noidmsg);
			rst.setReturnValue(null);
			rst.setMessage("fail to valid the message.", false);
			return rst;
		}
		
		try (ServiceContext<?> svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.FIND_ORGHIER)){
			
			svcctx.setAuditObject(orgid);
			
			OrgHierInfo oinfo = orghierservice.getOrgHierNode(svcctx, orgid);
			rst.setReturnValue(oinfo);
			rst.setMessage("success to find orghier.", true);
		} catch (ServiceException e)  {
			LOGGER.error("Exception when find orghier",e);
			ContextHelper.stampContext(e);
			rst.setMessage("fail to find orghier.", false);
		}finally{
			
			ContextHelper.handleContext();
		}
		return rst;
	}
	
	public static GeneralResult<Boolean> addOrgHierMember(AccessPoint accesspoint,
			Principal principal, InfoId<Long> orgid, String ...accounts){

		GeneralResult<Boolean> rst = new GeneralResult<Boolean>();
		
		if(!InfoId.isValid(orgid)){
			ValidationMessage noidmsg = new ValidationMessage("orghier_id", "miss required orghier id");
			rst.addMessage(noidmsg);
			rst.setReturnValue(null);
			rst.setMessage("fail to valid the message.", false);
			return rst;
		}
		if(ArrayUtils.isEmpty(accounts)){
			ValidationMessage noidmsg = new ValidationMessage("account", "the accounts not set yet");
			rst.addMessage(noidmsg);
			rst.setReturnValue(null);
			rst.setMessage("fail to valid the message.", false);
			return rst;
		}
		
		try (ServiceContext<?> svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.ADD_ORGHIER_MEMBER)){
			
			svcctx.setAuditObject(orgid);
			
			orghierservice.addOrgHierMember(svcctx, orgid, accounts);
			rst.setReturnValue(true);
			rst.setMessage("success to add orghier member.", true);
		} catch (ServiceException e)  {
			LOGGER.error("Exception when add orghier member",e);
			ContextHelper.stampContext(e);
			rst.setReturnValue(false);
			rst.setMessage("fail to add orghier member.", false);
		}finally{
			
			ContextHelper.handleContext();
		}
		return rst;
		
	}
	
	public static GeneralResult<Boolean> removeOrgHierMember(AccessPoint accesspoint,
			Principal principal, InfoId<Long> orgid, String ...accounts){

		GeneralResult<Boolean> rst = new GeneralResult<Boolean>();
		
		if(!InfoId.isValid(orgid)){
			ValidationMessage noidmsg = new ValidationMessage("orghier_id", "miss required orghier id");
			rst.addMessage(noidmsg);
			rst.setReturnValue(null);
			rst.setMessage("fail to valid the message.", false);
			return rst;
		}
		if(ArrayUtils.isEmpty(accounts)){
			ValidationMessage noidmsg = new ValidationMessage("account", "the accounts not set yet");
			rst.addMessage(noidmsg);
			rst.setReturnValue(null);
			rst.setMessage("fail to valid the message.", false);
			return rst;
		}
		
		try (ServiceContext<?> svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.REMOVE_ORGHIER_MEMBER)){
			
			svcctx.setAuditObject(orgid);
			
			orghierservice.removeOrgHierMember(svcctx, orgid, accounts);
			rst.setReturnValue(true);
			rst.setMessage("success to remove orghier member.", true);
		} catch (ServiceException e)  {
			LOGGER.error("Exception when remove orghier member",e);
			ContextHelper.stampContext(e);
			rst.setReturnValue(false);
			rst.setMessage("fail to remove orghier member.", false);
		}finally{
			
			ContextHelper.handleContext();
		}
		return rst;
		
	}
	
	public static GeneralResult<List<UserInfo>> findOrgHierMembers(AccessPoint accesspoint,
			Principal principal, 
			InfoId<Long> orgid){
		
		GeneralResult<List<UserInfo>> result = new GeneralResult<List<UserInfo>>();	
		
		try(ServiceContext<?> svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.FIND_ORGHIER_MEMBER)){
			svcctx.setAuditObject(orgid);
			// query accounts information
			List<UserInfo> uinfos = orghierservice.getOrgHierMembers(svcctx, orgid);
			
			result.setReturnValue(uinfos);
			result.setMessage("success get org members", true);			
			
		} catch (ServiceException e) {
			
			LOGGER.error("Fail query org members",e);
			ContextHelper.stampContext(e);
			result.setMessage("fail get org members", false);
			
		}finally{
			
			ContextHelper.handleContext();
		}
		
		return result;
	}
	
}
