package com.szfore.util;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jodd.io.FileUtil;
import jodd.util.StringUtil;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

/**
 * action工具类
 * @author 罗季晖
 *
 */
public class ActionUtil {
	
	private static final String REDIRECT = "redirect:";//重定向前缀
	private static final String FORWARD = "forward:";//forward前缀
	
	private static final String UPLOAD_PATH="WEB-INF/upload/";
	private static final String DOWNLOAD_PATH="res/module/";
	
	private static final String FIREFOX = "firefox";
	/**
	 * 重定向返回视图
	 * @param url
	 * @return
	 */
	public static ModelAndView redirectToView(String url){
		return new ModelAndView(REDIRECT + url);
	}
	
	/**
	 * 重定向返回视图
	 * @param url
	 * @param datas
	 * @return
	 */
	public static ModelAndView redirectToView(String url,Map<String, Object> datas){
		return new ModelAndView(REDIRECT + url,datas);
	}
	
	/**
	 * forward返回视图
	 * @param url
	 * @return
	 */
	public static ModelAndView forwardToView(String url){
		return new ModelAndView(FORWARD + url);
	}
	
	/**
	 * forward返回视图
	 * @param url
	 * @param datas
	 * @return
	 */
	public static ModelAndView forwardToView(String url,Map<String, Object> datas){
		return new ModelAndView(FORWARD + url,datas);
	}
	/**
	 * 重定向返回字符串
	 * @param url
	 * @return
	 */
	public static String redirectTo(String url){
		return REDIRECT + url;
	}
	/**
	 * forward返回字符串
	 * @param url
	 * @return
	 */
	public static String forwardTo(String url){
		return FORWARD + url;
	}
	
	/**
	 * 文件上传
	 * @param request
	 * @param file
	 * @return
	 */
	public static String upload(HttpServletRequest request,MultipartFile file){
		final String uploadPath = getRootPath(request);
		String savePath = uploadPath + UPLOAD_PATH + DateUtil.getNowTimeFormat("yyyy-MM");
		String suffix = "";
		if(file.getOriginalFilename()!=null && !"".equals(file.getOriginalFilename())){
			String fileName = file.getOriginalFilename();
			System.out.println("fileName===="+fileName);
			if(fileName.indexOf(".jpg")!=-1 || fileName.indexOf(".JPG")!=-1){
				System.out.println("11111111111111111111111");
				suffix = ".jpg";
			}else if(fileName.indexOf(".png")!=-1 || fileName.indexOf(".PNG")!=-1){
				suffix = ".png";
			}else{
				suffix = file.getOriginalFilename();
			}
		}
		String saveName = savePath + "/" + UUID.randomUUID().toString() + "_ysx" + suffix;
		try {
			File saveFile = new File(saveName);
			if(!saveFile.getParentFile().exists()){
				FileUtil.mkdirs(saveFile.getParentFile());
			}
			FileUtil.writeStream(saveFile, file.getInputStream());
		} catch (IOException e) {
			e.printStackTrace();
			saveName = null;
		}
		return saveName;
	}
	
	/**
	 * 下载文件
	 * @param file
	 * @param response
	 */
	public static void downloadModuleFile(String fileName, HttpServletRequest request,HttpServletResponse response) {
		File file = new File(getRootPath(request) + DOWNLOAD_PATH + fileName);
		downloadFile(request, response, file);
	}

	public static void downloadFile(HttpServletRequest request,
			HttpServletResponse response, File file) {
		OutputStream os = null;
		try {
			os = response.getOutputStream();
			response.reset();
			String fileNameTmp = isFirefox(request) ? new String(file.getName().getBytes("UTF-8"),"ISO8859-1") : URLEncoder.encode(file.getName(), "utf-8");
			response.setHeader("Content-Disposition", "attachment; filename=" + fileNameTmp);
			response.setContentType("application/octet-stream; charset=utf-8");
			os.write(FileUtil.readBytes(file));
			os.flush();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (os != null) {
				try {
					os.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	
	private static boolean isFirefox(HttpServletRequest request){
		String userAgent = request.getHeader("user-agent");
		return StringUtil.indexOfIgnoreCase(userAgent, FIREFOX) != -1;
	}
	
	public static String getRootPath(HttpServletRequest request){
		return request.getServletContext().getRealPath("/");
	}
	
	public static boolean checkFileType(String filePath,String... fileSuffix){
		return StringUtil.endsWithOneIgnoreCase(filePath, fileSuffix) != -1;
	}
	
	public static void downloadXLSFile(String fileName,
			Object[][] datas,
			HttpServletRequest request,
			HttpServletResponse response){
		ServletOutputStream out = null;
		try {
			out = response.getOutputStream();
			response.reset();
			String fileNameTmp = isFirefox(request) ? new String(fileName.getBytes("UTF-8"),"ISO8859-1") : URLEncoder.encode(fileName, "utf-8");
			response.setHeader("Content-Disposition", "attachment; filename=" + fileNameTmp);
			response.setContentType("application/octet-stream; charset=utf-8");
			Excel2003Util.downloadExcel(out, datas);
			response.flushBuffer();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (out != null) {
				try {
					out.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
}
