package com.gp.ga.security;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.ArrayUtils;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gp.web.ActionResult;
import com.gp.web.BaseController;
import com.gp.web.CustomWebUtils;
import com.gp.web.model.Account;
import com.gp.audit.AccessPoint;
import com.gp.common.Cabinets;
import com.gp.common.IdKey;
import com.gp.common.Principal;
import com.gp.common.Users;
import com.gp.common.Users.UserState;
import com.gp.common.Users.UserType;
import com.gp.core.CabinetFacade;
import com.gp.core.GeneralResult;
import com.gp.core.SecurityFacade;
import com.gp.exception.WebException;
import com.gp.info.CabinetInfo;
import com.gp.info.InfoId;
import com.gp.info.UserExInfo;
import com.gp.info.UserInfo;
import com.gp.util.CommonUtils;
import com.gp.util.DateTimeUtils;
import com.gp.validation.ValidationMessage;

@Controller("ga-account-ctlr")
@RequestMapping("/ga")
public class AccountController extends BaseController{

	static Logger LOGGER = LoggerFactory.getLogger(AccountController.class);
	
	static final String ALL_OPTION = "ALL";
	
	static final String VIEW_TAB_LIST = "list";
	static final String VIEW_TAB_EDIT = "edit";
	static final String VIEW_TAB_NEW = "new";
	static final String VIEW_TAB_EXT = "ext";
	
	@RequestMapping("account")
	public ModelAndView doInitial(){
		
		ModelAndView mav = getJspModelView("ga/config/account");
		String viewtab = super.readRequestParam("viewtab");
		
		int exist = ArrayUtils.indexOf(new String[]{VIEW_TAB_LIST,VIEW_TAB_EDIT,VIEW_TAB_NEW,VIEW_TAB_EXT}, viewtab);
		if(-1 == exist){
			viewtab = VIEW_TAB_LIST;
		}
		mav.addObject("viewtab", viewtab);
		Account account = new Account();
		account.setPubcapacity(123l);
		account.setPricapacity(125l);
		mav.addObject("item",account);
		return mav;

	}

	/**
	 * Account search action 
	 *  
	 **/
	@RequestMapping("account-search")
	public ModelAndView doAccountSearch(HttpServletRequest request, HttpServletResponse response) throws WebException {
				
		List<Account> list = new ArrayList<Account>();
		Map<String,Object> pagedata = new HashMap<String,Object>();
		
		Principal principal = super.getPrincipalFromShiro();

		String uname = request.getParameter("uname");
		String instanceStr = request.getParameter("instance_id");
		String type = request.getParameter("type");
		String state = request.getParameter("state");
		Integer instanceId = null;
		if(StringUtils.isNotBlank(instanceStr) && CommonUtils.isNumeric(instanceStr))
			instanceId = Integer.valueOf(instanceStr);
		
		String[] types = null;
		if(ALL_OPTION.equals(type)){
			types = new String[]{
					UserType.INLINE.name(),
					UserType.LDAP.name(),
					UserType.EXTERNAL.name()};
		}else{
			types = new String[]{type};
		}
		String[] states = null;
		if(ALL_OPTION.equals(state)){
			states = new String[]{
					UserState.ACTIVE.name(),
					UserState.DEACTIVE.name(),
					UserState.FROZEN.name()};
		}else{
			states = new String[]{state};
		}
		GeneralResult<List<UserExInfo>> cresult = SecurityFacade.findAccounts(getAccessPoint(request), principal, 
				uname, // name
				instanceId,  // entity
				types,  // type
				states); // state
		
		if(cresult.isSuccess()){
			List<UserExInfo> ulist = cresult.getReturnValue();
			for(UserExInfo info: ulist){
				
				Account ui = new Account();
				ui.setSid(String.valueOf(info.getSourceId()));
				ui.setUid(String.valueOf(info.getInfoId().getId()));
				ui.setAccount(info.getAccount());
				ui.setEmail(info.getEmail());
				ui.setMobile(info.getMobile());
				ui.setType(info.getType());
				if(info.getCreateDate() != null)
					ui.setCreateDate(DateTimeUtils.toYearMonthDay(info.getCreateDate()));
				
				ui.setName(info.getFullName());
				ui.setSourceName(info.getInstanceName());
				ui.setState(info.getState());
	
				list.add(ui);
			}			
			
			pagedata.put(MODEL_KEY_STATE, ActionResult.SUCCESS);
			pagedata.put(MODEL_KEY_MESSAGE, cresult.getMessage());
			pagedata.put(MODEL_KEY_ROWS, list);
		}else{

			pagedata.put(MODEL_KEY_STATE, ActionResult.ERROR);
			pagedata.put(MODEL_KEY_MESSAGE, cresult.getMessage());
		}
		
		ModelAndView mav = getJsonModelView();		
		mav.addAllObjects(pagedata);

		return mav;
	}
		
