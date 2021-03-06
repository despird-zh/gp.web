package com.gp.core;

import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.gp.svc.info.UserLiteInfo;
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
import com.gp.common.GeneralConstants;
import com.gp.common.IdKey;
import com.gp.common.Operations;
import com.gp.common.GPrincipal;
import com.gp.common.ServiceContext;
import com.gp.common.SystemOptions;
import com.gp.common.GroupUsers;
import com.gp.common.GroupUsers.UserState;
import com.gp.exception.CoreException;
import com.gp.exception.ServiceException;
import com.gp.info.CombineInfo;
import com.gp.info.InfoId;
import com.gp.dao.info.SourceInfo;
import com.gp.info.KVPair;
import com.gp.dao.info.UserInfo;
import com.gp.pagination.PageQuery;
import com.gp.pagination.PageWrapper;
import com.gp.svc.CommonService;
import com.gp.svc.SourceService;
import com.gp.svc.SecurityService;
import com.gp.svc.info.UserExtInfo;
import com.gp.util.ConfigSettingUtils;
import com.gp.util.HashUtils;
import com.gp.validate.ValidateMessage;
import com.gp.validate.ValidateUtils;

/**
 * this class handle the security related operation, include group organization user etc.
 * 
 **/
@Component
public class SecurityFacade {
	
	static Logger LOGGER = LoggerFactory.getLogger(SecurityFacade.class);
	
	public static final String HASH_SALT = ConfigSettingUtils.getSystemOption(SystemOptions.SECURITY_HASH_SALT);
		
	private static SecurityService securityservice;

	private static SourceService masterservice;
	
	private static CommonService idservice;
	
	@Autowired
	private SecurityFacade(SecurityService securityservice, CommonService idservice,SourceService masterservice){
		
		SecurityFacade.securityservice = securityservice;
		SecurityFacade.idservice = idservice;
		SecurityFacade.masterservice = masterservice;
	}
	
	public static UserInfo findAccountLite(AccessPoint accesspoint, 
			GPrincipal principal,
			InfoId<Long> userId,
			String account, String type) throws CoreException{
		
		UserInfo uinfo = null;
		try (ServiceContext svcctx = ContextHelper.buildServiceContext(principal, accesspoint)){
			
			svcctx.beginOperation(Operations.FIND_ACCOUNT.name(),  null, 
					new KVPair<String, String>("account",account));
			
			uinfo = securityservice.getAccountLite(svcctx, userId, account, type);
		} catch (ServiceException e) {
			
			ContextHelper.stampContext(e, "excp.find.account");
		}finally{
			
			ContextHelper.handleContext();
		}
		return uinfo;
	}
	
