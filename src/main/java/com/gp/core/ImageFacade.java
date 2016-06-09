package com.gp.core;

import java.io.File;
import java.util.Date;
import java.util.List;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.gp.audit.AccessPoint;
import com.gp.common.IdKey;
import com.gp.common.Images;
import com.gp.common.Operations;
import com.gp.common.Principal;
import com.gp.common.ServiceContext;
import com.gp.exception.ServiceException;
import com.gp.info.ImageInfo;
import com.gp.info.InfoId;
import com.gp.svc.ImageService;

@Component
public class ImageFacade {
	
	static Logger LOGGER = LoggerFactory.getLogger(ImageFacade.class);
	
	static ImageService imageservice;
	
	@Autowired
	private ImageFacade(ImageService imageservice){
		ImageFacade.imageservice = imageservice;
		
	}
	
	public static GeneralResult<List<ImageInfo>> findImages(AccessPoint accesspoint,
			Principal principal, String format){
		
		GeneralResult<List<ImageInfo>> gresult = new GeneralResult<List<ImageInfo>>();
		
		try(ServiceContext svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.FIND_IMAGES)){
			
			List<ImageInfo> imgs = imageservice.getImages(svcctx, format);
			
			gresult.setReturnValue(imgs);
			gresult.setMessage("success to find images.", true);
		} catch (ServiceException e)  {
			LOGGER.error("Exception when find images",e);
			ContextHelper.stampContext(e);
			gresult.setMessage("fail to find images.", false);
		}finally{
			
			ContextHelper.handleContext();
		}
				
		return gresult;
	}
	
	public static GeneralResult<Boolean> saveImage(AccessPoint accesspoint,
			Principal principal, String imagePath , String srcFileName){
		
		GeneralResult<Boolean> gresult = new GeneralResult<Boolean>();
		
		try(ServiceContext svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.NEW_IMAGE)){
			
			String filename = FilenameUtils.getName(imagePath);
			Long imgid = Images.parseImageId(filename);
			Date touchdate = Images.parseTouchDate(filename);
			
			ImageInfo image = new ImageInfo();
			image.setImageFile(new File(imagePath));
			image.setExtension(FilenameUtils.getExtension(filename));
			image.setTouchTime(touchdate);
			image.setImageName(srcFileName);
			image.setFormat(FilenameUtils.getExtension(filename));
			image.setInfoId(IdKey.IMAGE.getInfoId(imgid));
			
			imageservice.newImage(svcctx, image);
			
			gresult.setReturnValue(true);
			gresult.setMessage("success to save image.", true);
		} catch (ServiceException e)  {
			LOGGER.error("Exception when save image",e);
			ContextHelper.stampContext(e);
			gresult.setMessage("fail to save image.", false);
		}finally{
			
			ContextHelper.handleContext();
		}
				
		return gresult;
	}
	
	/**
	 * Find image information without retrieve the image binary data. 
	 **/
	public static GeneralResult<ImageInfo> findImage(AccessPoint accesspoint,
			Principal principal, InfoId<Long> imageId){
		
		GeneralResult<ImageInfo> gresult = new GeneralResult<ImageInfo>();
		
		try(ServiceContext svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.FIND_IMAGE)){

			svcctx.setAuditObject(imageId);
			ImageInfo imginfo = imageservice.getImage(svcctx, imageId, "");
			
			gresult.setReturnValue(imginfo);
			gresult.setMessage("success to find image.", true);
		} catch (ServiceException e)  {
			LOGGER.error("Exception when find image",e);
			ContextHelper.stampContext(e);
			gresult.setMessage("fail to find image.", false);
		}finally{
			
			ContextHelper.handleContext();
		}
				
		return gresult;
	}
	
	public static GeneralResult<ImageInfo> findImage(AccessPoint accesspoint,
			Principal principal, String parentPath, String fileName){
		
		GeneralResult<ImageInfo> gresult = new GeneralResult<ImageInfo>();
		
		try(ServiceContext svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.FIND_IMAGE)){

			Long imgid = Images.parseImageId(fileName);
			InfoId<Long> infoid = IdKey.IMAGE.getInfoId(imgid);
			
			ImageInfo imginfo = imageservice.getImage(svcctx, infoid, parentPath);
			
			gresult.setReturnValue(imginfo);
			gresult.setMessage("success to find image.", true);
		} catch (ServiceException e)  {
			LOGGER.error("Exception when find image",e);
			ContextHelper.stampContext(e);
			gresult.setMessage("fail to find image.", false);
		}finally{
			
			ContextHelper.handleContext();
		}
				
		return gresult;
	}
	
	/**
	 * Update the image with a image file and name
	 * @param imageId The if of original file
	 * @param imageName the name of new image
	 * @param imagePath the image file to save
	 **/
	public static GeneralResult<Boolean> updateImage(AccessPoint accesspoint,
			Principal principal,Long imageId, String imageName, String imagePath){
		
		GeneralResult<Boolean> gresult = new GeneralResult<Boolean>();
		
		try(ServiceContext svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.UPDATE_IMAGE)){
			
			
			ImageInfo image = new ImageInfo();
			image.setImageName(imageName);
			
			if(StringUtils.isNotBlank(imagePath)){
				String filename = FilenameUtils.getName(imagePath);
				Date touchdate = Images.parseTouchDate(filename);							
				image.setImageFile(new File(imagePath));
				image.setExtension(FilenameUtils.getExtension(filename));// get extension
				image.setTouchTime(touchdate);	// get touch date
				image.setFormat(FilenameUtils.getExtension(filename)); // get format
			}
			image.setInfoId(IdKey.IMAGE.getInfoId(imageId));
			svcctx.setAuditObject(image.getInfoId());// set audit data
			imageservice.updateImage(svcctx, image);
			
			gresult.setReturnValue(true);
			gresult.setMessage("success to save image.", true);
		} catch (ServiceException e)  {
			LOGGER.error("Exception when save image",e);
			gresult.setReturnValue(false);
			ContextHelper.stampContext(e);
			gresult.setMessage("fail to save image.", false);
		}finally{
			
			ContextHelper.handleContext();
		}
				
		return gresult;
	}
	
	public static GeneralResult<Boolean> removeImage(AccessPoint accesspoint,
			Principal principal,Long imageId){
		
		GeneralResult<Boolean> gresult = new GeneralResult<Boolean>();
		
		try(ServiceContext svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.REMOVE_IMAGE)){
			
			InfoId<Long> imgid = IdKey.IMAGE.getInfoId(imageId);
			svcctx.setAuditObject(imgid);
			boolean done = imageservice.removeImage(svcctx, imgid);			
			gresult.setReturnValue(done);
			gresult.setMessage("success to save image.", true);
			
		} catch (ServiceException e)  {
			
			LOGGER.error("Exception when save image",e);
			gresult.setReturnValue(false);
			ContextHelper.stampContext(e);
			gresult.setMessage("fail to save image.", false);			
		}finally{
			
			ContextHelper.handleContext();
		}
				
		return gresult;
	}
}
