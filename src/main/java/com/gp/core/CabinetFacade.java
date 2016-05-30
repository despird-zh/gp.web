package com.gp.core;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.lang.ArrayUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.gp.acl.Ace;
import com.gp.acl.Acl;
import com.gp.audit.AccessPoint;
import com.gp.common.Cabinets;
import com.gp.common.GeneralConstants;
import com.gp.common.IdKey;
import com.gp.common.Operations;
import com.gp.common.Principal;
import com.gp.common.ServiceContext;
import com.gp.common.GeneralContext.ExecState;
import com.gp.exception.ServiceException;
import com.gp.info.CabEntryInfo;
import com.gp.info.CabFileInfo;
import com.gp.info.CabFolderInfo;
import com.gp.info.CabinetInfo;
import com.gp.info.InfoId;
import com.gp.info.TagInfo;
import com.gp.pagination.PageQuery;
import com.gp.pagination.PageWrapper;
import com.gp.svc.CabinetService;
import com.gp.svc.FileService;
import com.gp.svc.FolderService;
import com.gp.svc.TagService;
import com.gp.svc.CommonService;
import com.gp.util.DateTimeUtils;
import com.gp.validation.ValidationMessage;
import com.gp.validation.ValidationUtils;

@Component
public class CabinetFacade {
	
	static Logger LOGGER = LoggerFactory.getLogger(CabinetFacade.class);
	
	static CabinetService cabinetservice;
	
	static FolderService folderservice;
	
	static FileService fileservice;
	
	static CommonService idservice;
	
	static TagService tagservice;
	
