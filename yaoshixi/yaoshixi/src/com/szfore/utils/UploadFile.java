/*
 * $id$
 * Copyright (C) 2015 Sinosoft. Information Engineering Dept.5 Group.
 */
package com.szfore.utils;

import java.io.File;

/**
 * <p><br/>
 * @className UploadFile.java<br/>
 * @packageName com.szfore.utils<br/>
 * @date 2015-2-27 上午11:06:17<br/>
 * </p>
 * 
 * @author yejian
 * @version v1.0.0
 */
public class UploadFile {
private String parameterName;
	
	private String saveDirectory;
	private String fileName;
	private String originalFileName;
	private String contentType;
	
	public UploadFile(String parameterName, String saveDirectory, String filesystemName, String originalFileName, String contentType) {
		this.parameterName = parameterName;
		this.saveDirectory = saveDirectory;
		this.fileName = filesystemName;
		this.originalFileName = originalFileName;
		this.contentType = contentType;
	}
	
	public String getParameterName() {
		return parameterName;
	}
	
	public String getFileName() {
		return fileName;
	}
	
	public String getOriginalFileName() {
		return originalFileName;
	}
	
	public String getContentType() {
		return contentType;
	}
	
	public String getSaveDirectory() {
		return saveDirectory;
	}
	
	public File getFile() {
		if (saveDirectory == null || fileName == null) {
			return null;
		} else {
			return new File(saveDirectory + File.separator + fileName);
		}
	}
}
