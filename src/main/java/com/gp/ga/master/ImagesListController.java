package com.gp.ga.master;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gp.audit.AccessPoint;
import com.gp.common.GeneralConfig;
import com.gp.common.Images;
import com.gp.common.Principal;
import com.gp.common.SystemOptions;
import com.gp.core.GeneralResult;
import com.gp.core.ImageFacade;
import com.gp.info.ImageInfo;
import com.gp.web.ActionResult;
import com.gp.web.BaseController;
import com.gp.web.model.Image;

@Controller("ga-images-ctlr")
@RequestMapping("/ga")
public class ImagesListController  extends BaseController{
	
	public static SimpleDateFormat TOUCH_DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	public static SimpleDateFormat MODIFY_DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd");
	Logger LOGGER = LoggerFactory.getLogger(ImagesListController.class);
	
	@RequestMapping("image-list")
	public ModelAndView doInitialView(){
		
		return getJspModelView("ga/master/image-list");
	}
	
	@RequestMapping("image-search")
	public ModelAndView doImageSearch(HttpServletRequest request){
		
		String format = super.readRequestParam("format");
		ModelAndView mav = super.getJsonModelView();
		Principal principal = super.getPrincipalFromShiro();
		AccessPoint accesspoint = super.getAccessPoint(request);
		
		GeneralResult<List<ImageInfo>> gresult = null;		
		gresult = ImageFacade.findImages(accesspoint, principal, format);
		
		if(gresult.isSuccess()){
			List<Image> images = new ArrayList<Image>();		
			
			String image_cache = GeneralConfig.getString(SystemOptions.IMAGE_CACHE_PATH);
			for(ImageInfo info: gresult.getReturnValue()){
				
				Image img = new Image();
				img.setImageId(info.getInfoId().getId());
				img.setFormat(info.getFormat());
				img.setImageName(info.getImageName());
				img.setTouchDate(TOUCH_DATE_FORMAT.format(info.getTouchTime()));
				img.setModifier(info.getModifier());
				img.setModifyDate(MODIFY_DATE_FORMAT.format(info.getModifyDate()));
				
				String imgfilename = info.getFileName();
				
				img.setImageUrl("../" + image_cache + '/' + imgfilename);
				
				images.add(img);
			}
			
			mav.addObject(MODEL_KEY_ROWS,images);
			mav.addObject(MODEL_KEY_STATE, ActionResult.SUCCESS);
			mav.addObject(MODEL_KEY_MESSAGE, gresult.getMessage());
			
		}else{
						
			mav.addObject(MODEL_KEY_STATE, ActionResult.ERROR);
			mav.addObject(MODEL_KEY_MESSAGE, gresult.getMessage());
		}
		return mav;
	}
	
	@RequestMapping("image-new")
	public ModelAndView doImageNew(HttpServletRequest request, HttpServletResponse response)throws IOException{
		
		ModelAndView mav = super.getJsonModelView();
		String imagePath = GeneralConfig.getString(SystemOptions.IMAGE_CACHE_PATH);
    	String cachedFileName = (String)request.getAttribute("file_name");
    	String srcFileName = (String)request.getAttribute("image_name");
		String relativeUri = "/" + imagePath + '/' + cachedFileName;
		String realPath = request.getServletContext().getRealPath(relativeUri);
		LOGGER.debug(relativeUri);
		
		Principal principal = super.getPrincipalFromShiro();
		AccessPoint accesspoint = super.getAccessPoint(request);
		ImageFacade.saveImage(accesspoint, principal, realPath, srcFileName);
    	// new operation 
        ActionResult rmsg = new ActionResult();
        rmsg.setMessage("OK");
        rmsg.setState("200");
        rmsg.setData("../" + imagePath + '/' + cachedFileName);
        
        mav.addAllObjects(rmsg.asMap());
        
        return mav;
	}
	
	/**
	 * update the image with name and image file
	 *  
	 **/
	@RequestMapping("image-save")
	public ModelAndView doImageSave(HttpServletRequest request, HttpServletResponse response)throws IOException{
		
		ModelAndView mav = super.getJsonModelView();
		ActionResult rmsg = new ActionResult();
		
		String imagePath = GeneralConfig.getString(SystemOptions.IMAGE_CACHE_PATH);
		String realPath = null; 
    	String imgId = super.readRequestParam("image_id");// the id of original 
    	String imgName = super.readRequestParam("image_name");// the name of image
    	String imgSrc = super.readRequestParam("image_src"); // the file name of new image
    	
    	imgSrc = StringUtils.isBlank(imgSrc)? null : FilenameUtils.getName(imgSrc);
    	if(Images.isQualifiedName(imgSrc)){
    		String relativeUri = "/" + imagePath + '/' + imgSrc;
    		realPath = request.getServletContext().getRealPath(relativeUri);
    	}
		
		LOGGER.debug("the real path : {}", realPath);
		
		Principal principal = super.getPrincipalFromShiro();
		AccessPoint accesspoint = super.getAccessPoint(request);
		GeneralResult<Boolean> gresult = ImageFacade.updateImage(accesspoint, principal,Long.valueOf(imgId), imgName, realPath);
		if(gresult.isSuccess() && gresult.getReturnValue()){
			rmsg.setMessage("Success in update the image");
			rmsg.setState(ActionResult.SUCCESS);
			rmsg.setData("../" + imagePath + '/' + imgSrc);
		}
        mav.addAllObjects(rmsg.asMap());
        
        return mav;
	}
	
	/**
	 * update the image with name and image file
	 *  
	 **/
	@RequestMapping("image-remove")
	public ModelAndView doImageRemove(HttpServletRequest request)throws IOException{
		
		ModelAndView mav = super.getJsonModelView();
		ActionResult rmsg = new ActionResult();
    	String imgId = super.readRequestParam("image_id");// the id of original 
		
    	Principal principal = super.getPrincipalFromShiro();
		AccessPoint accesspoint = super.getAccessPoint(request);
		
		GeneralResult<Boolean> gresult = ImageFacade.removeImage(accesspoint, principal,Long.valueOf(imgId));
		if(gresult.isSuccess() && gresult.getReturnValue()){
			rmsg.setMessage("Success remove the image");
			rmsg.setState(ActionResult.SUCCESS);
		}
        mav.addAllObjects(rmsg.asMap());
        
        return mav;
	}
}
