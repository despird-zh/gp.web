package com.gp.core;

import java.util.List;
import java.util.Map;

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
import com.gp.dao.PseudoDAO;
import com.gp.common.GeneralContext.ExecState;
import com.gp.exception.ServiceException;
import com.gp.info.InfoId;
import com.gp.info.StorageInfo;
import com.gp.pagination.PageQuery;
import com.gp.pagination.PageWrapper;
import com.gp.svc.IdService;
import com.gp.svc.StorageService;
import com.gp.validation.ValidationMessage;
import com.gp.validation.ValidationUtils;

@Component
public class StorageFacade {

	static Logger LOGGER = LoggerFactory.getLogger(StorageFacade.class);

	private static IdService idService;

	private static StorageService storageService;
	
	@Autowired
    private StorageFacade(IdService idService,StorageService storageService, PseudoDAO pseudodao) {

    	StorageFacade.idService = idService;
    	StorageFacade.storageService = storageService;
    }
    
	/**
	 * This is used for dropdown list paging request 
	 **/
    public static GeneralResult<PageWrapper<StorageInfo>> findStorages(AccessPoint accesspoint,
    		Principal principal, String storagename, PageQuery pagequery){
    	
    	GeneralResult<PageWrapper<StorageInfo>> result = new GeneralResult<PageWrapper<StorageInfo>>();
    	
    	try(ServiceContext<?> svcctx = ContextHelper.beginServiceContext(principal, accesspoint, 
    			Operations.FIND_STORAGES)){
			String[][] parms = new String[][]{
				{"storagename",storagename}};				
			Map<?,?> parmap = ArrayUtils.toMap(parms);			
			svcctx.addAuditPredicates(parmap);
			
			PageWrapper<StorageInfo> pwrapper = storageService.getStorages(svcctx, storagename, pagequery);
			result.setReturnValue(pwrapper);
			
			result.setMessage("success get storages ", true);	
			
    	}catch(ServiceException se){
    		
    		LOGGER.error("Fail query storage informations",se);
    		ContextHelper.stampContext(se);
    		result.setMessage("fail get storages ", false);
    	}finally{
    		
    		ContextHelper.handleContext();
    	}
    	
    	return result;
    }
       
    /**
     * for screen search storage list
     **/
    public static GeneralResult<List<StorageInfo>> findStorages(AccessPoint accesspoint,
    		Principal principal, String storagename, String[] types, String[] states){
    	
    	GeneralResult<List<StorageInfo>> result = new GeneralResult<List<StorageInfo>>();
    	
    	try(ServiceContext<?> svcctx = ContextHelper.beginServiceContext(principal, accesspoint, 
    			Operations.FIND_STORAGES)){
			String[][] parms = new String[][]{
				{"storagename",storagename}};				
			Map<?,?> parmap = ArrayUtils.toMap(parms);			
			svcctx.addAuditPredicates(parmap);
			
			List<StorageInfo> pwrapper = storageService.getStorages(svcctx, storagename, types, states);
			result.setReturnValue(pwrapper);
			
			result.setMessage("success get storages ", true);	
			
    	}catch(ServiceException se){
    		
    		LOGGER.error("Fail query storage informations",se);
    		ContextHelper.stampContext(se);
    		result.setMessage("fail get storages ", false);
    	}finally{
    		
    		ContextHelper.handleContext();
    	}
    	
    	return result;
    }
    
    public static GeneralResult<InfoId<Integer>> newStorage(AccessPoint accesspoint,
    		Principal principal, StorageInfo storage){
		
    	GeneralResult<InfoId<Integer>> result = new GeneralResult<InfoId<Integer>>();
    	
		try (ServiceContext<?> svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.NEW_STORAGE)){

			svcctx.addAuditPredicates(storage);
			// check the validation of user information
			List<ValidationMessage> vmsg = ValidationUtils.validate(principal.getLocale(), storage);
			if(null != vmsg && vmsg.size() > 0){ // fail pass validation
				result.addMessages(vmsg);				
				svcctx.endAudit(ExecState.FAIL, "row info validation fail");
				result.setMessage("fail save storage ", false);
				return result;
			}
			
			if(!InfoId.isValid(storage.getInfoId())){
				InfoId<Integer> id = idService.generateId(IdKey.STORAGE, Integer.class);
				storage.setInfoId(id);				
				svcctx.setAuditObject(id);
			}else{
								
				svcctx.setAuditObject(storage.getInfoId());
			}
			
			storageService.newStorage(svcctx, storage);
			result.setReturnValue(storage.getInfoId());
			result.setMessage("success save storage ", true);
			
		} catch (ServiceException e)  {
			LOGGER.error("Fail query accounts",e);
			ContextHelper.stampContext(e);
			result.setMessage("fail save storage ", false);
		}finally{
			
			ContextHelper.handleContext();
		}
    	
