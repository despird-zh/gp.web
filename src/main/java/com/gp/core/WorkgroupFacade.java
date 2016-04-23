package com.gp.core;

import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.collections.keyvalue.DefaultKeyValue;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.gp.audit.AccessPoint;
import com.gp.common.GeneralContext.ExecState;
import com.gp.common.IdKey;
import com.gp.common.Operations;
import com.gp.common.Principal;
import com.gp.common.ServiceContext;
import com.gp.exception.ServiceException;
import com.gp.info.GroupInfo;
import com.gp.info.InfoId;
import com.gp.info.UserExInfo;
import com.gp.info.UserInfo;
import com.gp.info.WorkgroupExInfo;
import com.gp.info.WorkgroupInfo;
import com.gp.info.WorkgroupUserExInfo;
import com.gp.info.WorkgroupUserInfo;
import com.gp.pagination.PageQuery;
import com.gp.pagination.PageWrapper;
import com.gp.svc.IdService;
import com.gp.svc.WorkgroupService;
import com.gp.validation.ValidationMessage;
import com.gp.validation.ValidationUtils;

@Component
public class WorkgroupFacade {

	static Logger LOGGER = LoggerFactory.getLogger(WorkgroupFacade.class);
	
	private static WorkgroupService workgroupservice;
	
	private static IdService idservice;
	
	@Autowired
	private WorkgroupFacade(WorkgroupService workgroupservice,IdService idservice){
		WorkgroupFacade.workgroupservice = workgroupservice;
		WorkgroupFacade.idservice = idservice;
	}
	
