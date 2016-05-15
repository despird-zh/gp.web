package com.gp.web.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.RandomAccessFile;
import java.util.HashSet;
import java.util.Set;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.cache.Cache;

import com.gp.common.SpringContextUtil;
import com.gp.storage.ContentRange;

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
	
	static void storeFile(String storepath, PartMeta filepart){
		
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
	
	static void storeFileChunk(String storepath, PartMeta filepart){
		
		InputStream inputStream = null;
		RandomAccessFile file = null;
		try {
			Set<ContentRange> ranges = getCachedRanges(filepart.getFileId());
			
			inputStream = filepart.getContent();
			String tempfilepath = storepath + filepart.getFileId() +'.'+ filepart.getExtension();
			// write the inputStream to a FileOutputStream
			file = new RandomAccessFile(tempfilepath, "rw");
			file.seek(filepart.getContentRange().getStartPos());
			int read = 0;
			byte[] bytes = new byte[1024];

			while ((read = inputStream.read(bytes)) != -1) {
				file.write(bytes, 0, read);
			}
			
			ranges.add(filepart.getContentRange());
			if(isComplete(ranges)){
				LOGGER.debug("File upload is complete");
			}
		} catch (IOException e) {
			LOGGER.error("Fail store the file part to temporary path",e);
		} finally {
			IOUtils.closeQuietly(inputStream);
			IOUtils.closeQuietly(file);
		}
	}
	
	/**
	 * Check if the ranges is complete 
	 **/
	private static boolean isComplete(Set<ContentRange> ranges){
		
		long length = 0l;
		long filesize = 0l;
		for(ContentRange range:ranges){
			length += range.getRangeLength();
			if(filesize == 0)
				filesize = range.getFileSize();
		}
		
		return filesize == length;
	}
	
	private static Set<ContentRange> getCachedRanges(String fileId){
		lock.lock();  
		try {   
			Cache rangesCache = getTransferCache();
			Set<ContentRange> ranges = rangesCache.get(fileId, Set.class);
			if(null == ranges){
				ranges = new HashSet<ContentRange>();
				rangesCache.put(fileId, ranges);
			}
			return ranges;
		}  
		finally {  
		  lock.unlock();   
		}  
	}

}
