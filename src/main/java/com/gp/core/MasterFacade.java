package com.gp.core;

import java.util.List;
import java.util.Map;

import org.apache.commons.collections.keyvalue.DefaultKeyValue;
import org.apache.commons.lang.ArrayUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.gp.audit.AccessPoint;
import com.gp.common.Operations;
import com.gp.common.Principal;
import com.gp.common.ServiceContext;
import com.gp.common.GeneralContext.ExecState;
import com.gp.exception.ServiceException;
import com.gp.info.DictionaryInfo;
import com.gp.info.InfoId;
import com.gp.info.SysOptionInfo;
import com.gp.svc.DictionaryService;
import com.gp.svc.SystemService;
import com.gp.validation.ValidationMessage;
import com.gp.validation.ValidationUtils;

@Component
public class MasterFacade {

	static Logger LOGGER = LoggerFactory.getLogger(MasterFacade.class);
	
	static SystemService systemservice;
	
	static DictionaryService dictservice;
	
	@Autowired
	private MasterFacade(SystemService systemservice, DictionaryService dictservice){
		MasterFacade.systemservice = systemservice;
		MasterFacade.dictservice = dictservice;
	}
		
	public static GeneralResult<Boolean> saveSystemOption(AccessPoint accesspoint,
			Principal principal,
			String optionKey,
			String optionValue){
		
		GeneralResult<Boolean> result = new GeneralResult<Boolean>();
		
		try (ServiceContext<?> svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.UPDATE_SYSOPTION)){
			
			SysOptionInfo sinfo = systemservice.getOption(svcctx, optionKey);
			svcctx.setAuditObject(sinfo.getInfoId());
			svcctx.addAuditPredicates(new DefaultKeyValue("value", optionValue));

			Boolean success =  systemservice.updateOption(svcctx, optionKey, optionValue);
			
			result.setReturnValue(success);			
			result.setMessage("success save system option ", true);
		} catch (ServiceException e)  {
			LOGGER.error("Fail query accounts",e);
			ContextHelper.stampContext(e);
			result.setMessage("fail save system option ", false);
		}finally{
			
			ContextHelper.handleContext();
		}
		return result;		
		
	}
	
	public static GeneralResult<List<SysOptionInfo>> findSystemOptions(AccessPoint accesspoint,
			Principal principal,
			String groupKey){
			
		GeneralResult<List<SysOptionInfo>> result = new GeneralResult<List<SysOptionInfo>>();		
		try(ServiceContext<?> svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.FIND_SYSOPTIONS)){
			
			String[][] parms = new String[][]{
				{"groupkey",groupKey}};				
			Map<?,?> parmap = ArrayUtils.toMap(parms);			
			svcctx.addAuditPredicates(parmap);

			// query accounts information
			List<SysOptionInfo> pwrapper = systemservice.getOptions(svcctx, groupKey);
			
			result.setReturnValue(pwrapper);
			result.setMessage("success get options ", true);			
			
		} catch (Exception e) {
			
			LOGGER.error("Fail query system options",e);
			ContextHelper.stampContext(e);
			result.setMessage("fail get options ", false);
			
		}finally{
			
			ContextHelper.handleContext();
		}
		
		return result;
	}
	
	public static GeneralResult<List<String>> findSystemOptionGroups(AccessPoint accesspoint,
			Principal principal){
		
		GeneralResult<List<String>> result = new GeneralResult<List<String>>();
		
		try(ServiceContext<?> svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.FIND_SYSOPT_GRPS)){

			List<String> groups = systemservice.getOptionGroups(svcctx);
			result.setReturnValue(groups);
			result.setMessage("success get option groups ", true);
			
		} catch (Exception e) {
			
			LOGGER.error("Fail query option group",e);
			ContextHelper.stampContext(e);
			result.setMessage("fail get option groups ", false);
			
		}finally{
			
			ContextHelper.handleContext();
		}
		return result;
	}

	public static GeneralResult<List<DictionaryInfo>> findDictEntries(AccessPoint accesspoint,
			Principal principal, String groupkey, String language){
		
		GeneralResult<List<DictionaryInfo>> gresult = new GeneralResult<List<DictionaryInfo>>();
		
		try(ServiceContext<?> svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
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
		try(ServiceContext<?> svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
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
