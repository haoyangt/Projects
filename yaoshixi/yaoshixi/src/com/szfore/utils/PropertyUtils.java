package com.szfore.utils;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;


/**
 * 读取配置文件的工具类
 * @author WangLinkai
 *
 */


public class PropertyUtils {


/**
 * 所有的配置文件都放在一个property文件里面，如果读取多个文件，此属性会被覆盖
 */
	private static Properties properties;


	/**
	 * 配置文件需要放在src根目录下
	 * @param propertiiesName
	 * @return
	 */
	public static void readProperty(String propertiiesName) {
		Properties p = new Properties();
		InputStream in= PropertyUtils.class.getResourceAsStream("/"+propertiiesName);
		try {
			p.load(in);
			properties = p;
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	/**
	 * 根据key 返回string值
	 * @param key
	 * @return
	 */
	public static String getProperty(String key) {
		checkProperty();
		return properties.getProperty(key);
	}
	
	public static String getProperty(String key, String defaultValue) {
		checkProperty();
		return properties.getProperty(key, defaultValue);
	}
	
	public static Integer getPropertyToInt(String key) {
		checkProperty();
		Integer resultInt = null;
		String resultStr = properties.getProperty(key);
		if (resultStr != null)
			resultInt =  Integer.parseInt(resultStr);
		return resultInt;
	}
	
	public static Integer getPropertyToInt(String key,Integer defaultValue) {
		Integer result = getPropertyToInt(key);
		return result != null ? result : defaultValue;
	}
	
	
	public static Boolean getPropertyToBoolean(String key) {
		checkProperty();
		String resultStr = properties.getProperty(key);
		Boolean resultBool = null;
		if (resultStr != null) {
			if (resultStr.trim().equalsIgnoreCase("true"))
				resultBool = true;
			else if (resultStr.trim().equalsIgnoreCase("false"))
				resultBool = false;
		}
		return resultBool;
	}
	
	public static boolean getPropertyToBoolean(String key, boolean defaultValue) {
		Boolean result = getPropertyToBoolean(key);
		return result != null ? result : defaultValue;
	}
	
	private static void checkProperty() {
		if(properties == null) {
			readProperty("config.properties");
		} 
	}
}

