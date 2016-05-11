package com.gp.web.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.RandomAccessFile;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Helper class to facilitate the transfer servlet upload&download processing
 * 
 * @author gary diao
 * @version 0.1 2015-12-23
 **/
class TransferHelper {

	static Logger LOGGER = LoggerFactory.getLogger(TransferHelper.class);
	
	static void storeFile(String storepath, FilePart filepart){
		
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
	
	static void storeFileChunk(String storepath, FilePart filepart){
		
		InputStream inputStream = null;
		RandomAccessFile file = null;
		try {
			inputStream = filepart.getContent();
			String tempfilepath = storepath + filepart.getFileId() +'.'+ filepart.getExtension();
			// write the inputStream to a FileOutputStream
			file = new RandomAccessFile(tempfilepath, "rw");
			file.seek(filepart.getChunkStart());
			int read = 0;
			byte[] bytes = new byte[1024];

			while ((read = inputStream.read(bytes)) != -1) {
				file.write(bytes, 0, read);
			}

		} catch (IOException e) {
			LOGGER.error("Fail store the file part to temporary path",e);
		} finally {
			IOUtils.closeQuietly(inputStream);
			IOUtils.closeQuietly(file);
		}
	}
}