	@RequestMapping("account-new")
	public ModelAndView doNewAccount(HttpServletRequest request, HttpServletResponse response) throws WebException {
		
		CustomWebUtils.dumpRequestAttributes(request);
		
		Account account = new Account();
		super.readRequestData(request, account);
		
		Principal principal = super.getPrincipalFromShiro();
		AccessPoint accesspoint = super.getAccessPoint(request);
		ActionResult result = new ActionResult();
		
		UserInfo uinfo = new UserInfo();
		uinfo.setAccount(account.getAccount());
		uinfo.setFullName(account.getName());
		uinfo.setLanguage(account.getLanguage());
		uinfo.setEmail(account.getEmail());
		uinfo.setPassword(account.getPassword());
		uinfo.setPhone(account.getPhone());
		uinfo.setMobile(account.getMobile());
		uinfo.setTimeZone(account.getTimezone());
		uinfo.setType(account.getType());
		uinfo.setStorageId(account.getStorage());
		uinfo.setState(Users.UserState.ACTIVE.name());
		
		Long pubcapacity = account.getPubcapacity();
		Long pricapacity = account.getPricapacity();
		
		GeneralResult<InfoId<Long>> gresult = SecurityFacade.newAccount(accesspoint, principal, uinfo, pubcapacity, pricapacity);
		
		if(!gresult.isSuccess() && gresult.hasValidationMessage()){
			List<ValidationMessage> msg = gresult.getMessages();
			
			result.setState(ActionResult.ERROR);
			result.setMessage(gresult.getMessage());
			result.setDetailmsgs(msg);
		}else{
			
			result.setState(ActionResult.SUCCESS);
			result.setMessage(gresult.getMessage());
		}
		
		ModelAndView mav = getJsonModelView();		
		mav.addAllObjects(result.asMap());

		return mav;
	}

	@RequestMapping("account-update")
	public ModelAndView doAccountUpdate(HttpServletRequest request, HttpServletResponse response) throws WebException {
		
		CustomWebUtils.dumpRequestAttributes(request);
		
		Account account = new Account();
		super.readRequestData(request, account);
		
		Principal principal = super.getPrincipalFromShiro();
		AccessPoint accesspoint = super.getAccessPoint(request);
		ActionResult result = new ActionResult();
		
		UserInfo uinfo = new UserInfo();
		InfoId<Long> uid = IdKey.USER.getInfoId(Long.valueOf(account.getUid()));
		uinfo.setInfoId(uid);
		uinfo.setAccount(account.getAccount());
		uinfo.setFullName(account.getName());
		uinfo.setLanguage(account.getLanguage());
		uinfo.setEmail(account.getEmail());
		uinfo.setPassword(account.getPassword());
		uinfo.setPhone(account.getPhone());
		uinfo.setMobile(account.getMobile());
		uinfo.setTimeZone(account.getTimezone());
		uinfo.setType(account.getType());
		uinfo.setStorageId(account.getStorage());
		uinfo.setState(account.getState());
		
		Long pubcapacity = account.getPubcapacity();
		Long pricapacity = account.getPricapacity();
		
		GeneralResult<Boolean> gresult = SecurityFacade.saveAccount(accesspoint, principal, uinfo, pubcapacity, pricapacity);
		
		if(!gresult.isSuccess() && gresult.hasValidationMessage()){
			List<ValidationMessage> msg = gresult.getMessages();
			
			result.setState(ActionResult.ERROR);
			result.setMessage(gresult.getMessage());
			result.setDetailmsgs(msg);
		}else{
			
			result.setState(ActionResult.SUCCESS);
			result.setMessage(gresult.getMessage());
		}
		
		ModelAndView mav = getJsonModelView();		
		mav.addAllObjects(result.asMap());

		return mav;
	}
	
