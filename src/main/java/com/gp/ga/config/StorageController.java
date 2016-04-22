package com.gp.ga.config;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.ArrayUtils;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gp.audit.AccessPoint;
import com.gp.common.IdKey;
import com.gp.common.Principal;
import com.gp.common.Storages;
import com.gp.common.Storages.StorageState;
import com.gp.common.Storages.StorageType;
import com.gp.common.Storages.StoreSetting;
import com.gp.core.GeneralResult;
import com.gp.core.StorageFacade;
import com.gp.info.InfoId;
import com.gp.info.StorageInfo;
import com.gp.util.CommonUtils;
import com.gp.web.ActionResult;
import com.gp.web.BaseController;
import com.gp.web.CustomWebUtils;
import com.gp.web.model.Storage;

@Controller("ga-storage-ctlr")
@RequestMapping("/ga")
public class StorageController extends BaseController{

	static Logger LOGGER = LoggerFactory.getLogger(StorageController.class);
	static final String ALL_OPTION = "ALL";
	
	static final String VIEW_TAB_LIST = "list";
	static final String VIEW_TAB_MODIFY = "modify";
	static final String VIEW_TAB_NEW = "new";
	
	@RequestMapping("storage")
	public ModelAndView doInitial(HttpServletRequest request){
		
		ModelAndView mav = getJspModelView("ga/config/storage");
		String viewtab = super.readRequestParam("viewtab");
		
		int exist = ArrayUtils.indexOf(new String[]{VIEW_TAB_LIST,VIEW_TAB_MODIFY,VIEW_TAB_NEW}, viewtab);
		if(-1 == exist){
			viewtab = VIEW_TAB_LIST;
		}
		mav.addObject("viewtab", viewtab);
		
		return mav;
	}
	
	@RequestMapping("storage-search")
	public ModelAndView doSearchSearch(HttpServletRequest request){
		
		List<Storage> rows = new ArrayList<Storage>();

		String namecond = this.readRequestParam("storage_name");
		String type = this.readRequestParam("storage_type");
		String state = this.readRequestParam("storage_state");
		String[] types = null;
		if(ALL_OPTION.equals(type)){
			types = new String[]{
					StorageType.DISK.name(),
					StorageType.HDFS.name()
				};
		}else{
			types = new String[]{type};
		}
		String[] states = null;
		if(ALL_OPTION.equals(state)){
			states = new String[]{
					StorageState.CLOSE.name(),
					StorageState.FULL.name(),
					StorageState.OPEN.name()};
		}else{
			states = new String[]{state};
		}
		Principal principal = super.getPrincipalFromShiro();
		AccessPoint accesspoint = super.getAccessPoint(request);
		
		ModelAndView mav = super.getJsonModelView();
		
		GeneralResult<List<StorageInfo>> gresult = StorageFacade.findStorages(accesspoint, 
				principal, 
				namecond, types, states);
		
		if(gresult.isSuccess()){
			
			for(StorageInfo sinfo : gresult.getReturnValue()){
				
				Storage storage = new Storage();
				storage.setStorageId(sinfo.getInfoId().getId());
				storage.setName(sinfo.getStorageName());
				storage.setState(sinfo.getState());
				storage.setType(sinfo.getStorageType());
				storage.setDescription(sinfo.getDescription());
				String cap = CommonUtils.humanReadableByteCount(sinfo.getCapacity());
				storage.setCapacity(cap);
				String used = CommonUtils.humanReadableByteCount(sinfo.getUsed());
				storage.setUsed(used);
				int percent = (int)((double)sinfo.getUsed()/(double)sinfo.getCapacity()*100);
				storage.setPercent(percent);
				// parse setting json into map 
				Map<String, Object> setting = Storages.parseSetting(sinfo.getSettingJson());
				storage.setStorePath((String)setting.get(StoreSetting.StorePath.name()));
				storage.setHdfsHost((String)setting.get(StoreSetting.HdfsHost.name()));
				storage.setHdfsPort((String)setting.get(StoreSetting.HdfsPort.name()));
				
				rows.add(storage);
			}
			
			mav.addObject(MODEL_KEY_STATE, ActionResult.SUCCESS);
			mav.addObject(MODEL_KEY_MESSAGE, gresult.getMessage());

			mav.addObject(MODEL_KEY_ROWS, rows);
		}else{
			
			mav.addObject(MODEL_KEY_STATE, ActionResult.ERROR);
			mav.addObject(MODEL_KEY_MESSAGE, gresult.getMessage());
		}
		
		return mav;
	}
	
	@RequestMapping("storage-save")
	public ModelAndView doSaveStorage(HttpServletRequest request){
		
		if(LOGGER.isDebugEnabled())
			CustomWebUtils.dumpRequestAttributes(request);
		// read parameter
		Storage storage = new Storage();
		super.readRequestData(request, storage);
		// read trace information
		Principal principal = super.getPrincipalFromShiro();
		AccessPoint accesspoint = super.getAccessPoint(request);
		// prepare result
		ActionResult aresult = new ActionResult();
		ModelAndView mav = super.getJsonModelView();
		
		StorageInfo sinfo = new StorageInfo();
		
		InfoId<Integer> infoid = IdKey.STORAGE.getInfoId(storage.getStorageId());
		sinfo.setInfoId(infoid);
		Long cap = StringUtils.isNotBlank(storage.getCapacity()) ? Long.valueOf(storage.getCapacity()):0l;
		sinfo.setCapacity(cap);
		sinfo.setDescription(storage.getDescription());
		// convert setting into json string
		Map<String, Object> setting = new HashMap<String, Object>();
		setting.put(StoreSetting.StorePath.name(), storage.getStorePath());
		setting.put(StoreSetting.HdfsHost.name(), storage.getHdfsHost());
		setting.put(StoreSetting.HdfsPort.name(), storage.getHdfsPort());
		// try to save setting
		sinfo.setSettingJson(Storages.wrapSetting(setting));
		
		sinfo.setState(storage.getState());
		sinfo.setStorageType(storage.getType());
		sinfo.setStorageName(storage.getName());
		
		GeneralResult<Boolean> gresult = StorageFacade.saveStorage(accesspoint, principal, sinfo);

		if(!gresult.isSuccess()){
			aresult.setState(ActionResult.ERROR);
			aresult.setMessage(gresult.getMessage());
			aresult.setDetailmsgs(gresult.getMessages());
		}else{
			
			aresult.setState(ActionResult.SUCCESS);
			aresult.setMessage(gresult.getMessage());
		}
		
		mav.addAllObjects(aresult.asMap());
		return mav;
	}
	
