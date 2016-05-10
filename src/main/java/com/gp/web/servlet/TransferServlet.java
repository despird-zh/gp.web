package com.gp.web.servlet;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * Servlet implementation class TransferServlet
 */
@MultipartConfig
public class TransferServlet extends HttpServlet {
 
    private static final long serialVersionUID = 1L;

    /***************************************************
     * URL: /upload
     * doPost(): upload the files and other parameters
     ****************************************************/
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
 
        // 1. Upload File Using Java Servlet API
    	FilePart fmeta = MultipartRequestHandler.uploadByJavaServletAPI(request);            
    	
        // 2. Set response type to json
        response.setContentType("application/json");
 
        // 3. Convert List<FileMeta> into JSON format
        ObjectMapper mapper = new ObjectMapper();
        // 4. Send resutl to client
        mapper.writeValue(response.getOutputStream(), fmeta);
 
    }
    /***************************************************
     * URL: /upload?f=value
     * doGet(): get file of index "f" from List<FileMeta> as an attachment
     ****************************************************/
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
 
    	// 1. Get f from URL upload?f="?"
    	String value = request.getParameter("f");

    	// 2. Get the file of index "f" from the list "files"
    	FilePart getFile = new FilePart();//files.get(Integer.parseInt(value));
 
    	try {        
			// 3. Set the response content type = file content type 
			response.setContentType(getFile.getContentType());
			 
			// 4. Set header Content-disposition
			 response.setHeader("Content-disposition", "attachment; filename=\""+getFile.getName()+"\"");
			 
			// 5. Copy file inputstream to response outputstream
			InputStream input = getFile.getContent();
			OutputStream output = response.getOutputStream();
			byte[] buffer = new byte[1024*10];
			 
			for (int length = 0; (length = input.read(buffer)) > 0;) {
				output.write(buffer, 0, length);
			}
			
			output.close();
			input.close();
         }catch (IOException e) {
        	 e.printStackTrace();
         }
 
    }
}