	/**
	 * the parameter :
	 * user_id 
	 * src_id 
	 * type
	 * account 
	 **/
	@RequestMapping("account-info")
	public ModelAndView doAccountInfo(HttpServletRequest request){

		String account = request.getParameter("account");
		String type = request.getParameter("type");
		String uidStr = request.getParameter("user_id");

		AccessPoint accesspoint = super.getAccessPoint(request);
		Principal principal = super.getPrincipalFromShiro();
		Long userId = null;

		InfoId<Long> userkey = null;
		if(StringUtils.isNotBlank(uidStr) && CommonUtils.isNumeric(uidStr) ){
			userId = Long.valueOf(uidStr);
			userkey = IdKey.USER.getInfoId(userId);
		}

		GeneralResult<UserInfo> gresult = SecurityFacade.findAccount(accesspoint,principal, userkey,account, type);
		ActionResult result = new ActionResult();
		
		if(gresult.isSuccess() && gresult.getReturnValue() != null){
			UserInfo info = gresult.getReturnValue();
			Account ui = new Account();
			ui.setUid(String.valueOf(info.getInfoId().getId()));
			ui.setAccount(info.getAccount());
			ui.setEmail(info.getEmail());
			ui.setMobile(info.getMobile());
			ui.setType(info.getType());
			ui.setPhone(info.getPhone());
			ui.setName(info.getFullName());
			ui.setState(info.getState());
			ui.setStorage(info.getStorageId());
			ui.setLanguage(info.getLanguage());
			ui.setTimezone(info.getTimeZone());

			GeneralResult<List<CabinetInfo>> cabs = CabinetFacade.findPersonCabinets(accesspoint,Users.PESUOD_USER,info.getAccount());
			for(CabinetInfo cinfo: cabs.getReturnValue()){
				if(Cabinets.CabinetType.NETDISK.name().equals(cinfo.getCabinetType()))
					ui.setPricapacity(cinfo.getCapacity());
				
				else if(Cabinets.CabinetType.PUBLISH.name().equals(cinfo.getCabinetType()))
					ui.setPubcapacity(cinfo.getCapacity());
			}
			result.setState(ActionResult.SUCCESS);
			result.setMessage(gresult.getMessage());
			result.setData(ui);
		}else{
			result.setState(ActionResult.ERROR);
			result.setMessage(gresult.getMessage());
		}
		ModelAndView mav = getJsonModelView();		
		mav.addAllObjects(result.asMap());

		return mav;
	}
	
	@RequestMapping("account-delete")
	public ModelAndView doAccountDelete(HttpServletRequest request, HttpServletResponse response){
		
		CustomWebUtils.dumpRequestAttributes(request);
		
		String account = request.getParameter("account");
		String uid = request.getParameter("user_id");
		
		ActionResult result = new ActionResult();
		Principal principal = super.getPrincipalFromShiro();
		AccessPoint accesspoint = super.getAccessPoint(request);
		Long userId = null;
		InfoId<Long> userkey = null;
		if(StringUtils.isNotBlank(uid) && CommonUtils.isNumeric(uid)){
			userId = Long.valueOf(uid);
			userkey = IdKey.USER.getInfoId(userId);
		}
		GeneralResult<Boolean> gresult = SecurityFacade.removeAccount(accesspoint, principal, userkey, account);
		if(gresult.isSuccess() && gresult.getReturnValue()){
			
			result.setState(ActionResult.SUCCESS);
			result.setMessage(gresult.getMessage());
		}else{
			result.setState(ActionResult.ERROR);
			result.setMessage(gresult.getMessage());
		}
		ModelAndView mav = getJsonModelView();		
		mav.addAllObjects(result.asMap());

		return mav;
	}
}
