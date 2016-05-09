package com.gp.web.servlet;

import java.io.IOException;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
 
public class MultipartRequestHandler {
 
	static Logger LOGGER = LoggerFactory.getLogger(MultipartRequestHandler.class);
	
    public static List<FileMeta> uploadByJavaServletAPI(HttpServletRequest request) throws IOException, ServletException{
 
        List<FileMeta> files = new LinkedList<FileMeta>();
 
        // 1. Get all parts
        Collection<Part> parts = request.getParts();
        
        // 3. Go over each part
        FileMeta temp = null;
        for(Part part:parts){
        	
        	LOGGER.debug("name :{}/ ctyep :{}",part.getName(), part.getContentType());
            // 3.1 if part is multiparts "file"
            if(part.getContentType() != null){
 
                // 3.2 Create a new FileMeta object
                temp = new FileMeta();
                temp.setFileName(getFilename(part));
                temp.setFileSize(part.getSize()/1024 +" Kb");
                temp.setFileType(part.getContentType());
                temp.setContent(part.getInputStream());

                // 3.3 Add created FileMeta object to List<FileMeta> files
                files.add(temp);
 
            }
        }
        return files;
    }
 
    // this method is used to get file name out of request headers
    // 
    private static String getFilename(Part part) {
        for (String cd : part.getHeader("content-disposition").split(";")) {
            if (cd.trim().startsWith("filename")) {
                String filename = cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
                return filename.substring(filename.lastIndexOf('/') + 1).substring(filename.lastIndexOf('\\') + 1); // MSIE fix.
            }
        }
        return null;
    }
}
