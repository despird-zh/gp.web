package com.gp.core;

import java.util.List;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.gp.audit.AccessPoint;
import com.gp.common.Operations;
import com.gp.common.Principal;
import com.gp.common.ServiceContext;
import com.gp.exception.CoreException;
import com.gp.exception.ServiceException;
import com.gp.info.DictionaryInfo;
import com.gp.info.InfoId;
import com.gp.svc.DictionaryService;
import com.gp.validate.ValidateMessage;
import com.gp.validate.ValidateUtils;

@Component
public class DictionaryFacade {

	static Logger LOGGER = LoggerFactory.getLogger(DictionaryFacade.class);
	
	private static DictionaryService dictservice;
	
	@Autowired
	private DictionaryFacade(DictionaryService dictservice){
		DictionaryFacade.dictservice = dictservice;
	}

	/**
	 * Find the dictionary entries from database.
	 * @param groupkey the entry group key
	 * @param language the language expected 
	 **/
	public static List<DictionaryInfo> findDictEntries(AccessPoint accesspoint,
			Principal principal, String groupkey, String language) throws CoreException{
		
		List<DictionaryInfo> gresult = null;
		
		try(ServiceContext svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.FIND_DICTS)){

			gresult = dictservice.getDictEntries(svcctx);
			
		} catch (ServiceException e) {
			
			ContextHelper.stampContext(e);
			
		}finally{
			
			ContextHelper.handleContext();
		}
		return gresult;
	}
	
	public static Boolean saveDictEntry(AccessPoint accesspoint,
			Principal principal, DictionaryInfo dictinfo) throws CoreException{
		
		if(!InfoId.isValid(dictinfo.getInfoId())){
			CoreException cexcp = new CoreException(principal.getLocale(), "excp.save.dict");
			cexcp.addValidateMessage("prop.dictid", "mesg.prop.miss");
			throw cexcp;
		}
		
		boolean state = false;
		try(ServiceContext svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.UPDATE_DICT)){
			
			svcctx.setAuditObject(dictinfo.getInfoId());
			svcctx.addAuditPredicates(dictinfo);
			
			Set<ValidateMessage> vmsg = ValidateUtils.validate(principal.getLocale(), dictinfo);
			if(null != vmsg && vmsg.size() > 0){ // fail pass validation
				CoreException cexcp = new CoreException(principal.getLocale(), "excp.save.dict");			
				cexcp.addValidateMessages(vmsg);
				throw cexcp;
			}
			
			state = dictservice.updateDictEntry(svcctx, dictinfo);
		} catch (Exception e) {
			
			LOGGER.error("Fail query dict entry",e);
			ContextHelper.stampContext(e);
	
		}finally{
			
			ContextHelper.handleContext();
		}
		
		return state;
	}
}