    	return result;
    	
    }
    
    public static GeneralResult<StorageInfo> findStorage(AccessPoint accesspoint,
    		Principal principal, InfoId<Integer> storageid){
    	
    	GeneralResult<StorageInfo> gresult = new GeneralResult<StorageInfo>();
    	
		if(!InfoId.isValid(storageid)){
			ValidationMessage noidmsg = new ValidationMessage("storage_id", "miss required storage id");
			gresult.addMessage( noidmsg);
			gresult.setReturnValue(null);
			gresult.setMessage("fail to valid the message.", false);
			return gresult;
		}
		
		try (ServiceContext<?> svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.FIND_STORAGE)){
			
			svcctx.setAuditObject(storageid);
			
			StorageInfo sinfo = storageService.getStorage(svcctx, storageid);
			gresult.setReturnValue(sinfo);
			
			gresult.setMessage("success to find storage.", true);
		} catch (ServiceException e)  {
			
			ContextHelper.stampContext(e);
			gresult.setMessage("fail to find storage.", false);
		}finally{
			
			ContextHelper.handleContext();
		}
    	return gresult;
    }
    
    public static GeneralResult<Boolean> saveStorage(AccessPoint accesspoint,
    		Principal principal, StorageInfo storage){
    	
    	GeneralResult<Boolean> gresult = new GeneralResult<Boolean>();
    	
		if(!InfoId.isValid(storage.getInfoId())){
			ValidationMessage noidmsg = new ValidationMessage("storage_id", "miss required storage id");
			gresult.addMessage( noidmsg);
			gresult.setReturnValue(null);
			gresult.setMessage("fail to valid the message.", false);
			return gresult;
		}
		
		try (ServiceContext<?> svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.UPDATE_STORAGE)){
			
			svcctx.setAuditObject(storage.getInfoId());
			svcctx.addAuditPredicates(storage);
			storageService.updateStorage(svcctx, storage);
			gresult.setReturnValue(true);
			
			gresult.setMessage("success to save storage.", true);
		} catch (ServiceException e)  {
			
			ContextHelper.stampContext(e);
			gresult.setMessage("fail to save storage.", false);
		}finally{
			
			ContextHelper.handleContext();
		}
    	return gresult;
    }
    
    public static GeneralResult<Boolean> removeStorage(AccessPoint accesspoint,
    		Principal principal, InfoId<Integer> storageid){
    	
    	GeneralResult<Boolean> gresult = new GeneralResult<Boolean>();
    	
		if(!InfoId.isValid(storageid)){
			ValidationMessage noidmsg = new ValidationMessage("storage_id", "miss required storage id");
			gresult.addMessage( noidmsg);
			gresult.setReturnValue(false);
			gresult.setMessage("fail to valid the message.", false);
			return gresult;
		}
		
		try (ServiceContext<?> svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.REMOVE_STORAGE)){
			
			svcctx.setAuditObject(storageid);
			boolean rst = storageService.removeStorage(svcctx, storageid);
			gresult.setReturnValue(rst);
			if(rst){
				gresult.setMessage("success to remove storage.", true);
			}else{
				gresult.setMessage("fail to remove storage.", false);
			}
		} catch (ServiceException e)  {
			
			ContextHelper.stampContext(e);
			gresult.setMessage("fail to remove storage.", false);
		}finally{
			
			ContextHelper.handleContext();
		}
    	return gresult;
    }
}
