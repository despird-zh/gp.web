package com.gp.web.workspace;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gp.common.GeneralConfig;
import com.gp.common.SystemOptions;
import com.gp.web.BaseController;

@Controller("ws-meta-ctrl")
@RequestMapping("/workspace")
public class MetaController extends BaseController{

	static Logger LOGGER = LoggerFactory.getLogger(MetaController.class);
	
	static String imagePath = GeneralConfig.getString(SystemOptions.IMAGE_CACHE_PATH);
	
	@RequestMapping("meta-summary")
	public ModelAndView doMetaSummary(HttpServletRequest request){
		
		return null;
		
	}
	
	@RequestMapping("meta-info")
	public ModelAndView doAccountMetaSearch(HttpServletRequest request){
	
		return null;
		
	}
}
