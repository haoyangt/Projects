package com.szfore.utils;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.URL;
import java.net.URLConnection;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.i18n.LocaleContextHolder;
import org.w3c.tidy.Configuration;
import org.w3c.tidy.Tidy;

/**
 * 
 * @author WangLinkai
 * email:wanglk@szfore.com
 * Dec 6, 2013
 */
public class FileUtils {

	public static void copyFile(InputStream inputStream,String destPath) {
		
		FileInputStream fis   = null;
		FileOutputStream fos = null;
		try {
			fis = (FileInputStream)inputStream;
			fos = new FileOutputStream(destPath);
			int len = 0;
			byte[] buffer = new byte[10*1024];
			while((len = fis.read(buffer)) != -1) {
				fos.write(buffer, 0, len);
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				fos.flush();
				fis.close();
				fos.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}
