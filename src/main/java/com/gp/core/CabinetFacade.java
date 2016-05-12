package com.gp.core;

import java.io.File;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.gp.audit.AccessPoint;
import com.gp.common.Cabinets;
import com.gp.common.IdKey;
import com.gp.common.Operations;
import com.gp.common.Principal;
import com.gp.common.ServiceContext;
import com.gp.common.GeneralContext.ExecState;
import com.gp.exception.ServiceException;
import com.gp.info.CabFileInfo;
import com.gp.info.CabFolderInfo;
import com.gp.info.CabinetInfo;
import com.gp.info.InfoId;
import com.gp.svc.CabinetService;
import com.gp.svc.FileService;
import com.gp.svc.FolderService;
import com.gp.svc.IdService;
import com.gp.util.DateTimeUtils;
import com.gp.validation.ValidationMessage;
import com.gp.validation.ValidationUtils;

@Component
public class CabinetFacade {
	
	static Logger LOGGER = LoggerFactory.getLogger(CabinetFacade.class);
	
	static CabinetService cabinetservice;
	
	static FolderService folderservice;
	
	static FileService fileservice;
	
	static IdService idservice;
	
	@Autowired
	private CabinetFacade(CabinetService cabinetservice, 
			FolderService folderservice, 
			FileService fileservice,
			IdService idservice){
		
		CabinetFacade.cabinetservice = cabinetservice;
		CabinetFacade.fileservice = fileservice;
		CabinetFacade.folderservice = folderservice;
		CabinetFacade.idservice = idservice;
	}
	
	/**
	 * Find the Cabinets of an account. include public and private cabinet. 
	 **/
	public static GeneralResult<List<CabinetInfo>> findPersonCabinets(AccessPoint accesspoint,
			Principal principal,
			String account){
		
		GeneralResult<List<CabinetInfo>> gresult  =  new GeneralResult<List<CabinetInfo>>();
	
		try(ServiceContext<?> svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.FIND_CABINETS)){
			
			List<CabinetInfo> cabs = cabinetservice.getCabinets(svcctx, account);
			gresult.setReturnValue(cabs);
			gresult.setMessage("success to find person cabinets.", true);
		} catch (ServiceException e)  {
			LOGGER.error("Exception when find instance",e);
			ContextHelper.stampContext(e);
			gresult.setMessage("fail to find person cabinets.", false);
		}finally{
			
			ContextHelper.handleContext();
		}
		
