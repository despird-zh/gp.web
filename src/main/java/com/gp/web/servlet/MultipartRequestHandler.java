package com.gp.web.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
 
public class MultipartRequestHandler {
 
	static Logger LOGGER = LoggerFactory.getLogger(MultipartRequestHandler.class);

	public static final String CONTENT_PART = "files[]";
	
    public static FilePart uploadByJavaServletAPI(HttpServletRequest request) throws IOException, ServletException{

        Part part = request.getPart(CONTENT_PART);
        // Iterate each part
        FilePart fmeta = new FilePart();
        fmeta.setFileId(request.getParameter("file-id"));
        String filename = getFilename(part);
        fmeta.setName(filename);
        fmeta.setFileSize(part.getSize());
        fmeta.setFormat(FilenameUtils.getExtension(filename));
        fmeta.setContent(part.getInputStream());
        fmeta.setContentType(part.getContentType());
        
        String contentRange = request.getHeader("Content-Range");
        LOGGER.debug("Content-Range : {}", contentRange);
        if(StringUtils.isNotBlank(contentRange)){
        	parseRange(contentRange, fmeta);
        }
        return fmeta;
    }
 
    /** 
     * this method is used to get file name out of request headers
     */ 
    private static String getFilename(Part part) {
        for (String cd : part.getHeader("content-disposition").split(";")) {
            if (cd.trim().startsWith("filename")) {
                String filename = cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
                return filename.substring(filename.lastIndexOf('/') + 1).substring(filename.lastIndexOf('\\') + 1); // MSIE fix.
            }
        }
        return null;
    }
    
    /**
     * content range : bytes 21010-47021/47022 
     **/
    private static void parseRange(String contentRange, FilePart fmeta){
    	
    	contentRange = contentRange.substring(contentRange.indexOf(' ')+1);
    	
    	String lengthStr = contentRange.substring(contentRange.indexOf('/')+1);
    	String startStr = contentRange.substring(0, contentRange.indexOf('-'));
    	String endStr = contentRange.substring(contentRange.indexOf('-')+1,contentRange.indexOf('/'));
    	
    	fmeta.setChunkStart(Long.valueOf(startStr));
    	fmeta.setChunkEnd(Long.valueOf(endStr));
    	fmeta.setFileSize(Long.valueOf(lengthStr));
    	
    }
}
