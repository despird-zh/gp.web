package com.gp.web.workgroup;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gp.audit.AccessPoint;
import com.gp.common.Principal;
import com.gp.core.CabinetFacade;
import com.gp.core.GeneralResult;
import com.gp.info.CabFolderInfo;
import com.gp.web.ActionResult;
import com.gp.web.BaseController;
import com.gp.web.CustomWebUtils;

/**
 * This controller wrap the operation on folder 
 **/
@Controller("wg-folder-ctrl")
@RequestMapping("/workgroup")
public class CabFolderController extends BaseController{

	@RequestMapping("new-folder")
	public ModelAndView doNewFolder(HttpServletRequest request){
		
		CustomWebUtils.dumpRequestAttributes(request);
		String cabinettype = super.readRequestParam("cabinet_type");
		String folderowner = super.readRequestParam("folder_owner");
		String foldername = super.readRequestParam("folder_name");
		String folderdescr = super.readRequestParam("folder_descr");
		String folderparent = super.readRequestParam("folder_parent_id");
		
		CabFolderInfo cabfolder = new CabFolderInfo();
		long fparent = Long.valueOf(folderparent);
		
		cabfolder.setParentId(fparent);
		cabfolder.setEntryName(foldername);
		cabfolder.setDescription(folderdescr);
		cabfolder.setOwner(folderowner);
		
		ActionResult aresult = new ActionResult();
		ModelAndView jmav = super.getJsonModelView();
		Principal principal = super.getPrincipalFromShiro();
		AccessPoint accesspoint = super.getAccessPoint(request);
		GeneralResult<Boolean> gresult = CabinetFacade.savePubCabinetFolder(accesspoint, principal, cabfolder);
		if(gresult.isSuccess()){
			
			aresult.setState(ActionResult.SUCCESS);
			aresult.setMessage(gresult.getMessage());
			aresult.setDetailmsgs(gresult.getMessages());
		}else{
			
			aresult.setState(ActionResult.ERROR);
			aresult.setMessage(gresult.getMessage());
			aresult.setDetailmsgs(gresult.getMessages());
		}
		
		return jmav.addAllObjects(aresult.asMap());
	}
}
