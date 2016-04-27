package com.szfore.util;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Collection;
import java.util.Date;

/**
 * 自定义jstl函数
 * @author 罗季晖
 *
 */
public class CustomJSTLFunction {
	
	/**
	 * 获取日期
	 * @param reg
	 * @param seconds
	 * @return
	 */
	public static String date(String reg,Integer seconds){
		long milliseconds = seconds * 1000L;
		return DateUtil.dateFormat(reg,new Date(milliseconds));
	}
	
	public static String friendlyTime(Object time) {
		if(time instanceof Date) {
			return DateUtil.friendlyTime((Date) time);
		} else if(time instanceof String) {
			return DateUtil.friendlyTime(DateUtil.dateFormat(time.toString()));
		}
		return "";
	}
	
	public static String friendlyDay(Object starTime,Object endTime){
		if(starTime instanceof Date && endTime instanceof Date) {
			return DateUtil.friendlyTime((Date) starTime);
		} else if(starTime instanceof String) {
			return DateUtil.friendlyTime(DateUtil.dateFormat(starTime.toString()));
		}
		return "";
	}
	
	/**
	 * 判断是否在集合中
	 * @param coll
	 * @param obj
	 * @return
	 */
	public static boolean inCollection(Collection<Integer> coll,Integer obj){
		return coll.contains(obj);
	}
	
	/**
	 * urlencode
	 * @param info
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	public static String urlEncode(String info) throws UnsupportedEncodingException{
		if(info == null) return "";
		return URLEncoder.encode(info, "UTF-8");
	}
	
	/**
	 * 是否包含子字符串
	 * @param str
	 * @param subStr
	 * @return
	 */
	public static boolean contains(String str, String subStr)
	{
		return str.contains(subStr);
	}
	
	/**
	 * 连接字符串
	 * @param strA
	 * @param objB
	 * @return
	 */
	public static String concat(Object objA, Object objB)
	{
		return objA.toString() + objB.toString();
	}
}
