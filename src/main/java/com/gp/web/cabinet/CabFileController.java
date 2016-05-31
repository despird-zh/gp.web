package com.gp.web.cabinet;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.math.NumberUtils;
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
@Controller("cab-file-ctrl")
@RequestMapping("/cabinet")
public class CabFileController extends BaseController{
	
	@RequestMapping("copy-file")
	public ModelAndView doCopyFile(HttpServletRequest request){
		return null;
		
	}
	
	@RequestMapping("move-file")
	public ModelAndView doMoveFile(HttpServletRequest request){
		return null;
		
	}
	
	@RequestMapping("delete-file")
	public ModelAndView doDeleteFile(HttpServletRequest request){
		return null;
		
	}
	
	@RequestMapping("purge-file")
	public ModelAndView doPurgeFile(HttpServletRequest request){
		return null;
		
	}
}
