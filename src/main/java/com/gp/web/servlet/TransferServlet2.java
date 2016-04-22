package com.gp.web.servlet;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import java.util.regex.Pattern;

import javax.imageio.ImageIO;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * Servlet implementation class TransferServlet
 */
@WebServlet("/TransferServlet")
public class TransferServlet2 extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	// private static final long serialVersionUID = 1L;
	private File fileUploadPath;

	private static ObjectMapper objMapper = new ObjectMapper();
	
	@Override
	public void init(ServletConfig config) {
		fileUploadPath = new File(config.getInitParameter("upload_path"));
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 * 
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (request.getParameter("getfile") != null && !request.getParameter("getfile").isEmpty()) {
			File file = new File(fileUploadPath, request.getParameter("getfile"));
			if (file.exists()) {
				int bytes = 0;
				ServletOutputStream op = response.getOutputStream();

				response.setContentType(getMimeType(file));
				response.setContentLength((int) file.length());
				response.setHeader("Content-Disposition", "inline; filename=\"" + file.getName() + "\"");

				byte[] bbuf = new byte[1024];
				DataInputStream in = new DataInputStream(new FileInputStream(file));

				while ((in != null) && ((bytes = in.read(bbuf)) != -1)) {
					op.write(bbuf, 0, bytes);
				}

				in.close();
				op.flush();
				op.close();
			}
		} else if (request.getParameter("delfile") != null && !request.getParameter("delfile").isEmpty()) {
			File file = new File(fileUploadPath, request.getParameter("delfile"));
			if (file.exists()) {
				file.delete();
			}
		} else if (request.getParameter("getthumb") != null && !request.getParameter("getthumb").isEmpty()) {
			File file = new File(fileUploadPath, request.getParameter("getthumb"));
			if (file.exists()) {
				String mimetype = getMimeType(file);
				if (mimetype.endsWith("png") || mimetype.endsWith("jpeg") || mimetype.endsWith("gif")) {
					BufferedImage im = ImageIO.read(file);
					if (im != null) {
						BufferedImage thumb = null;// Scalr.resize(im, 75);
						ByteArrayOutputStream os = new ByteArrayOutputStream();
						if (mimetype.endsWith("png")) {
							ImageIO.write(thumb, "PNG", os);
							response.setContentType("image/png");
						} else if (mimetype.endsWith("jpeg")) {
							ImageIO.write(thumb, "jpg", os);
							response.setContentType("image/jpeg");
						} else {
							ImageIO.write(thumb, "GIF", os);
							response.setContentType("image/gif");
						}
						ServletOutputStream srvos = response.getOutputStream();
						response.setContentLength(os.size());
						response.setHeader("Content-Disposition", "inline; filename=\"" + file.getName() + "\"");
						os.writeTo(srvos);
						srvos.flush();
						srvos.close();
					}
				}
			} 
		} else {
			PrintWriter writer = response.getWriter();
			writer.write("call POST with multipart form data");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 * 
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		doSinglePost(request, response);
	}
	
	protected void doSinglePost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (!ServletFileUpload.isMultipartContent(request)) {
			throw new IllegalArgumentException(
					"Request is not multipart, please 'multipart/form-data' enctype for your form.");
		}

		ServletFileUpload uploadHandler = new ServletFileUpload(new DiskFileItemFactory());
		PrintWriter writer = response.getWriter();
		response.setContentType("application/json");

		Map<String, Object> data = new HashMap<String, Object>();
		try {
			List<FileItem> items = uploadHandler.parseRequest(request);
			for (FileItem item : items) {
				if (!item.isFormField()) {
					File file = new File(fileUploadPath, item.getName());
					item.write(file);
					data.put("name", item.getName());
					data.put("size", item.getSize());
					data.put("url", "upload?getfile=" + item.getName());
					data.put("thumbnail_url", "upload?getthumb=" +
					item.getName());
					data.put("delete_url", "upload?delfile=" +
					item.getName());
					data.put("delete_type", "GET");
				}
			}
		} catch (FileUploadException e) {
			throw new RuntimeException(e);
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			writer.write(objMapper.writeValueAsString(data));
			writer.close();
		}

	}

	private String getMimeType(File file) {
		String mimetype = "";
		if (file.exists()) {
			// URLConnection uc = new URL("file://" +
			// file.getAbsolutePath()).openConnection();
			// String mimetype = uc.getContentType();
			// MimetypesFIleTypeMap gives PNG as application/octet-stream, but
			// it seems so does URLConnection
			// have to make dirty workaround
			if (getSuffix(file.getName()).equalsIgnoreCase("png")) {
				mimetype = "image/png";
			} else {
				javax.activation.MimetypesFileTypeMap mtMap = new javax.activation.MimetypesFileTypeMap();
				mimetype = mtMap.getContentType(file);
			}
		}
		System.out.println("mimetype: " + mimetype);
		return mimetype;
	}

	private String getSuffix(String filename) {
		String suffix = "";
		int pos = filename.lastIndexOf('.');
		if (pos > 0 && pos < filename.length() - 1) {
			suffix = filename.substring(pos + 1);
		}
		System.out.println("suffix: " + suffix);
		return suffix;
	}

	protected void doChunkPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   
		String range = request.getHeader("Content-Range");
	    long fileFullLength = -1;
	    long chunkFrom = -1;
	    long chunkTo = -1;
	    if (range != null) {
	        if (!range.startsWith("bytes "))
	            throw new ServletException("Unexpected range format: " + range);
	        String[] fromToAndLength = range.substring(6).split(Pattern.quote("/"));
	        fileFullLength = Long.parseLong(fromToAndLength[1]);
	        String[] fromAndTo = fromToAndLength[0].split(Pattern.quote("-"));
	        chunkFrom = Long.parseLong(fromAndTo[0]);
	        chunkTo = Long.parseLong(fromAndTo[1]);
	    }
	    File tempDir = new File(System.getProperty("java.io.tmpdir"));  // Configure according 
	    File storageDir = tempDir;                                      // project server environment.
	    String uploadId = null;
	    FileItemFactory factory = new DiskFileItemFactory(10000000, tempDir);
	    ServletFileUpload upload = new ServletFileUpload(factory);
	    try {
	        List<?> items = upload.parseRequest(request);
	        Iterator<?> it = items.iterator();
	        List<Map<String, Object>> ret = new ArrayList<Map<String,Object>>();
	        while (it.hasNext()) {
	            FileItem item = (FileItem) it.next();
	            if (item.isFormField()) {
	                if (item.getFieldName().equals("uploadId"))
	                        uploadId = item.getString();
	            } else {
	                Map<String, Object> fileInfo = new LinkedHashMap<String, Object>();
	                File assembledFile = null;
	                fileInfo.put("name", item.getName());
	                fileInfo.put("type", item.getContentType());
	                File dir = new File(storageDir, uploadId);
	                if (!dir.exists())
	                    dir.mkdir();
	                if (fileFullLength < 0) {  // File is not chunked
	                    fileInfo.put("size", item.getSize());
	                    assembledFile = new File(dir, item.getName());
	                    item.write(assembledFile);
	                } else {  // File is chunked
	                    byte[] bytes = item.get();
	                    if (chunkFrom + bytes.length != chunkTo + 1)
	                        throw new ServletException("Unexpected length of chunk: " + bytes.length + 
	                                " != " + (chunkTo + 1) + " - " + chunkFrom);
	                    saveChunk(dir, item.getName(), chunkFrom, bytes, fileFullLength);
	                    TreeMap<Long, Long> chunkStartsToLengths = getChunkStartsToLengths(dir, item.getName());
	                    long lengthSoFar = getCommonLength(chunkStartsToLengths);
	                    fileInfo.put("size", lengthSoFar);
	                    if (lengthSoFar == fileFullLength) {
	                        assembledFile = assembleAndDeleteChunks(dir, item.getName(), 
	                                new ArrayList<Long>(chunkStartsToLengths.keySet()));
	                    }
	                }
	                if (assembledFile != null) {
	                    fileInfo.put("complete", true);
	                    fileInfo.put("serverPath", assembledFile.getAbsolutePath());
	                    // Here you can do something with fully assembled file.
	                }
	                ret.add(fileInfo);
	            }
	        }
	        Map<String, Object> filesInfo = new LinkedHashMap<String, Object>();
	        filesInfo.put("files", ret);
	        response.setContentType("application/json");
	        response.getWriter().write(new ObjectMapper().writeValueAsString(filesInfo));
	        response.getWriter().close();
	    } catch (ServletException ex) {
	        throw ex;
	    } catch (Exception ex) {
	        ex.printStackTrace();
	        throw new ServletException(ex);
	    }
	}

	private static void saveChunk(File dir, String fileName, 
	        long from, byte[] bytes, long fileFullLength) throws IOException {
	    File target = new File(dir, fileName + "." + from + ".chunk");
	    OutputStream os = new FileOutputStream(target);
	    try {
	        os.write(bytes);
	    } finally {
	        os.close();
	    }
	}

	private static TreeMap<Long, Long> getChunkStartsToLengths(File dir, 
	        String fileName) throws IOException {
	    TreeMap<Long, Long> chunkStartsToLengths = new TreeMap<Long, Long>();
	    for (File f : dir.listFiles()) {
	        String chunkFileName = f.getName();
	        if (chunkFileName.startsWith(fileName + ".") && 
	                chunkFileName.endsWith(".chunk")) {
	            chunkStartsToLengths.put(Long.parseLong(chunkFileName.substring(
	                    fileName.length() + 1, chunkFileName.length() - 6)), f.length());
	        }
	    }
	    return chunkStartsToLengths;
	}

	private static long getCommonLength(TreeMap<Long, Long> chunkStartsToLengths) {
	    long ret = 0;
	    for (long len : chunkStartsToLengths.values())
	        ret += len;
	    return ret;
	}

	private static File assembleAndDeleteChunks(File dir, String fileName, 
	        List<Long> chunkStarts) throws IOException {
	    File assembledFile = new File(dir, fileName);
	    if (assembledFile.exists()) // In case chunks come in concurrent way
	        return assembledFile;
	    OutputStream assembledOs = new FileOutputStream(assembledFile);
	    byte[] buf = new byte[100000];
	    try {
	        for (long chunkFrom : chunkStarts) {
	            File chunkFile = new File(dir, fileName + "." + chunkFrom + ".chunk");
	            InputStream is = new FileInputStream(chunkFile);
	            try {
	                while (true) {
	                    int r = is.read(buf);
	                    if (r == -1)
	                        break;
	                    if (r > 0)
	                        assembledOs.write(buf, 0, r);
	                }
	            } finally {
	                is.close();
	            }
	            chunkFile.delete();
	        }
	    } finally {
	        assembledOs.close();
	    }
	    return assembledFile;
	}
}
