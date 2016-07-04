package com.gp.web.workspace;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gp.audit.AccessPoint;
import com.gp.common.Cabinets;
import com.gp.common.IdKey;
import com.gp.common.Principal;
import com.gp.core.CabinetFacade;
import com.gp.core.PersonalFacade;
import com.gp.core.SecurityFacade;
import com.gp.core.StorageFacade;
import com.gp.exception.CoreException;
import com.gp.info.CabinetInfo;
import com.gp.info.OrgHierInfo;
import com.gp.info.StorageInfo;
import com.gp.info.UserInfo;
import com.gp.info.WorkgroupInfo;
import com.gp.util.HashUtils;
import com.gp.web.ActionResult;
import com.gp.web.BaseController;
import com.gp.web.model.Account;
import com.gp.web.model.UserBelonging;

@Controller("ws-setting-ctrl")
@RequestMapping("/workspace")
public class SettingController  extends BaseController{
	
	@RequestMapping("setting")
	public ModelAndView doInitial(){
		
		return getJspModelView("workspace/setting");
		
	}
	
	@RequestMapping("basic-setting")
	public ModelAndView doBasicSettingSearch(HttpServletRequest request){
		
		ModelAndView mav = super.getJsonModelView();
		ActionResult result = new ActionResult();
		
		Principal principal = super.getPrincipalFromShiro();
		AccessPoint accesspoint = super.getAccessPoint(request);
		
		try {
			UserInfo uinfo = PersonalFacade.findAccountBasic(accesspoint, principal, principal.getUserId());
			Account ui = new Account();
			
			ui.setSourceId(uinfo.getSourceId());
			ui.setUserId(uinfo.getInfoId().getId());
			ui.setAccount(uinfo.getAccount());
			ui.setEmail(uinfo.getEmail());
			ui.setMobile(uinfo.getMobile());
			ui.setPhone(uinfo.getPhone());
			ui.setType(uinfo.getType());
			ui.setName(uinfo.getFullName());
			ui.setState(uinfo.getState());
			
			Integer storageId = uinfo.getStorageId();
			StorageInfo storage = StorageFacade.findStorage(accesspoint, principal, 
					IdKey.STORAGE.getInfoId(storageId));
			ui.setSourceId(storageId);
			ui.setStorageName(storage.getStorageName());
			
			List<CabinetInfo> cabs = CabinetFacade.findPersonalCabinets(accesspoint, principal, 
					principal.getAccount());
			
			for(CabinetInfo cinfo: cabs){
				if(Cabinets.CabinetType.PUBLISH.name().equals(cinfo.getCabinetType())){
					ui.setPubcapacity(cinfo.getCapacity());
				}else{
					ui.setPricapacity(cinfo.getCapacity());
				}
			}
			ui.setLanguage(uinfo.getLanguage());
			ui.setTimezone(uinfo.getTimeZone());
			
			result.setData(ui);
			
			result.setState(ActionResult.SUCCESS);
			result.setMessage(getMessage("mesg.find.account"));
		} catch (CoreException e) {
			result.setState(ActionResult.FAIL);
			result.setMessage(e.getMessage());
		}
		
		mav.addAllObjects(result.asMap());
		return mav;
	}
	
	@RequestMapping("belongings")
	public ModelAndView doBelongingSearch(HttpServletRequest request){
		
		ModelAndView mav = super.getJsonModelView();
		ActionResult result = new ActionResult();
		
		Principal principal = super.getPrincipalFromShiro();
		AccessPoint accesspoint = super.getAccessPoint(request);
		
		try{
			Map<String, Object> data = new HashMap<String, Object>();
			
			List<OrgHierInfo> orgs = PersonalFacade.findAccountOrgHierNodes(accesspoint, principal, principal.getAccount());
			List<UserBelonging> orgbelongs = new ArrayList<UserBelonging>();
			for(OrgHierInfo oinfo: orgs){
				UserBelonging ubelong = new UserBelonging();
				ubelong.setBelongId(oinfo.getInfoId().getId());
				ubelong.setName(oinfo.getOrgName());
				ubelong.setType("org");
				ubelong.setPostVisible(true);
				
				orgbelongs.add(ubelong);
			}
			data.put("orghiers", orgbelongs);
			
			List<WorkgroupInfo> grps = PersonalFacade.findAccountWorkgroups(accesspoint, principal, principal.getAccount());
			List<UserBelonging> wgroups = new ArrayList<UserBelonging>();
			for(WorkgroupInfo winfo: grps){
				UserBelonging ubelong = new UserBelonging();
				ubelong.setBelongId(winfo.getInfoId().getId());
				ubelong.setName(winfo.getWorkgroupName());
				ubelong.setType("wgroup");
				ubelong.setPostVisible(true);
				
				wgroups.add(ubelong);
			}
			data.put("workgroups", wgroups);
			result.setData(data);
			result.setState(ActionResult.SUCCESS);
			result.setMessage(getMessage("mesg.find.belongs"));
		}catch (CoreException e) {
			result.setState(ActionResult.FAIL);
			result.setMessage(e.getMessage());
		}
		mav.addAllObjects(result.asMap());
		return mav;
	}
	
	@RequestMapping("change-pwd")
	public ModelAndView doChangePassword(HttpServletRequest request){
		
		ModelAndView mav = super.getJsonModelView();
		ActionResult result = new ActionResult();
		
		Principal principal = super.getPrincipalFromShiro();
		AccessPoint accesspoint = super.getAccessPoint(request);
		String newpwd = request.getParameter("new-password");
		String cfmpwd = request.getParameter("confirm-password");
		String oripwd = request.getParameter("origin-password");
		
		String hashpwd = HashUtils.hashEncodeBase64(oripwd, SecurityFacade.HASH_SALT);
		try{
			UserInfo uinfo = SecurityFacade.findAccountLite(accesspoint, principal, null, principal.getAccount(), null);
			if(!StringUtils.equals(newpwd, cfmpwd)){
				
				result.setState(ActionResult.FAIL);
				result.setMessage(getMessage("excp.pwd.confirm.diff"));
				
			}else if(!StringUtils.equals(hashpwd, uinfo.getPassword())){
				
				result.setState(ActionResult.FAIL);
				result.setMessage(getMessage("excp.pwd.wrong"));
				
			}else{
				
				SecurityFacade.changePassword(accesspoint, principal, principal.getAccount(), newpwd);
				result.setState(ActionResult.SUCCESS);
				result.setMessage(getMessage("mesg.change.pwd"));
			}
		}catch (CoreException e) {
			result.setState(ActionResult.FAIL);
			result.setMessage(e.getMessage());
		}
		
		mav.addAllObjects(result.asMap());
		return mav;
	}
}