package com.gp.core;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.keyvalue.DefaultKeyValue;
import org.apache.commons.lang.ArrayUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.codec.Base64;
import org.apache.shiro.util.CollectionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.gp.audit.AccessPoint;
import com.gp.common.GeneralContext.ExecState;
import com.gp.common.GeneralConstants;
import com.gp.common.IdKey;
import com.gp.common.Operations;
import com.gp.common.Principal;
import com.gp.common.ServiceContext;
import com.gp.common.SystemOptions;
import com.gp.common.Users;
import com.gp.common.Users.UserState;
import com.gp.exception.CoreException;
import com.gp.exception.ServiceException;
import com.gp.info.InfoId;
import com.gp.info.InstanceInfo;
import com.gp.info.UserExInfo;
import com.gp.info.UserInfo;
import com.gp.pagination.PageQuery;
import com.gp.pagination.PageWrapper;
import com.gp.svc.IdService;
import com.gp.svc.InstanceService;
import com.gp.svc.SecurityService;
import com.gp.util.ConfigSettingUtils;
import com.gp.util.HashUtils;
import com.gp.validation.ValidationMessage;
import com.gp.validation.ValidationUtils;

/**
 * this class handle the security related operation, include group organization user etc.
 * 
 **/
@Component
public class SecurityFacade {
	
	static Logger LOGGER = LoggerFactory.getLogger(SecurityFacade.class);
	
	private static final String HASH_SALT = ConfigSettingUtils.getSystemOption(SystemOptions.SECURITY_HASH_SALT);
		
	private static SecurityService securityservice;

	private static InstanceService masterservice;
	
	private static IdService idservice;
	
	@Autowired
	private SecurityFacade(SecurityService securityservice, IdService idservice,InstanceService masterservice){
		
		SecurityFacade.securityservice = securityservice;
		SecurityFacade.idservice = idservice;
		SecurityFacade.masterservice = masterservice;
	}
	
	/**
	 * Get the account information by account
	 * 
	 * @param ap the AccessPoint 
	 * @param account the account  
	 **/
	public static GeneralResult<UserExInfo> findAccount(AccessPoint accesspoint, 
			Principal principal,
			InfoId<Long> userId,
			String account, String type){
		
		GeneralResult<UserExInfo> gresult = new GeneralResult<UserExInfo>();
		try (ServiceContext<?> svcctx = ContextHelper.buildServiceContext(principal, accesspoint)){
			
			svcctx.beginAudit(Operations.FIND_ACCOUNT.name(),  null, 
					new DefaultKeyValue("account",account));
			
			UserExInfo uinfo = securityservice.getAccountFull(svcctx, userId, account, type);
			gresult.setReturnValue(uinfo);
			gresult.setMessage("success find the account", true);
		
		} catch (ServiceException e) {
			LOGGER.error("Exception when find account",e);
			ContextHelper.stampContext(e);
			gresult.setMessage("fail find the account", false);
		}finally{
			
			ContextHelper.handleContext();
		}
		return gresult;
	}
	
	/**
	 * Create a new account in database
	 * 
	 * @param accesspoint the access point
	 * @param principal the principal object
	 * @param uinfo the user information
	 * @param pubcapacity public cabinet capacity
	 * @param pricapacity private cabinet capacity
	 **/
	public static GeneralResult<Boolean> saveAccount(AccessPoint accesspoint,
			Principal principal,
			UserInfo uinfo, Long pubcapacity, Long pricapacity){

		GeneralResult<Boolean> result = new GeneralResult<Boolean>();
		try (ServiceContext<?> svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.UPDATE_ACCOUNT)){
			
			svcctx.addAuditPredicates(uinfo);
			// encrypt the password
			if(StringUtils.isNotBlank(uinfo.getPassword())){
				String hashpwd = HashUtils.hashEncodeBase64(uinfo.getPassword(), HASH_SALT);
				uinfo.setPassword(hashpwd);
			}
			// amend the operation information
			svcctx.setAuditObject(uinfo.getInfoId());
			// append the capacity setting to context and send to service
			svcctx.putContextData(SecurityService.CTX_KEY_PUBCAPACITY, pubcapacity);
			svcctx.putContextData(SecurityService.CTX_KEY_PRICAPACITY, pricapacity);
			
			boolean bval = securityservice.updateAccount(svcctx, uinfo) > 0;
			result.setReturnValue(bval);
			result.setMessage("success to save account", true);
					
		} catch (ServiceException e) {
			LOGGER.error("Exception when new account",e);
			ContextHelper.stampContext(e);
			result.setMessage("fail to save account", false);
		}finally{
			
			ContextHelper.handleContext();
		}
		
