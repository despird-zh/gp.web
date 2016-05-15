package com.gp.web.servlet;

import java.io.InputStream;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.gp.storage.ContentRange;
 
@JsonIgnoreProperties({"content"})
public class PartMeta {
 
	private String fileId;
    private String name;

    private ContentRange contentRange = null;
    
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

	public String getContentType() {
		return contentType;
	}

	public void setContentType(String contentType) {
		this.contentType = contentType;
	}
 
	public Boolean isChunkPart(){
		
		if(contentRange.getFileSize() > 0 
			&& contentRange.getRangeLength() != contentRange.getFileSize()){
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

	public ContentRange getContentRange() {
		return contentRange;
	}

	public void setContentRange(ContentRange contentRange) {
		this.contentRange = contentRange;
	}

}
