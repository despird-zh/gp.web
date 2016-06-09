package com.gp.core;

import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.gp.audit.AccessPoint;
import com.gp.common.Operations;
import com.gp.common.Principal;
import com.gp.common.ServiceContext;
import com.gp.common.GeneralContext.ExecState;
import com.gp.info.DictionaryInfo;
import com.gp.info.InfoId;
import com.gp.svc.DictionaryService;
import com.gp.validation.ValidationMessage;
import com.gp.validation.ValidationUtils;

@Component
public class DictionaryFacade {

	static Logger LOGGER = LoggerFactory.getLogger(MasterFacade.class);
	
	static DictionaryService dictservice;
	
	@Autowired
	private DictionaryFacade(DictionaryService dictservice){

		MasterFacade.dictservice = dictservice;
	}
	
	public static String findMessagePattern(String key, Locale locale){
		return key;
		
		
	}
	

	/**
	 * Find the dictionary entries from database.
	 * @param groupkey the entry group key
	 * @param language the language expected 
	 **/
	public static GeneralResult<List<DictionaryInfo>> findDictEntries(AccessPoint accesspoint,
			Principal principal, String groupkey, String language){
		
		GeneralResult<List<DictionaryInfo>> gresult = new GeneralResult<List<DictionaryInfo>>();
		
		try(ServiceContext svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.FIND_DICTS)){

			List<DictionaryInfo> dicts = dictservice.getDictEntries(svcctx);
			gresult.setReturnValue(dicts);
			gresult.setMessage("success get option groups ", true);
			
		} catch (Exception e) {
			
			LOGGER.error("Fail query option group",e);
			ContextHelper.stampContext(e);
			gresult.setMessage("fail get option groups ", false);
			
		}finally{
			
			ContextHelper.handleContext();
		}
		return gresult;
	}
	
	public static GeneralResult<Boolean> saveDictEntry(AccessPoint accesspoint,
			Principal principal, DictionaryInfo dictinfo){
		
		GeneralResult<Boolean> gresult = new GeneralResult<Boolean>();
		
		if(!InfoId.isValid(dictinfo.getInfoId())){
			ValidationMessage noidmsg = new ValidationMessage("dict_id", "miss required dict entry id");
			gresult.addMessage(noidmsg);
			gresult.setMessage("fail to valid the message.", false);
			gresult.setReturnValue(false);
			return gresult;
		}
		try(ServiceContext svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.UPDATE_DICT)){
			
			svcctx.setAuditObject(dictinfo.getInfoId());
			svcctx.addAuditPredicates(dictinfo);
			
			List<ValidationMessage> vmsg = ValidationUtils.validate(principal.getLocale(), dictinfo);
			if(null != vmsg && vmsg.size() > 0){ // fail pass validation
				gresult.addMessages(vmsg);				
				svcctx.endAudit(ExecState.EXCEP, "row info validation fail");
				return gresult;
			}
			
			boolean state = dictservice.updateDictEntry(svcctx, dictinfo);
			gresult.setReturnValue(state);
			gresult.setMessage("success save dict entry", true);
			
		} catch (Exception e) {
			
			LOGGER.error("Fail query dict entry",e);
			ContextHelper.stampContext(e);
			gresult.setMessage("fail save dict entry", false);			
		}finally{
			
			ContextHelper.handleContext();
		}
		return gresult;
	}
}