	public static GeneralResult<InfoId<Long>> newWorkgroup(AccessPoint accesspoint,
			Principal principal,
			WorkgroupInfo winfo, 
			Long pubcapacity, 
			Long pricapacity, 
			String imagePath){
			
		GeneralResult<InfoId<Long>> gresult = new GeneralResult<InfoId<Long>>();		
		try(ServiceContext<?> svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.NEW_WORKGROUP)){
			
			// amend the information key data
			if(!InfoId.isValid(winfo.getInfoId())){
				
				InfoId<Long> wkey = idservice.generateId( IdKey.WORKGROUP, Long.class);
				winfo.setInfoId(wkey);				
			}

			// amend the operation information
			svcctx.setAuditObject(winfo.getInfoId());
			svcctx.addAuditPredicates(winfo);
			
			// check the validation of user information
			List<ValidationMessage> vmsg = ValidationUtils.validate(principal.getLocale(), winfo);
			if(null != vmsg && vmsg.size() > 0){ // fail pass validation
				gresult.addMessages( vmsg);
				gresult.setMessage("fail create new workgroup", false);
				return gresult;
			}
			// append the capacity setting to context and send to service
			svcctx.putContextData(WorkgroupService.CTX_KEY_PUBCAPACITY, pubcapacity);
			svcctx.putContextData(WorkgroupService.CTX_KEY_PRICAPACITY, pricapacity);
			svcctx.putContextData(WorkgroupService.CTX_KEY_IMAGE_PATH, imagePath);
			
			boolean done = workgroupservice.newWorkgroup(svcctx, winfo);
			
			gresult.setReturnValue(winfo.getInfoId());
			gresult.setMessage("success create new workgroup", true);
			
		}catch(ServiceException e){
			LOGGER.error("Exception when create new workgroup",e);
			ContextHelper.stampContext(e);
			gresult.setMessage("fail create new workgroup", false);
		}finally{
			
			ContextHelper.handleContext();
		}
		return gresult;	
	}
	
	public static GeneralResult<Boolean> updateWorkgroup(AccessPoint accesspoint,
			Principal principal,
			WorkgroupInfo winfo, 
			Long pubcapacity, 
			Long pricapacity, 
			String imagePath){
			
		GeneralResult<Boolean> gresult = new GeneralResult<Boolean>();	
		
		try(ServiceContext<?> svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.UPDATE_WORKGROUP)){
			
			// amend the operation information
			svcctx.setAuditObject(winfo.getInfoId());
			svcctx.addAuditPredicates(winfo);
			// id not set return directly
			if(!InfoId.isValid(winfo.getInfoId())){
				
				gresult.setReturnValue(null);
				gresult.setMessage("Unknown the workgroup to be updated", false);
				svcctx.endAudit(ExecState.FAIL, "Unknown the workgroup to be updated");
				return gresult;	
			}

			// check the validation of user information
			List<ValidationMessage> vmsg = ValidationUtils.validate(principal.getLocale(), winfo);
			if(null != vmsg && vmsg.size() > 0){ // fail pass validation
				gresult.addMessages( vmsg);
				gresult.setMessage("fail create new workgroup", false);
				svcctx.endAudit(ExecState.FAIL, "fail create new workgroup");
				return gresult;
			}
			// append the capacity setting to context and send to service
			svcctx.putContextData(WorkgroupService.CTX_KEY_PUBCAPACITY, pubcapacity);
			svcctx.putContextData(WorkgroupService.CTX_KEY_PRICAPACITY, pricapacity);
			svcctx.putContextData(WorkgroupService.CTX_KEY_IMAGE_PATH, imagePath);
			
			Boolean done = workgroupservice.updateWorkgroup(svcctx, winfo);
			
			gresult.setReturnValue(done);
			gresult.setMessage("success update workgroup", true);
			
		}catch(ServiceException e){
			LOGGER.error("Exception when update workgroup",e);
			ContextHelper.stampContext(e);
			gresult.setMessage("fail create new workgroup", false);
		}finally{
			
			ContextHelper.handleContext();
		}
		return gresult;	
	}
	
	public static GeneralResult<WorkgroupInfo> findWorkgroup(AccessPoint accesspoint,
			Principal principal,
			InfoId<Long> wkey){
		
		GeneralResult<WorkgroupInfo> gresult = new GeneralResult<WorkgroupInfo>();
		try(ServiceContext<?> svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.FIND_WORKGROUP)){
			
			WorkgroupInfo winfo = null;
			
			// amend the operation information
			svcctx.setAuditObject(wkey);
			
			winfo = workgroupservice.getWorkgroup(svcctx, wkey);

			gresult.setReturnValue(winfo);
			gresult.setMessage("success get workgroup", true);
		}catch(ServiceException e){
			LOGGER.error("Exception when get workgroup",e);
			gresult.setMessage("fail get workgroup", true);
			ContextHelper.stampContext(e);
		}finally{
			
			ContextHelper.handleContext();
		}
		
		return gresult;
	}
	
	public static GeneralResult<WorkgroupExInfo> findWorkgroupEx(AccessPoint accesspoint,
			Principal principal,
			InfoId<Long> wkey){
		
		GeneralResult<WorkgroupExInfo> gresult = new GeneralResult<WorkgroupExInfo>();
		try(ServiceContext<?> svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.FIND_WORKGROUP)){
			
			WorkgroupExInfo winfo = null;
			
			// amend the operation information
			svcctx.setAuditObject(wkey);
			
			winfo = workgroupservice.getWorkgroupEx(svcctx, wkey);
			
			if(null == winfo){
				gresult.setMessage("the workgroup not exist", false);
			}else{
				gresult.setReturnValue(winfo);
				gresult.setMessage("success get workgroup", true);
			}
			
			
		}catch(ServiceException e){
			LOGGER.error("Exception when get workgroup",e);
			gresult.setMessage("fail get workgroup", true);
			ContextHelper.stampContext(e);
		}finally{
			
			ContextHelper.handleContext();
		}
		
		return gresult;
	}
	
	/**
	 * Find all the workgroup members 
	 **/
	public static GeneralResult<List<WorkgroupUserExInfo>> findWorkgroupMembers(AccessPoint accesspoint,
			Principal principal,
			InfoId<Long> wkey, String uname, InfoId<Integer> entityid){
		
		GeneralResult<List<WorkgroupUserExInfo>> gresult = new GeneralResult<List<WorkgroupUserExInfo>>();
		try(ServiceContext<?> svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.FIND_WORKGROUP_USERS)){
			
			List<WorkgroupUserExInfo> winfo = null;
			
			// amend the operation information
			svcctx.setAuditObject(wkey);
			
			winfo = workgroupservice.getWorkgroupMembers(svcctx, wkey, uname, entityid);

			gresult.setReturnValue(winfo);
			gresult.setMessage("success get workgroup member", true);
		}catch(ServiceException e){
			LOGGER.error("Exception when get workgroup member",e);
			gresult.setMessage("fail get workgroup member", true);
			ContextHelper.stampContext(e);
		}finally{
			
			ContextHelper.handleContext();
		}
		
		return gresult;
	}
	
	/**
	 * find all the workgroup members support paging on server-side 
	 **/
	public static GeneralResult<PageWrapper<WorkgroupUserExInfo>> findWorkgroupMembers(AccessPoint accesspoint,
			Principal principal,
			InfoId<Long> wkey, String uname, InfoId<Integer> entityid, PageQuery pagequery){
		
		GeneralResult<PageWrapper<WorkgroupUserExInfo>> gresult = new GeneralResult<PageWrapper<WorkgroupUserExInfo>>();
		try(ServiceContext<?> svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.FIND_WORKGROUP_USERS)){
			
			PageWrapper<WorkgroupUserExInfo> winfo = null;
			
			// amend the operation information
			svcctx.setAuditObject(wkey);
			
			winfo = workgroupservice.getWorkgroupMembers(svcctx, wkey, uname, entityid, pagequery);

			gresult.setReturnValue(winfo);
			gresult.setMessage("success get workgroup member", true);
		}catch(ServiceException e){
			LOGGER.error("Exception when get workgroup member",e);
			gresult.setMessage("fail get workgroup member", true);
			ContextHelper.stampContext(e);
		}finally{
			
			ContextHelper.handleContext();
		}
		
		return gresult;
	}
	
	public static GeneralResult<Boolean> removeWorkgroupMember(AccessPoint accesspoint,
			Principal principal,
			InfoId<Long> wkey, String account){
		
		GeneralResult<Boolean> gresult = new GeneralResult<Boolean>();
		try(ServiceContext<?> svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.REMOVE_WORKGROUP_USER)){

			// amend the operation information
			svcctx.setAuditObject(wkey);
			svcctx.addAuditPredicates(new DefaultKeyValue("member",account));
			boolean ok = workgroupservice.removeWorkgroupMember(svcctx, wkey, account);

			gresult.setReturnValue(ok);
			gresult.setMessage("success get workgroup member", true);
		}catch(ServiceException e){
			LOGGER.error("Exception when get workgroup member",e);
			gresult.setMessage("fail get workgroup member", true);
			ContextHelper.stampContext(e);
		}finally{
			
			ContextHelper.handleContext();
		}
		
		return gresult;
	}
	
	public static GeneralResult<Boolean> addWorkgroupMember(AccessPoint accesspoint,
			Principal principal,
			InfoId<Long> wkey, String account, String role){
		
		GeneralResult<Boolean> gresult = new GeneralResult<Boolean>();
		try(ServiceContext<?> svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.ADD_WORKGROUP_USER)){

			// amend the operation information
			svcctx.setAuditObject(wkey);
			svcctx.addAuditPredicates(new DefaultKeyValue("member",account));
			
			WorkgroupUserInfo wuinfo = new WorkgroupUserInfo();
			wuinfo.setAccount(account);
			wuinfo.setRole(role);
			wuinfo.setWorkgroupId(wkey.getId());			
			
			// check the validation of user information
			List<ValidationMessage> vmsg = ValidationUtils.validate(principal.getLocale(), wuinfo);
			if(CollectionUtils.isNotEmpty(vmsg)){ // fail pass validation
				gresult.addMessages( vmsg);
				gresult.setMessage("fail add workgroup member", false);
				svcctx.endAudit(ExecState.FAIL, "fail add workgroup member");				
				return gresult;
			}
			
			boolean ok = workgroupservice.addWorkgroupMember(svcctx, wuinfo);
			gresult.setReturnValue(ok);
			gresult.setMessage("success get workgroup member", true);
		}catch(ServiceException e){
			LOGGER.error("Exception when get workgroup member",e);
			gresult.setMessage("fail get workgroup member", true);
			ContextHelper.stampContext(e);
		}finally{
			
			ContextHelper.handleContext();
		}
		
		return gresult;
	}
	
	public static GeneralResult<List<UserExInfo>> findWrokgroupAvailUsers(AccessPoint accesspoint,
			Principal principal, 
			InfoId<Long> wkey,
			String uname){
		
		GeneralResult<List<UserExInfo>> result = new GeneralResult<List<UserExInfo>>();	
		
		try(ServiceContext<?> svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.FIND_ORGHIER_MEMBER)){
			svcctx.setAuditObject(wkey);
			// query accounts information
			List<UserExInfo> pwrapper = workgroupservice.getAvailableUsers(svcctx, wkey, uname);
			
			result.setReturnValue(pwrapper);
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
	
	public static GeneralResult<PageWrapper<UserExInfo>> findWrokgroupAvailUsers(AccessPoint accesspoint,
			Principal principal, 
			InfoId<Long> wkey,
			String uname, PageQuery pagequery){
		
		GeneralResult<PageWrapper<UserExInfo>> result = new GeneralResult<PageWrapper<UserExInfo>>();	
		
		try(ServiceContext<?> svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.FIND_ORGHIER_MEMBER)){
			svcctx.setAuditObject(wkey);
			// query accounts information
			PageWrapper<UserExInfo> pwrapper = workgroupservice.getAvailableUsers(svcctx, wkey, uname, pagequery);
			
			result.setReturnValue(pwrapper);
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
	
	public static GeneralResult<Boolean> newWorkgroupGroup(AccessPoint accesspoint,
			Principal principal, GroupInfo ginfo){
		
		GeneralResult<Boolean> gresult = new GeneralResult<Boolean>();
		try(ServiceContext<?> svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.NEW_GROUP)){
			
			// check the validation of user information
			List<ValidationMessage> vmsg = ValidationUtils.validate(principal.getLocale(), ginfo);
			if(CollectionUtils.isNotEmpty(vmsg)){ // fail pass validation
				gresult.addMessages( vmsg);
				gresult.setMessage("fail create new group", false);
				svcctx.endAudit(ExecState.FAIL, "fail create new group");
				return gresult;
			}
			
			if(!InfoId.isValid(ginfo.getInfoId())){
				
				InfoId<Long> gid = idservice.generateId(IdKey.GROUP, Long.class);
				ginfo.setInfoId(gid);
			}
			
			svcctx.setAuditObject(ginfo.getInfoId());
			svcctx.addAuditPredicates(ginfo);
			// query accounts information
			boolean ok = workgroupservice.addWorkgroupGroup(svcctx, ginfo);
			
			gresult.setReturnValue(ok);
			gresult.setMessage("success create workgroup group", true);			
			
		} catch (ServiceException e) {
			
			LOGGER.error("Fail create workgroup group",e);
			ContextHelper.stampContext(e);
			gresult.setMessage("fail create workgroup group", false);
			
		}finally{
			
			ContextHelper.handleContext();
		}
		
		return gresult;
	}
	
	public static GeneralResult<List<GroupInfo>> findWorkgroupGroups(AccessPoint accesspoint,
			Principal principal,
			InfoId<Long> wkey, String gname){
		
		GeneralResult<List<GroupInfo>> gresult = new GeneralResult<List<GroupInfo>>();
		try(ServiceContext<?> svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.FIND_GROUPS)){
			
			List<GroupInfo> winfo = null;
			
			// amend the operation information
			svcctx.setAuditObject(wkey);
			
			winfo = workgroupservice.getWorkgroupGroups(svcctx, wkey, gname);

			gresult.setReturnValue(winfo);
			gresult.setMessage("success get workgroup groups", true);
		}catch(ServiceException e){
			LOGGER.error("Exception when get workgroup groups",e);
			gresult.setMessage("fail get workgroup groups", true);
			ContextHelper.stampContext(e);
		}finally{
			
			ContextHelper.handleContext();
		}
		
		return gresult;
	}
	
	public static GeneralResult<Boolean> removeWorkgroupGroup(AccessPoint accesspoint,
			Principal principal,
			InfoId<Long> wkey, String group){
		
		GeneralResult<Boolean> gresult = new GeneralResult<Boolean>();
		try(ServiceContext<?> svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.REMOVE_GROUP)){

			// amend the operation information
			svcctx.setAuditObject(wkey);
			svcctx.addAuditPredicates(new DefaultKeyValue("group",group));
			boolean ok = workgroupservice.removeWorkgroupGroup(svcctx, wkey, group);

			gresult.setReturnValue(ok);
			gresult.setMessage("success remove workgroup group", true);
		}catch(ServiceException e){
			LOGGER.error("Exception when remove workgroup group",e);
			gresult.setMessage("fail remove workgroup group", true);
			ContextHelper.stampContext(e);
		}finally{
			
			ContextHelper.handleContext();
		}
		
		return gresult;
	}
	
	public static GeneralResult<Boolean> removeWorkgroupGroup(AccessPoint accesspoint,
			Principal principal,
			InfoId<Long> groupid){
		
		GeneralResult<Boolean> gresult = new GeneralResult<Boolean>();
		try(ServiceContext<?> svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.REMOVE_GROUP)){

			// amend the operation information
			svcctx.setAuditObject(groupid);

			boolean ok = workgroupservice.removeWorkgroupGroup(svcctx,  groupid);

			gresult.setReturnValue(ok);
			gresult.setMessage("success remove workgroup group", true);
		}catch(ServiceException e){
			LOGGER.error("Exception when remove workgroup group",e);
			gresult.setMessage("fail remove workgroup group", true);
			ContextHelper.stampContext(e);
		}finally{
			
			ContextHelper.handleContext();
		}
		
		return gresult;
	}
	
	public static GeneralResult<Boolean> addWorkgroupGroupMembers(AccessPoint accesspoint,
			Principal principal,
			InfoId<Long> groupid, String ...accounts){
		
		GeneralResult<Boolean> gresult = new GeneralResult<Boolean>();
		try(ServiceContext<?> svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.ADD_GROUP_USER)){

			// amend the operation information
			svcctx.setAuditObject(groupid);

			boolean ok = workgroupservice.addWorkgroupGroupMember(svcctx, groupid, accounts);

			gresult.setReturnValue(ok);
			gresult.setMessage("success add workgroup group members", true);
		}catch(ServiceException e){
			LOGGER.error("Exception when add workgroup group members",e);
			gresult.setMessage("fail add workgroup group members", true);
			ContextHelper.stampContext(e);
		}finally{
			
			ContextHelper.handleContext();
		}
		
		return gresult;
	}
	
	public static GeneralResult<List<UserInfo>> findWorkgroupGroupMembers(AccessPoint accesspoint,
			Principal principal,
			InfoId<Long> groupid){
		
		GeneralResult<List<UserInfo>> gresult = new GeneralResult<List<UserInfo>>();
		try(ServiceContext<?> svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.FIND_GROUP_USERS)){

			// amend the operation information
			svcctx.setAuditObject(groupid);

			List<UserInfo> pwrapper = workgroupservice.getWorkgroupGroupMembers(svcctx, groupid);

			gresult.setReturnValue(pwrapper);
			gresult.setMessage("success find workgroup group members", true);
		}catch(ServiceException e){
			LOGGER.error("Exception when find workgroup group members",e);
			gresult.setMessage("fail find workgroup group members", true);
			ContextHelper.stampContext(e);
		}finally{
			
			ContextHelper.handleContext();
		}
		
		return gresult;
	}
	
	public static GeneralResult<Boolean> removeWorkgroupGroupMember(AccessPoint accesspoint,
			Principal principal,
			InfoId<Long> groupid, String account){
		
		GeneralResult<Boolean> gresult = new GeneralResult<Boolean>();
		try(ServiceContext<?> svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.REMOVE_GROUP_USER)){

			// amend the operation information
			svcctx.setAuditObject(groupid);

			boolean ok = workgroupservice.removeWorkgroupGroupMember(svcctx, groupid, account);

			gresult.setReturnValue(ok);
			gresult.setMessage("success remove workgroup group member", true);
		}catch(ServiceException e){
			LOGGER.error("Exception when remove workgroup group member",e);
			gresult.setMessage("fail remove workgroup group member", true);
			ContextHelper.stampContext(e);
		}finally{
			
			ContextHelper.handleContext();
		}
		
		return gresult;
	}
	
	public static GeneralResult<List<WorkgroupExInfo>> findLocalWorkgroups(AccessPoint accesspoint,
			Principal principal,
			String wgroupname){
		
		GeneralResult<List<WorkgroupExInfo>> gresult = new GeneralResult<List<WorkgroupExInfo>>();
		try(ServiceContext<?> svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.FIND_WORKGROUPS)){

			// amend the operation information
			svcctx.addAuditPredicates(new DefaultKeyValue("workgroup_name", wgroupname));
			List<WorkgroupExInfo> pwrapper = workgroupservice.getLocalWorkgroups(svcctx, wgroupname);

			gresult.setReturnValue(pwrapper);
			gresult.setMessage("success find workgroups", true);
		}catch(ServiceException e){
			LOGGER.error("Exception when find workgroups",e);
			gresult.setMessage("fail find workgroups", true);
			ContextHelper.stampContext(e);
		}finally{
			
			ContextHelper.handleContext();
		}
		
		return gresult;
	}
	
	public static GeneralResult<List<WorkgroupExInfo>> findMirrorWorkgroups(AccessPoint accesspoint,
			Principal principal,
			String wgroupname){
		
		GeneralResult<List<WorkgroupExInfo>> gresult = new GeneralResult<List<WorkgroupExInfo>>();
		try(ServiceContext<?> svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.FIND_WORKGROUPS)){

			// amend the operation information
			svcctx.addAuditPredicates(new DefaultKeyValue("workgroup_name", wgroupname));
			List<WorkgroupExInfo> pwrapper = workgroupservice.getMirrorWorkgroups(svcctx, wgroupname);

			gresult.setReturnValue(pwrapper);
			gresult.setMessage("success find workgroups", true);
		}catch(ServiceException e){
			LOGGER.error("Exception when find workgroups",e);
			gresult.setMessage("fail find workgroups", true);
			ContextHelper.stampContext(e);
		}finally{
			
			ContextHelper.handleContext();
		}
		
		return gresult;
	}
}