	@RequestMapping("storage-new")
	public ModelAndView doNewStorage(HttpServletRequest request){
		
		if(LOGGER.isDebugEnabled())
			CustomWebUtils.dumpRequestAttributes(request);
		// read parameter
		Storage storage = new Storage();
		super.readRequestData(request, storage);
		// read trace information
		Principal principal = super.getPrincipalFromShiro();
		AccessPoint accesspoint = super.getAccessPoint(request);
		// prepare result
		ActionResult aresult = new ActionResult();
		ModelAndView mav = super.getJsonModelView();
		
		StorageInfo sinfo = new StorageInfo();
		Long cap = StringUtils.isNotBlank(storage.getCapacity()) ? Long.valueOf(storage.getCapacity()):0l;
		sinfo.setCapacity(cap);
		sinfo.setDescription(storage.getDescription());
		// convert setting into json string
		Map<String, Object> setting = new HashMap<String, Object>();
		setting.put(StoreSetting.StorePath.name(), storage.getStorePath());
		setting.put(StoreSetting.HdfsHost.name(), storage.getHdfsHost());
		setting.put(StoreSetting.HdfsPort.name(), storage.getHdfsPort());
		// try to save setting
		sinfo.setSettingJson(Storages.wrapSetting(setting));
		sinfo.setState(storage.getState());
		sinfo.setStorageType(storage.getType());
		sinfo.setStorageName(storage.getName());
		sinfo.setUsed(0l);
		GeneralResult<InfoId<Integer>> gresult = StorageFacade.newStorage(accesspoint, principal, sinfo);

		if(!gresult.isSuccess()){
			aresult.setState(ActionResult.ERROR);
			aresult.setMessage(gresult.getMessage());
			aresult.setDetailmsgs(gresult.getMessages());
		}else{
			
			aresult.setState(ActionResult.SUCCESS);
			aresult.setMessage(gresult.getMessage());
		}
		
		mav.addAllObjects(aresult.asMap());
		return mav;
	}
	
	@RequestMapping("storage-remove")
	public ModelAndView doRemoveStorage(HttpServletRequest request){
		
		String storageId = super.readRequestParam("storage_id");
		Principal principal = super.getPrincipalFromShiro();
		AccessPoint accesspoint = super.getAccessPoint(request);
		ModelAndView mav = super.getJsonModelView();
		ActionResult aresult = new ActionResult();
		InfoId<Integer> sid = IdKey.STORAGE.getInfoId(Integer.valueOf(storageId));
		GeneralResult<Boolean> gresult = StorageFacade.removeStorage(accesspoint, principal, sid);
		if(!gresult.isSuccess() || !gresult.getReturnValue()){
			aresult.setState(ActionResult.ERROR);
			aresult.setMessage(gresult.getMessage());
			aresult.setDetailmsgs(gresult.getMessages());
		}else{
			
			aresult.setState(ActionResult.SUCCESS);
			aresult.setMessage(gresult.getMessage());
		}
		mav.addAllObjects(aresult.asMap());
		return mav;
	}
	
	@RequestMapping("storage-info")
	public ModelAndView doGetStorage(HttpServletRequest request){
		
		String storageId = super.readRequestParam("storage_id");
		Storage storage = new Storage();
		// read trace information
		Principal principal = super.getPrincipalFromShiro();
		AccessPoint accesspoint = super.getAccessPoint(request);
		ModelAndView mav = super.getJsonModelView();
		ActionResult aresult = new ActionResult();
		
		InfoId<Integer> sid = IdKey.STORAGE.getInfoId(Integer.valueOf(storageId));
		GeneralResult<StorageInfo> gresult = StorageFacade.findStorage(accesspoint, principal, sid);
		StorageInfo sinfo = gresult.getReturnValue();
		if(!gresult.isSuccess() || sinfo == null){
			
			aresult.setState(ActionResult.ERROR);
			aresult.setMessage(gresult.getMessage());
		}else{

			storage.setStorageId(sinfo.getInfoId().getId());
			storage.setName(sinfo.getStorageName());
			storage.setState(sinfo.getState());
			storage.setType(sinfo.getStorageType());
			storage.setDescription(sinfo.getDescription());
			storage.setCapacity(sinfo.getCapacity().toString());
			storage.setUsed(sinfo.getUsed().toString());
			
			Map<String, Object> setting = Storages.parseSetting(sinfo.getSettingJson());
			storage.setStorePath((String)setting.get(StoreSetting.StorePath.name()));
			storage.setHdfsHost((String)setting.get(StoreSetting.HdfsHost.name()));
			storage.setHdfsPort((String)setting.get(StoreSetting.HdfsPort.name()));
			
			aresult.setData(storage);
			aresult.setMessage(gresult.getMessage());
		}	
		mav.addAllObjects(aresult.asMap());
		return mav;	
	}
}
