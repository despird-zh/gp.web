package com.gp.web.servlet;

import java.io.InputStream;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
 
@JsonIgnoreProperties({"content"})
public class FilePart {
 
	private String fileId;
    private String name;
    private Long fileSize;
    private Long chunkStart =0l;
    private Long chunkEnd = 0l;
    private String extension;
    private String contentType;
    
    private InputStream content;


	public InputStream getContent() {
		return content;
	}

	public void setContent(InputStream content) {
		this.content = content;
	}

	public String getFileId() {
		return fileId;
	}

	public void setFileId(String fileId) {
		this.fileId = fileId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Long getFileSize() {
		return fileSize;
	}

	public void setFileSize(Long fileSize) {
		this.fileSize = fileSize;
	}

	public Long getChunkStart() {
		return chunkStart;
	}

	public void setChunkStart(Long chunkStart) {
		this.chunkStart = chunkStart;
	}

	public Long getChunkEnd() {
		return chunkEnd;
	}

	public void setChunkEnd(Long chunkEnd) {
		this.chunkEnd = chunkEnd;
	}

	public String getContentType() {
		return contentType;
	}

	public void setContentType(String contentType) {
		this.contentType = contentType;
	}
 
	public Boolean isChunkPart(){
		
		if(fileSize > 0 && (chunkEnd - chunkStart + 1) != fileSize){
			return true;
		}else{
			return false;
		}
	}

	public String getExtension() {
		return extension;
	}

	public void setExtension(String extension) {
		this.extension = extension;
	}
}
