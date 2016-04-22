package com.gp.ga.master;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gp.audit.AccessPoint;
import com.gp.common.IdKey;
import com.gp.common.Principal;
import com.gp.core.GeneralResult;
import com.gp.core.MasterFacade;
import com.gp.info.DictionaryInfo;
import com.gp.info.InfoId;
import com.gp.validation.ValidationMessage;
import com.gp.web.ActionResult;
import com.gp.web.BaseController;
import com.gp.web.model.DictEntry;

@Controller("ga-dict-ctlr")
@RequestMapping("/ga")
public class DictEntriesController  extends BaseController{

	static SimpleDateFormat MDF_DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	@RequestMapping("dict-list")
	public ModelAndView doInitial(){
		
		return getJspModelView("ga/master/dict-list");
	}
	
	@RequestMapping("dict-search")
	public ModelAndView doEntriesSearch(HttpServletRequest request){
		
		ModelAndView mav = super.getJsonModelView();
		Principal principal = super.getPrincipalFromShiro();
		AccessPoint accesspoint = super.getAccessPoint(request);
		
		List<DictEntry> list = new ArrayList<DictEntry>();
		GeneralResult<List<DictionaryInfo>> gresult = MasterFacade.findDictEntries(accesspoint, principal, "", "");
		
		if(gresult.isSuccess()){
			for(DictionaryInfo info: gresult.getReturnValue()){
				DictEntry de = new DictEntry();
				de.setEntryId(info.getInfoId().getId());
				de.setEntryKey(info.getKey());
				de.setGroupKey(info.getGroup());
				de.setEntryValue(info.getValue());
				de.setLabel(info.getLabel());
				de.setLanguage(info.getLanguage());
				de.setModifier(info.getModifier());
				de.setModifyDate(MDF_DATE_FORMAT.format(info.getModifyDate()));
				
				list.add(de);
			}
			mav.addObject(MODEL_KEY_ROWS,list);
			mav.addObject(MODEL_KEY_STATE, ActionResult.SUCCESS);
			mav.addObject(MODEL_KEY_MESSAGE, "ok");
		}else{
			mav.addObject(MODEL_KEY_STATE, ActionResult.FAIL);
			mav.addObject(MODEL_KEY_MESSAGE, "fail");
		}
		
		return mav;
	}
	
	@RequestMapping("dict-save")
	public ModelAndView doEntrySave(HttpServletRequest request){
		
		ModelAndView mav = super.getJsonModelView();
		ActionResult result = new ActionResult();
		DictEntry dentry = new DictEntry();
		Principal principal = super.getPrincipalFromShiro();
		AccessPoint accesspoint = super.getAccessPoint(request);
		super.readRequestData(dentry);// read request data.
		
		DictionaryInfo dinfo = new DictionaryInfo();
		InfoId<Long> did = IdKey.DICTIONARY.getInfoId(dentry.getEntryId());
		dinfo.setInfoId(did);
		dinfo.setKey(dentry.getEntryKey());
		dinfo.setValue(dentry.getEntryValue());
		dinfo.setGroup(dentry.getGroupKey());
		dinfo.setLabel(dentry.getLabel());
		dinfo.setLanguage(dentry.getLanguage());
		
		GeneralResult<Boolean> gresult = MasterFacade.saveDictEntry(accesspoint, principal, dinfo);
		if(!gresult.isSuccess()){
			List<ValidationMessage> msg = gresult.getMessages();
			
			result.setState(ActionResult.ERROR);
			result.setMessage(gresult.getMessage());
			result.setDetailmsgs(msg);
		}else{
			result.setData(gresult.getReturnValue());
			result.setState(ActionResult.SUCCESS);
			result.setMessage(gresult.getMessage());
		}
		
		mav.addAllObjects(result.asMap());
		return mav;
	}
	
}
