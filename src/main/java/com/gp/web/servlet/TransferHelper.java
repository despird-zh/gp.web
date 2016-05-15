package com.gp.web.servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.RandomAccessFile;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.cache.Cache;

import com.gp.audit.AccessPoint;
import com.gp.common.Cabinets;
import com.gp.common.GeneralConstants;
import com.gp.common.IdKey;
import com.gp.common.Principal;
import com.gp.common.SpringContextUtil;
import com.gp.core.CabinetFacade;
import com.gp.core.GeneralResult;
import com.gp.core.StorageFacade;
import com.gp.info.BinaryInfo;
import com.gp.info.CabFileInfo;
import com.gp.info.CabinetInfo;
import com.gp.info.InfoId;
import com.gp.storage.ContentRange;
import com.gp.web.BaseController;

/**
 * Helper class to facilitate the transfer servlet upload&download processing
 * 
 * @author gary diao
 * @version 0.1 2015-12-23
 **/
class TransferHelper {

	static Logger LOGGER = LoggerFactory.getLogger(TransferHelper.class);
	
	static Cache transferCache = null;
	
	static Lock lock = new ReentrantLock(); 
	
	static Cache getTransferCache(){
		
		if(transferCache == null)
			transferCache = SpringContextUtil.getSpringBean("fileTransferCache", Cache.class);
			
		return transferCache;
	}
	
	static void storeFile(String storepath, PartMeta filepart,HttpServletRequest request){
		
		InputStream inputStream = null;
		OutputStream outputStream = null;
		try {
			inputStream = filepart.getContent();
			String tempfilepath = storepath + filepart.getFileId() +'.'+ filepart.getExtension();
			// write the inputStream to a FileOutputStream
			outputStream = new FileOutputStream(new File(tempfilepath));

			int read = 0;
			byte[] bytes = new byte[1024];

			while ((read = inputStream.read(bytes)) != -1) {
				outputStream.write(bytes, 0, read);
			}

		} catch (IOException e) {
			LOGGER.error("Fail store the file part to temporary path",e);
		} finally {
			IOUtils.closeQuietly(inputStream);
			IOUtils.closeQuietly(outputStream);
		}
	}
	
	static void storeFileChunk(String storepath, PartMeta filepart, HttpServletRequest request){
		
		InputStream inputStream = null;
		RandomAccessFile file = null;
		try {
			TransferCacheInfo tsfinfo = getCachedInfo(filepart.getFileId());
			tsfinfo.setCabinetId(filepart.getCabinetId());
			inputStream = filepart.getContent();
			String tempfilepath = storepath + filepart.getFileId() +'.'+ filepart.getExtension();
			// write the inputStream to a FileOutputStream
			file = new RandomAccessFile(tempfilepath, "rw");
			file.seek(filepart.getContentRange().getStartPos());
			int read = 0;
			byte[] bytes = new byte[4096];

			while ((read = inputStream.read(bytes)) != -1) {
				file.write(bytes, 0, read);
			}
			// when receive first chunk then create file in cabinet
			if(filepart.getContentRange().getStartPos() == 0){
				
				InfoId<Long> id = createCabFile(filepart, request);
				tsfinfo.setFileId(id);
			}
			tsfinfo.getRanges().add(filepart.getContentRange());
			
			if(tsfinfo.isComplete()){
				
				InfoId<Long> binaryid = createBinary(filepart, request);
				tsfinfo.setBinaryId(binaryid);
				
				saveBinary(tsfinfo.getFileId(), binaryid, new FileInputStream(new File(tempfilepath)), request);
				LOGGER.debug("File upload is complete");
			}
		} catch (IOException e) {
			LOGGER.error("Fail store the file part to temporary path",e);
		} finally {
			IOUtils.closeQuietly(inputStream);
			IOUtils.closeQuietly(file);
		}
	}
	
	private static TransferCacheInfo getCachedInfo(String transferUid){
		lock.lock();  
		try {   
			Cache rangesCache = getTransferCache();
			TransferCacheInfo tsfinfo = rangesCache.get(transferUid, TransferCacheInfo.class);
			if(null == tsfinfo){
				tsfinfo = new TransferCacheInfo();
				tsfinfo.setClientUid(transferUid);
				rangesCache.put(transferUid, tsfinfo);
			}
			return tsfinfo;
		}  
		finally {  
		  lock.unlock();   
		}
	}