	/**
	 * Get the account information by account
	 * 
	 * @param ap the AccessPoint 
	 * @param account the account  
	 **/
	public static UserExtInfo findAccount(AccessPoint accesspoint, 
			GPrincipal principal,
			InfoId<Long> userId,
			String account, String type) throws CoreException{
		
		UserExtInfo uinfo = null;
		try (ServiceContext svcctx = ContextHelper.buildServiceContext(principal, accesspoint)){
			
			svcctx.beginOperation(Operations.FIND_ACCOUNT.name(),  null, 
					new KVPair<String, String>("account",account));
			
			uinfo = securityservice.getAccountFull(svcctx, userId, account, type);
		} catch (ServiceException e) {
			
			ContextHelper.stampContext(e, "excp.find.account");
		}finally{
			
			ContextHelper.handleContext();
		}
		return uinfo;
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
	public static boolean saveAccount(AccessPoint accesspoint,
			GPrincipal principal,
			UserInfo uinfo, Long pubcapacity, Long pricapacity)throws CoreException{

		Boolean result = false;
		try (ServiceContext svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.UPDATE_ACCOUNT)){
			
			svcctx.addOperationPredicates(uinfo);
			// encrypt the password
			if(StringUtils.isNotBlank(uinfo.getPassword())){
				String hashpwd = HashUtils.hashEncodeBase64(uinfo.getPassword(), HASH_SALT);
				uinfo.setPassword(hashpwd);
			}
			// amend the operation information
			svcctx.setOperationObject(uinfo.getInfoId());

			result = securityservice.updateAccount(svcctx, uinfo, pubcapacity, pricapacity) > 0;
			
		} catch (ServiceException e) {
			ContextHelper.stampContext(e,"excp.save.account");
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
	public static InfoId<Long> newAccount(AccessPoint accesspoint,
			GPrincipal principal,
			UserInfo uinfo, Long pubcapacity, Long pricapacity) throws CoreException{
		
		InfoId<Long> result = null;
		
		try (ServiceContext svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.NEW_ACCOUNT)){
			svcctx.addOperationPredicates(uinfo);
			// encrypt the password
			String hashpwd = HashUtils.hashEncodeBase64(uinfo.getPassword(), HASH_SALT);
			uinfo.setPassword(hashpwd);
			// set local entity id
			uinfo.setSourceId(GeneralConstants.LOCAL_SOURCE);
			// check the validation of user information
			Set<ValidateMessage> vmsg = ValidateUtils.validate(principal.getLocale(), uinfo);
			if(!CollectionUtils.isEmpty(vmsg)){ // fail pass validation
				CoreException coreexcp = new CoreException(svcctx.getPrincipal().getLocale(), "excp.validate");
				coreexcp.addValidateMessages(vmsg);
				throw coreexcp;
			}
			
			// amend the information key data
			if(uinfo.getInfoId() == null){
				
				InfoId<Long> ukey = idservice.generateId( IdKey.GP_USERS, Long.class);
				uinfo.setInfoId(ukey);
			}
			
			// amend the operation information
			svcctx.setOperationObject(uinfo.getInfoId());

			securityservice.newAccount(svcctx, uinfo, pubcapacity, pricapacity);
			result = uinfo.getInfoId();
	
		} catch (Exception e) {
			ContextHelper.stampContext(e, "excp.save.account");
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
	public static InfoId<Long> newAccountExt(AccessPoint accesspoint,
			GPrincipal principal,
			UserInfo uinfo, String entity, String node) throws CoreException{
		
		InfoId<Long> result = null;
		try (ServiceContext svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.NEW_ACCOUNT)){
			
			svcctx.addOperationPredicates(uinfo);
			// encrypt the password
			String hashpwd = HashUtils.hashEncodeBase64(uinfo.getPassword(), HASH_SALT);
			uinfo.setPassword(hashpwd);

			// check the validation of user information
			Set<ValidateMessage> vmsg = new HashSet<ValidateMessage>();
			SourceInfo instance = masterservice.getSource(svcctx, entity, node);
			if(instance != null){
				
				uinfo.setSourceId(instance.getInfoId().getId());
			}else{				
				vmsg.add(new ValidateMessage("source","target entity not existed"));
			}
			Set<ValidateMessage> vmsg1= ValidateUtils.validateProperty(svcctx.getPrincipal().getLocale(), "account", "globalAccount", "email", "mobile","fullName");
			vmsg.addAll(vmsg1);
			if(!CollectionUtils.isEmpty(vmsg)){ // fail pass validation
				CoreException coreexcp = new CoreException(svcctx.getPrincipal().getLocale(), "excp.validate");
				coreexcp.addValidateMessages(vmsg);
				throw coreexcp;
			}
			// amend the information key data
			if(!InfoId.isValid(uinfo.getInfoId())){
				
				InfoId<Long> ukey = idservice.generateId( IdKey.GP_USERS, Long.class);
				uinfo.setInfoId(ukey);
				
			}
			// amend the operation information
			svcctx.setOperationObject(uinfo.getInfoId());

			securityservice.newAccountExt(svcctx, uinfo);
			
		} catch (ServiceException e) {
			
			ContextHelper.stampContext(e, "excp.save.account");
			
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
	public static List<UserExtInfo> findAccounts(AccessPoint accesspoint,
			GPrincipal principal,
			String accountname, 
			Integer instanceId, 
			String[] types,
			String[] states)throws CoreException{
		
		List<UserExtInfo> result = null;
		try (ServiceContext svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.FIND_ACCOUNTS)){
			
			String[][] parms = new String[][]{
				{"account",accountname},
				{"instance", instanceId == null ? "" : instanceId.toString()},
				{"types",ArrayUtils.toString(types)},
				{"state",ArrayUtils.toString(states)}};
				
			Map<?,?> parmap = ArrayUtils.toMap(parms);			
			svcctx.addOperationPredicates(parmap);

			// query accounts information
			result = securityservice.getAccounts(svcctx, accountname, instanceId, types,states);

		} catch (ServiceException e) {
			ContextHelper.stampContext(e, "excp.find.account");
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
	public static PageWrapper<UserExtInfo> findAccounts(AccessPoint accesspoint,
			GPrincipal principal,
			String accountname, 
			Integer instanceId, 
			String[] type, 
			PageQuery pagequery)throws CoreException{
		
		PageWrapper<UserExtInfo> result = null;
		try (ServiceContext svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.FIND_ACCOUNTS)){
			
			String[][] parms = new String[][]{
				{"account",accountname},
				{"instance", instanceId == null ? "" : instanceId.toString()},
				{"types",ArrayUtils.toString(type)}};
				
			Map<?,?> parmap = ArrayUtils.toMap(parms);			
			svcctx.addOperationPredicates(parmap);

			// query accounts information
			result = securityservice.getAccounts(svcctx, accountname, instanceId, type, pagequery);
		
		} catch (ServiceException e) {
			ContextHelper.stampContext(e,"excp.find.account");
		}finally{
			
			ContextHelper.handleContext();
		}
		return result;
	}

	/**
	 * authenticate the password
	 **/
	public static Boolean authenticate(AccessPoint accesspoint,
			GPrincipal principal,
			String password)throws CoreException{
		boolean pass = false;
		try (ServiceContext svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.AUTHENTICATE)){
			
			svcctx.addOperationPredicates(new DefaultKeyValue("password", password));
			byte[] pwdbytes;
			try {
				pwdbytes = Base64.decode(principal.getPassword());
				pass =  HashUtils.isExpectedPassword(password.toCharArray(), HASH_SALT.getBytes(), pwdbytes);
				
			} catch (Exception e) {
				LOGGER.error("password not match...", e);				
			}
			// password match means logon success reset the retry_times
			securityservice.updateLogonTrace(svcctx, principal.getUserId(), pass);
		} catch (ServiceException e) {
			ContextHelper.stampContext(e, "excp.authen");
		}finally{
			
			ContextHelper.handleContext();
		}
		return pass;
	}

	/**
	 * change the state of account
	 **/
	public static void changeAccountState(AccessPoint accesspoint,
			GPrincipal principal,
			UserState state)throws CoreException{
		
		try (ServiceContext svcctx = ContextHelper.beginServiceContext(GroupUsers.PSEUDO_USER, accesspoint,
				Operations.CHANGE_ACCOUNT_STATE)){
			
			svcctx.addOperationPredicates(new DefaultKeyValue("state", state.name()));
			
			// password match means logon success reset the retry_times
			securityservice.changeAccountState(svcctx, principal.getUserId(), state);			
			
		} catch (ServiceException e) {
		
			ContextHelper.stampContext(e, "excp.change.state");
			
		}finally{
			
			ContextHelper.handleContext();
		}
	}

	/**
	 * remove the account from system
	 *
	 **/
	public static boolean removeAccount(AccessPoint accesspoint,
			GPrincipal principal,
			InfoId<Long> userId, String account)throws CoreException{
		
		Boolean gresult = false;
		try (ServiceContext svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.REMOVE_ACCOUNT)){
			
			svcctx.addOperationPredicates(new KVPair<String,String>("account", account));
			
			// password match means logon success reset the retry_times
			gresult = securityservice.removeAccount(svcctx, userId, account);
			
		} catch (ServiceException e) {
			
			ContextHelper.stampContext(e, "excp.remove_account");
			
		}finally{
			
			ContextHelper.handleContext();
		}
		return gresult;
	}

	/**
	 * change the account password
	 **/
	public static Boolean changePassword(AccessPoint accesspoint,
			GPrincipal principal,
			String account, 
			String password)throws CoreException{
		
		Boolean gresult = false;
		try (ServiceContext svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.CHANGE_PWD)){
			
			String hashpwd = HashUtils.hashEncodeBase64(password, HASH_SALT);
			// password match means logon success reset the retry_times
			gresult = securityservice.changePassword(svcctx, account, hashpwd);
			
		} catch (ServiceException e) {
			
			ContextHelper.stampContext(e, "excp.change.pwd");
			
		}finally{
			
			ContextHelper.handleContext();
		}
		return gresult;
	}

	/**
	 * Find the user lite information list
	 *
	 * @param userids target users id
	 * @param accounts target user accounts
	 *
	 **/
	public static List<UserLiteInfo> findAccountLites(AccessPoint accesspoint,
												  GPrincipal principal,
												  List<Long> userids,
												  List<String> accounts)throws CoreException{

		List<UserLiteInfo> result = null;

		try(ServiceContext svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.FIND_ACCOUNTS)){

			result = securityservice.getAccounts(svcctx, userids, accounts);

		} catch (Exception e) {

			ContextHelper.stampContext(e,"excp.find.account");
		}finally{

			ContextHelper.handleContext();
		}
		return result;
	}
}