		return gresult;
	}
	
	//
	public static GeneralResult<Boolean> savePubCabinetFolder(AccessPoint accesspoint,
			Principal principal, CabFolderInfo folderinfo){
		
		GeneralResult<Boolean> gresult  =  new GeneralResult<Boolean>();
		try(ServiceContext<?> svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.NEW_FOLDER)){
			
			CabinetInfo cabinfo = folderservice.getCabinetInfo(folderinfo.getParentId());
			InfoId<Long> fkey = idservice.generateId(IdKey.CAB_FOLDER, Long.class);
			folderinfo.setInfoId(fkey);
			folderinfo.setCabinetId(cabinfo.getInfoId().getId());
			folderinfo.setCreateDate(DateTimeUtils.now());
			folderinfo.setCreator(principal.getAccount());
			InfoId<Long> parentkey  = IdKey.CAB_FOLDER.getInfoId(folderinfo.getParentId());
			folderinfo.setState(Cabinets.FolderState.READY.name());
			// check the validation of folder information
			List<ValidationMessage> vmsg = ValidationUtils.validate(principal.getLocale(), folderinfo);
			if(null != vmsg && vmsg.size() > 0){ // fail pass validation
				gresult.addMessages(vmsg);	
				gresult.setMessage("fail save org hierarchy ", false);
				svcctx.endAudit(ExecState.EXCEP, "row info validation fail");
				return gresult;
			}
			
			folderservice.newFolder(svcctx, parentkey, folderinfo);
			gresult.setMessage("success create folder.", true);
		} catch (ServiceException e)  {
			LOGGER.error("Exception when create folder",e);
			ContextHelper.stampContext(e);
			gresult.setMessage("fail to create folder.", false);
		}finally{
			
			ContextHelper.handleContext();
		}
		return gresult;
	}
	
	public GeneralResult<List<CabFolderInfo>> findCabinetFolders(AccessPoint accesspoint,
			Principal principal, Long cabinetId, Long parentId, String namecond){
		
		GeneralResult<List<CabFolderInfo>> gresult  =  new GeneralResult<List<CabFolderInfo>>();
		
		try(ServiceContext<?> svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.FIND_FOLDERS)){
			InfoId<Long> ckey = IdKey.CABINET.getInfoId(cabinetId);
			InfoId<Long> folderkey = IdKey.CAB_FOLDER.getInfoId(parentId);
			List<CabFolderInfo> cabs = cabinetservice.getCabFolders(svcctx, ckey, folderkey, namecond);
			gresult.setReturnValue(cabs);
			gresult.setMessage("success to find person cabinets.", true);
		} catch (ServiceException e)  {
			LOGGER.error("Exception when find instance",e);
			ContextHelper.stampContext(e);
			gresult.setMessage("fail to find person cabinets.", false);
		}finally{
			
			ContextHelper.handleContext();
		}
		
		return gresult;
	}
	
	/**
	 * Find all the folders under cabinet with name fuzzy matching
	 * 
	 * @param accesspoint the access point
	 * @param principal the principal
	 * @param cabinetId the id of cabinet
	 * @param parentId the parent folder id, optional
	 * @param filename the name of file
	 * 
	 * @return GeneralResult<List<CabFileInfo>> the matched file information list
	 **/
	public GeneralResult<List<CabFileInfo>> findCabinetFiles(AccessPoint accesspoint,
			Principal principal, Long cabinetId, Long parentId, String filename){
				
		GeneralResult<List<CabFileInfo>> gresult  =  new GeneralResult<List<CabFileInfo>>();
		
		try(ServiceContext<?> svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.FIND_FILES)){
			
			InfoId<Long> ckey = IdKey.CABINET.getInfoId(cabinetId);
			InfoId<Long> folderkey = IdKey.CAB_FOLDER.getInfoId(parentId);
			List<CabFileInfo> cabs = cabinetservice.getCabFiles(svcctx, ckey, folderkey, filename);
			gresult.setReturnValue(cabs);
			gresult.setMessage("success to find person cabinets.", true);
		
		} catch (ServiceException e)  {
		
			LOGGER.error("Exception when find instance",e);
			ContextHelper.stampContext(e);
			gresult.setMessage("fail to find person cabinets.", false);
		
		}finally{
			
			ContextHelper.handleContext();
		}
		
		return gresult;
	}
	
	/**
	 * Find all the entries under cabinet or folder with name fuzzy matching
	 * 
	 * @param accesspoint the access point
	 * @param principal the principal
	 * @param cabinetId the id of cabinet
	 * @param parentId the parent folder id, optional
	 * @param filename the name of file
	 * 
	 * @return GeneralResult<List<CabFileInfo>> the matched file information list
	 **/
	public GeneralResult<List<CabFileInfo>> findCabinetEntries(AccessPoint accesspoint,
			Principal principal, Long cabinetId, Long parentId, String filename){
				
		GeneralResult<List<CabFileInfo>> gresult  =  new GeneralResult<List<CabFileInfo>>();
		
		try(ServiceContext<?> svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.FIND_FILES)){
			
			InfoId<Long> ckey = IdKey.CABINET.getInfoId(cabinetId);
			InfoId<Long> folderkey = IdKey.CAB_FOLDER.getInfoId(parentId);
			List<CabFileInfo> cabs = cabinetservice.getCabFiles(svcctx, ckey, folderkey, filename);
			gresult.setReturnValue(cabs);
			gresult.setMessage("success to find person cabinets.", true);
		
		} catch (ServiceException e)  {
		
			LOGGER.error("Exception when find instance",e);
			ContextHelper.stampContext(e);
			gresult.setMessage("fail to find person cabinets.", false);
		
		}finally{
			
			ContextHelper.handleContext();
		}		
		return gresult;
	}
	
	
	public static GeneralResult<CabinetInfo> findCabinet(AccessPoint accesspoint,
			Principal principal, InfoId<Long> cabinetId){
		
		GeneralResult<CabinetInfo> gresult  =  new GeneralResult<CabinetInfo>();
		
		try(ServiceContext<?> svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.FIND_CABINET)){
			
			svcctx.setAuditObject(cabinetId);
			CabinetInfo cab = cabinetservice.getCabinet(svcctx, cabinetId);
			gresult.setReturnValue(cab);
			gresult.setMessage("success to find cabinet.", true);
		
		} catch (ServiceException e)  {
		
			LOGGER.error("Exception when find cabinet.",e);
			ContextHelper.stampContext(e);
			gresult.setMessage("fail to find cabinets.", false);
		
		}finally{
			
			ContextHelper.handleContext();
		}		
		return gresult;
	}
	
	public static GeneralResult<InfoId<Long>> newCabinetFile(AccessPoint accesspoint,
			Principal principal, CabFileInfo fileinfo){
		
		GeneralResult<InfoId<Long>> gresult  =  new GeneralResult<InfoId<Long>>();
		try(ServiceContext<?> svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.NEW_FILE)){
			
			InfoId<Long> fileid = fileinfo.getInfoId();
			if(!InfoId.isValid(fileid)){
				fileid = idservice.generateId(IdKey.CAB_FILE, Long.class);
				fileinfo.setInfoId(fileid);
			}
			svcctx.setAuditObject(fileid);
			svcctx.addAuditPredicates(fileinfo);
			fileservice.newFile(svcctx, fileinfo);
			gresult.setReturnValue(fileid);
			gresult.setMessage("success to find cabinet.", true);
		
		} catch (ServiceException e)  {
		
			LOGGER.error("Exception when create cabinet file.",e);
			ContextHelper.stampContext(e);
			gresult.setMessage("fail to create cabinet file.", false);
		
		}finally{
			
			ContextHelper.handleContext();
		}		
		return gresult;
	}
}