		return result;
	}
	/**
	 * Create a new account in database
	 * 
	 * @param accesspoint the access point
	 * @param principal the principal object
	 * @param uinfo the user information
	 * @param pubcapacity public cabinet capacity
	 * @param pricapacity private cabinet capacity
	 **/
	public static GeneralResult<InfoId<Long>> newAccount(AccessPoint accesspoint,
			Principal principal,
			UserInfo uinfo, Long pubcapacity, Long pricapacity){
		
		GeneralResult<InfoId<Long>> result = new GeneralResult<InfoId<Long>>();
		try (ServiceContext<?> svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.NEW_ACCOUNT)){
			svcctx.addAuditPredicates(uinfo);
			// encrypt the password
			String hashpwd = HashUtils.hashEncodeBase64(uinfo.getPassword(), HASH_SALT);
			uinfo.setPassword(hashpwd);
			// set local entity id
			uinfo.setSourceId(GeneralConstants.LOCAL_INSTANCE);
			// check the validation of user information
			List<ValidationMessage> vmsg = ValidationUtils.validate(principal.getLocale(), uinfo);
			if(!CollectionUtils.isEmpty(vmsg)){ // fail pass validation
				result.addMessages(vmsg);
				result.setMessage("fail to validate the message", false);
				svcctx.endAudit(ExecState.FAIL, "fail to validate the message");
				return result;
			}
			
			// amend the information key data
			if(uinfo.getInfoId() == null){
				
				InfoId<Long> ukey = idservice.generateId( IdKey.USER, Long.class);
				uinfo.setInfoId(ukey);
				
			}
			// amend the operation information
			svcctx.setAuditObject(uinfo.getInfoId());
			// append the capacity setting to context and send to service
			svcctx.putContextData(SecurityService.CTX_KEY_PUBCAPACITY, pubcapacity);
			svcctx.putContextData(SecurityService.CTX_KEY_PRICAPACITY, pricapacity);
			
			securityservice.newAccount(svcctx, uinfo);
			result.setReturnValue(uinfo.getInfoId());
			result.setMessage("success to save account", true);
					
		} catch (ServiceException e) {
			LOGGER.error("Exception when new account",e);
			ContextHelper.stampContext(e);
			result.setMessage("fail to save account", false);
		}finally{
			
			ContextHelper.handleContext();
		}
		
		return result;
	}
	
	/**
	 * Create a new account in database
	 * 
	 * @param accesspoint the access point
	 * @param principal the principal object
	 * @param uinfo the user information
	 * @param pubcapacity public cabinet capacity
	 * @param pricapacity private cabinet capacity
	 **/
	public static GeneralResult<InfoId<Long>> newAccountExt(AccessPoint accesspoint,
			Principal principal,
			UserInfo uinfo, String entity, String node){
		
		GeneralResult<InfoId<Long>> result = new GeneralResult<InfoId<Long>>();
		try (ServiceContext<?> svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.NEW_ACCOUNT)){
			
			svcctx.addAuditPredicates(uinfo);
			// encrypt the password
			String hashpwd = HashUtils.hashEncodeBase64(uinfo.getPassword(), HASH_SALT);
			uinfo.setPassword(hashpwd);

			// check the validation of user information
			List<ValidationMessage> vmsg = new ArrayList<ValidationMessage>();
			InstanceInfo instance = masterservice.getInstnace(svcctx, entity, node);
			if(instance != null){
				
				uinfo.setSourceId(instance.getInfoId().getId());
			}else{				
				vmsg.add(new ValidationMessage("source","target entity not existed"));
			}
			if(StringUtils.isBlank(uinfo.getAccount())){
				vmsg.add(new ValidationMessage("account","Account can't be empty"));
			}
			if(StringUtils.isBlank(uinfo.getGlobalAccount())){
				vmsg.add(new ValidationMessage("gaccount","global account can't be empty"));
			}
			if(StringUtils.isBlank(uinfo.getEmail())){
				vmsg.add(new ValidationMessage("email","Email can't be empty"));
			}
			if(StringUtils.isBlank(uinfo.getMobile())){
				vmsg.add(new ValidationMessage("mobile","mobile can't be empty"));
			}
			if(StringUtils.isBlank(uinfo.getFullName())){
				vmsg.add(new ValidationMessage("full","name can't be empty"));
			}
			if(null != vmsg && vmsg.size() > 0){ // fail pass validation
				result.addMessages(vmsg);
				result.setMessage("fail to validate the message", false);
				svcctx.endAudit(ExecState.FAIL, "fail to validate the message");
				return result;
			}
			// amend the information key data
			if(!InfoId.isValid(uinfo.getInfoId())){
				
				InfoId<Long> ukey = idservice.generateId( IdKey.USER, Long.class);
				uinfo.setInfoId(ukey);
				
			}
			// amend the operation information
			svcctx.setAuditObject(uinfo.getInfoId());

			securityservice.newAccountExt(svcctx, uinfo);
			result.setReturnValue(uinfo.getInfoId());
			result.setMessage("success to create external account", true);
					
		} catch (ServiceException e) {
			LOGGER.error("Exception when create external account",e);
			ContextHelper.stampContext(e);
			result.setMessage("fail to create external account", false);
		}finally{
			
			ContextHelper.handleContext();
		}
		
		return result;	
	}
	
	/**
	 * get accounts list from db by query condition
	 * 
	 * @param accesspoint the access point
	 * @param principal the principal object
	 * @param accountname the account name filter
	 * @param instance the instance filter, i.e. user original source
	 * @param type the type filter
	 **/
	public static GeneralResult<List<UserExInfo>> findAccounts(AccessPoint accesspoint,
			Principal principal,
			String accountname, 
			Integer instanceId, 
			String[] types,
			String[] states){
		
		GeneralResult<List<UserExInfo>> result = new GeneralResult<List<UserExInfo>>();
		try (ServiceContext<?> svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.FIND_ACCOUNTS)){
			
			String[][] parms = new String[][]{
				{"account",accountname},
				{"instance", instanceId == null ? "" : instanceId.toString()},
				{"types",ArrayUtils.toString(types)},
				{"state",ArrayUtils.toString(states)}};
				
			Map<?,?> parmap = ArrayUtils.toMap(parms);			
			svcctx.addAuditPredicates(parmap);

			// query accounts information
			List<UserExInfo> pwrapper = securityservice.getAccounts(svcctx, accountname, instanceId, types,states);
			
			result.setReturnValue(pwrapper);
			result.setMessage("success find the user accounts", true);
						
		} catch (ServiceException e) {
			LOGGER.error("Fail query accounts",e);
			ContextHelper.stampContext(e);
			result.setMessage("fail find the user accounts", false);
		}finally{
			
			ContextHelper.handleContext();
		}
		return result;
	}
	
	/**
	 * get accounts list from db by query condition
	 * 
	 * @param accesspoint the access point
	 * @param principal the principal object
	 * @param accountname the account name filter
	 * @param instance the instance filter, i.e. user original source
	 * @param type the type filter
	 **/
	public static GeneralResult<PageWrapper<UserExInfo>> findAccounts(AccessPoint accesspoint,
			Principal principal,
			String accountname, 
			Integer instanceId, 
			String[] type, 
			PageQuery pagequery){
		
		GeneralResult<PageWrapper<UserExInfo>> result = new GeneralResult<PageWrapper<UserExInfo>>();
		try (ServiceContext<?> svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.FIND_ACCOUNTS)){
			
			String[][] parms = new String[][]{
				{"account",accountname},
				{"instance", instanceId == null ? "" : instanceId.toString()},
				{"types",ArrayUtils.toString(type)}};
				
			Map<?,?> parmap = ArrayUtils.toMap(parms);			
			svcctx.addAuditPredicates(parmap);

			// query accounts information
			PageWrapper<UserExInfo> pwrapper = securityservice.getAccounts(svcctx, accountname, instanceId, type, pagequery);
			
			result.setReturnValue(pwrapper);
			result.setMessage("success find the user accounts", true);
						
		} catch (ServiceException e) {
			LOGGER.error("Fail query accounts",e);
			ContextHelper.stampContext(e);
			result.setMessage("fail find the user accounts", false);
		}finally{
			
			ContextHelper.handleContext();
		}
		return result;
	}
	
	public static Boolean authenticate(AccessPoint accesspoint,
			Principal principal,
			String password)throws CoreException{
		
		try (ServiceContext<?> svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.AUTHENTICATE)){
			
			svcctx.addAuditPredicates(new DefaultKeyValue("password", password));
			byte[] pwdbytes;
			boolean pass = false;
			try {
				
				pwdbytes = Base64.decode(principal.getPassword());
				pass =  HashUtils.isExpectedPassword(password.toCharArray(), HASH_SALT.getBytes(), pwdbytes);
				
			} catch (Exception e) {
				LOGGER.error("password not match...", e);				
			}
			// password match means logon success reset the retry_times
			securityservice.updateLogonTrace(svcctx, principal.getUserId(), pass);
			
			return pass;
			
		} catch (ServiceException e) {
			LOGGER.error("Error authenticate account state",e);
			ContextHelper.stampContext(e);
			throw new CoreException("Fail authenticate accounts",e);
		}finally{
			
			ContextHelper.handleContext();
		}
	}
	
	public static void changeAccountState(AccessPoint accesspoint,
			Principal principal,
			UserState state)throws CoreException{
		
		try (ServiceContext<?> svcctx = ContextHelper.beginServiceContext(Users.PESUOD_USER, accesspoint,
				Operations.CHANGE_ACCOUNT_STATE)){
			
			svcctx.addAuditPredicates(new DefaultKeyValue("state", state.name()));
			
			// password match means logon success reset the retry_times
			securityservice.changeAccountState(svcctx, principal.getUserId(), state);			
			
		} catch (ServiceException e) {
			LOGGER.error("Error change account state",e);
			ContextHelper.stampContext(e);
			throw new CoreException("Error change account state",e);
		}finally{
			
			ContextHelper.handleContext();
		}
	}
	
	public static GeneralResult<Boolean> removeAccount(AccessPoint accesspoint,
			Principal principal,
			InfoId<Long> userId, String account){
		
		GeneralResult<Boolean> gresult = new GeneralResult<Boolean>();
		try (ServiceContext<?> svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.REMOVE_ACCOUNT)){
			
			svcctx.addAuditPredicates(new DefaultKeyValue("account", account));
			
			// password match means logon success reset the retry_times
			boolean rtv = securityservice.removeAccount(svcctx, userId, account);
			gresult.setReturnValue(rtv);
			gresult.setMessage("success remove account", true);
		} catch (ServiceException e) {
			LOGGER.error("Error change account state",e);
			ContextHelper.stampContext(e);
			gresult.setMessage("fail remove account", false);
		}finally{
			
			ContextHelper.handleContext();
		}
		return gresult;
	}
	
	public static GeneralResult<Boolean> changePassword(AccessPoint accesspoint,
			Principal principal,
			String account, 
			String password){
		
		GeneralResult<Boolean> gresult = new GeneralResult<Boolean>();
		try (ServiceContext<?> svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.CHANGE_PWD)){

			// password match means logon success reset the retry_times
			boolean rtv = securityservice.changePassword(svcctx, account, password);
			gresult.setReturnValue(rtv);
			gresult.setMessage("success change account password", true);
		} catch (ServiceException e) {
			LOGGER.error("Error change account state",e);
			ContextHelper.stampContext(e);
			gresult.setMessage("fail change account password", false);
		}finally{
			
			ContextHelper.handleContext();
		}
		return gresult;
	}
}