	private static InfoId<Long> createCabFile(PartMeta filepart,
			HttpServletRequest request){
		
		Principal principal = BaseController.getPrincipalFromShiro();
		AccessPoint accesspoint = BaseController.getAccessPoint(request);
		
		CabFileInfo fileinfo = new CabFileInfo();
		long cabinetId = Long.valueOf(filepart.getCabinetId());
		fileinfo.setCabinetId(cabinetId);
		fileinfo.setParentId(GeneralConstants.FOLDER_ROOT);
		fileinfo.setClassification("secret");
		fileinfo.setCommentOn(false);
		fileinfo.setCreateDate(new Date());
		fileinfo.setCreator(principal.getAccount());
		fileinfo.setFormat(filepart.getExtension());
		fileinfo.setOwner(principal.getAccount());
		fileinfo.setState(Cabinets.FileState.BLANK.name());
		fileinfo.setEntryName(filepart.getName());
		fileinfo.setVersion("1.0");
		
		GeneralResult<InfoId<Long>> result = CabinetFacade.newCabinetFile(accesspoint, principal, fileinfo);
		
		return result.getReturnValue();
	}
	
	private static InfoId<Long> createBinary(PartMeta filepart, 
			HttpServletRequest request){
		
		Principal principal = BaseController.getPrincipalFromShiro();
		AccessPoint accesspoint = BaseController.getAccessPoint(request);
		
		long cabinetId = Long.valueOf(filepart.getCabinetId());
		InfoId<Long> cabid = IdKey.CABINET.getInfoId(cabinetId);
		CabinetInfo cabinfo = CabinetFacade.findCabinet(accesspoint, principal, cabid).getReturnValue();
	
		BinaryInfo binfo = new BinaryInfo();
		binfo.setSourceId(cabinfo.getSourceId());
		binfo.setCreateDate(new Date());
		binfo.setCreator(principal.getAccount());
		binfo.setFormat(filepart.getExtension());
		binfo.setSize(filepart.getContentRange().getFileSize());
		binfo.setState(Cabinets.FileState.BLANK.name());
		
		GeneralResult<InfoId<Long>> result = StorageFacade.newBinary(accesspoint, principal, binfo);
	
		return result.getReturnValue();
	}
	
	public static void saveBinary(InfoId<Long> cabfileId, 
			InfoId<Long> binaryId, 
			InputStream inputstream,
			HttpServletRequest request){
		
	}
	
	/**
	 * Class to hold the transfer chunk information
	 *  
	 **/
	public static class TransferCacheInfo{
		/** cabinet id */
		private String cabinetId;
		/** client side uid */
		private String clientUid;
		/** file id */
		private InfoId<Long> fileId;
		/** binaryId */
		private InfoId<Long> binaryId;
		/** range setting of chunks */
		Set<ContentRange> ranges = new HashSet<ContentRange>();

		public String getClientUid() {
			return clientUid;
		}

		public void setClientUid(String clientUid) {
			this.clientUid = clientUid;
		}

		public InfoId<Long> getFileId() {
			return fileId;
		}

		public void setFileId(InfoId<Long> fileId) {
			this.fileId = fileId;
		}

		public InfoId<Long> getBinaryId() {
			return binaryId;
		}

		public void setBinaryId(InfoId<Long> binaryId) {
			this.binaryId = binaryId;
		}

		public Set<ContentRange> getRanges() {
			return ranges;
		}

		public void setRanges(Set<ContentRange> ranges) {
			this.ranges = ranges;
		}

		boolean isComplete(){
				
				long length = 0l;
				long filesize = 0l;
				for(ContentRange range : this.ranges){
					length += range.getRangeLength();
					if(filesize == 0)
						filesize = range.getFileSize();
				}
				
				return filesize == length;
		}

		public String getCabinetId() {
			return cabinetId;
		}

		public void setCabinetId(String cabinetId) {
			this.cabinetId = cabinetId;
		}
	}
}
