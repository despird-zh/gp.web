package com.gp.web.servlet;

import java.io.File;
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.gp.audit.AccessPoint;
import com.gp.common.GeneralConfig;
import com.gp.common.Images;
import com.gp.common.Principal;
import com.gp.common.SystemOptions;
import com.gp.core.ImageFacade;
import com.gp.web.BaseController;
import com.gp.web.ServletUtils;

public class ImageFilter implements Filter{

	Logger LOGGER = LoggerFactory.getLogger(ImageFilter.class);
	
	String imagePath;
	
	@Override
	public void destroy() {
		// ignore
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		HttpServletRequest _request = (HttpServletRequest) request;
		// relative uri : img_cache/39-20160411-150649.png
		String relativeUri = ServletUtils.getRelativeUrl(_request);
		String fileName = FilenameUtils.getName(relativeUri);
		
		if(Images.isQualifiedName(fileName)){
			
			LOGGER.debug("image name qualified : {}", fileName);
			
			// imgfile : c:/xx/xx/wapp/img_cache/39-20160411-150649.png
			File imgfile = ServletUtils.getRealFile(_request, relativeUri);
			
			if(!imgfile.exists()){
				
				LOGGER.debug("image not exist : {}", imgfile.getAbsolutePath());
				if(!imgfile.getParentFile().exists())
					imgfile.getParentFile().mkdirs();
				
				// load image from database to disk directory.
				loadImageToCache(_request, imgfile.getParent(), fileName);
				// write image to browser
				ServletUtils.writeImage(response, imgfile);
				
			}else{
				
				LOGGER.debug("image exist : {}", imgfile.getAbsolutePath());
				// image exist let it continue
				chain.doFilter(request, response);
			}
		}
		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		
		imagePath = GeneralConfig.getString(SystemOptions.IMAGE_CACHE_PATH);
	}

	/**
	 * Load the image from database or specified location to cache directory 
	 **/
	public void loadImageToCache(HttpServletRequest request, String parent, String fileName){
		
		Principal principal = BaseController.getPrincipalFromShiro();
		AccessPoint accesspoint = BaseController.getAccessPoint(request);
		
		ImageFacade.findImage(accesspoint, principal, parent, fileName);
	}
	
}