	@Autowired
	private CabinetFacade(CabinetService cabinetservice, 
			FolderService folderservice, 
			FileService fileservice,
			CommonService idservice,
			TagService tagservice){
		
		CabinetFacade.cabinetservice = cabinetservice;
		CabinetFacade.fileservice = fileservice;
		CabinetFacade.folderservice = folderservice;
		CabinetFacade.idservice = idservice;
		CabinetFacade.tagservice = tagservice;
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
	public static GeneralResult<Boolean> addCabinetFolder(AccessPoint accesspoint,
			Principal principal, CabFolderInfo folderinfo){

		GeneralResult<Boolean> gresult  =  new GeneralResult<Boolean>();

		try(ServiceContext<?> svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.NEW_FOLDER)){
			
			InfoId<Long> fkey = idservice.generateId(IdKey.CAB_FOLDER, Long.class);
			folderinfo.setInfoId(fkey);
			folderinfo.setSourceId(GeneralConstants.LOCAL_INSTANCE);
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
			Acl acl =  Cabinets.getDefaultAcl();
			InfoId<Long> tempid = idservice.generateId(IdKey.CAB_ACL, Long.class);
			acl.setAclId(tempid);
			Collection<Ace> aces = acl.getAllAces();
			for(Ace ace : aces){
				tempid = idservice.generateId(IdKey.CAB_ACE, Long.class);
				ace.setAceId(tempid);
			}
			folderservice.newFolder(svcctx, parentkey, folderinfo, acl);
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
	
	public static GeneralResult<List<CabFolderInfo>> findCabinetFolders(AccessPoint accesspoint,
			Principal principal, InfoId<Long> cabinetId, InfoId<Long> parentId, String namecond){
		
		GeneralResult<List<CabFolderInfo>> gresult  =  new GeneralResult<List<CabFolderInfo>>();
		
		try(ServiceContext<?> svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.FIND_FOLDERS)){

			List<CabFolderInfo> cabs = cabinetservice.getCabFolders(svcctx, cabinetId, parentId, namecond);
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
	public static GeneralResult<List<CabFileInfo>> findCabinetFiles(AccessPoint accesspoint,
			Principal principal, InfoId<Long> cabinetId, InfoId<Long> parentId, String filename){
				
		GeneralResult<List<CabFileInfo>> gresult  =  new GeneralResult<List<CabFileInfo>>();
		
		try(ServiceContext<?> svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.FIND_FILES)){
			
			List<CabFileInfo> cabs = cabinetservice.getCabFiles(svcctx, cabinetId, parentId, filename);
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
	public static GeneralResult<PageWrapper<CabEntryInfo>> findCabinetEntries(AccessPoint accesspoint,
			Principal principal, 
			InfoId<Long> cabinetId, 
			InfoId<Long> parentId, 
			String filename,
			PageQuery pquery){
				
		GeneralResult<PageWrapper<CabEntryInfo>> gresult  =  new GeneralResult<PageWrapper<CabEntryInfo>>();
		
		try(ServiceContext<?> svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.FIND_FILES)){

			PageWrapper<CabEntryInfo> cabs = cabinetservice.getCabEntries(svcctx, cabinetId, parentId, filename, pquery);
			gresult.setReturnValue(cabs);
			gresult.setMessage("success find cabinet entries.", true);
		
		} catch (ServiceException e)  {
		
			LOGGER.error("Exception when find cabinet entries.",e);
			ContextHelper.stampContext(e);
			gresult.setMessage("fail to find cabinet entries.", false);
		
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
	
	/**
	 * Create a file entry in cabinet
	 * 
	 * @param accesspoint the access point of client request
	 * @param principal the principal of current user
	 * @param fileinfo the file to be created
	 * 
	 * @return The General Result that wrap the cabinet file id 
	 **/
	public static GeneralResult<InfoId<Long>> addCabinetFile(AccessPoint accesspoint,
			Principal principal, CabFileInfo fileinfo){
		
		GeneralResult<InfoId<Long>> gresult  =  new GeneralResult<InfoId<Long>>();
		
		try(ServiceContext<?> svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.NEW_FILE)){
			
			InfoId<Long> fileid = fileinfo.getInfoId();
			if(!InfoId.isValid(fileid)){
				fileid = idservice.generateId(IdKey.CAB_FILE, Long.class);
				LOGGER.debug("the file id : {}", fileid);
				fileinfo.setInfoId(fileid);
			}
			if(fileinfo.getSourceId() == 0){
				CabinetInfo cinfo = cabinetservice.getCabinet(svcctx, IdKey.CABINET.getInfoId(fileinfo.getCabinetId()));
				fileinfo.setSourceId(cinfo.getSourceId());
			}
			svcctx.setAuditObject(fileid);
			svcctx.addAuditPredicates(fileinfo);
			Acl acl =  Cabinets.getDefaultAcl();
			InfoId<Long> tempid = idservice.generateId(IdKey.CAB_ACL, Long.class);
			acl.setAclId(tempid);
			Collection<Ace> aces = acl.getAllAces();
			for(Ace ace : aces){
				tempid = idservice.generateId(IdKey.CAB_ACE, Long.class);
				ace.setAceId(tempid);
			}
			fileservice.newFile(svcctx, fileinfo, acl);
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
	
	public static GeneralResult<CabFileInfo> findCabinetFile(AccessPoint accesspoint,
			Principal principal,String sourceId, InfoId<Long> fileid){
		
		GeneralResult<CabFileInfo> gresult  =  new GeneralResult<CabFileInfo>();
		
		try(ServiceContext<?> svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.FIND_FILE)){
			
			svcctx.setAuditObject(fileid);
			
			CabFileInfo fileinfo = fileservice.getFile(svcctx, fileid);
			
			gresult.setReturnValue(fileinfo);
			gresult.setMessage("success find the file", true);
			
		} catch (ServiceException e)  {
			
			LOGGER.error("Exception when create cabinet file.",e);
			ContextHelper.stampContext(e);
			gresult.setMessage("fail to create cabinet file.", false);
		
		}finally{
			
			ContextHelper.handleContext();
		}	
		
		return gresult;
	}
	
	public static GeneralResult<Map<InfoId<?>, Set<TagInfo>>> findCabEntriesTags(AccessPoint accesspoint,
			Principal principal, InfoId<?> ...entryids){
		
		GeneralResult<Map<InfoId<?>, Set<TagInfo>>> gresult = new GeneralResult<Map<InfoId<?>, Set<TagInfo>>>();
		if(ArrayUtils.isEmpty(entryids)){
			gresult.setMessage("success query", true);
			return gresult;
		}
		List<InfoId<?>> files = new ArrayList<InfoId<?>>();
		List<InfoId<?>> folders = new ArrayList<InfoId<?>>();
		for(InfoId<?> id: entryids){
			
			if(IdKey.CAB_FILE.getTable().equals(id.getIdKey())){
				files.add(id);
			}else if(IdKey.CAB_FOLDER.getTable().equals(id.getIdKey())){
				folders.add(id);
			}
		}
		try(ServiceContext<?> svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.FIND_TAGS)){
			
			Map<InfoId<?>, Set<TagInfo>> filetags = tagservice.getTags(svcctx, files.toArray(new InfoId[0]));
			Map<InfoId<?>, Set<TagInfo>> foldertags = tagservice.getTags(svcctx, folders.toArray(new InfoId[0]));
			// merge two maps together
			filetags.putAll(foldertags);
			gresult.setReturnValue(filetags);
			gresult.setMessage("success find the entry tags", true);
			
		} catch (ServiceException e)  {
			
			LOGGER.error("Exception when find entry tags.",e);
			ContextHelper.stampContext(e);
			gresult.setMessage("fail to find entry tags.", false);
		
		}finally{
			
			ContextHelper.handleContext();
		}	
		return gresult;

	}
}
