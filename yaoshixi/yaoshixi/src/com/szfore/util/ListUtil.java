package com.szfore.util;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import jodd.bean.BeanUtil;
import jodd.typeconverter.Convert;
import jodd.typeconverter.TypeConverterManager;
import jodd.util.StringUtil;

public class ListUtil {
	
	/**
	 * 查找整数List中的最小整数
	 * @param ints
	 * @return
	 */
	public static int minIntInList(List<Integer> ints)
	{
		int min = ints.get(0);
		for (Integer integer : ints) 
		{
			if(min > integer)
			{
				min = integer;
			}
		}
		return min;
	}
	
	public static <T> List<Object> extractUniquePropertyOfBeans(List<T> beans, String propertyName){
		Set<Object> set = new HashSet<Object>();
		for (T bean : beans) 
		{
			Object propertyValue = BeanUtil.getPropertySilently(bean, propertyName);
			set.add(propertyValue);
		}
		List<Object> list = new ArrayList<Object>();
		for (Object object : set) 
		{
			list.add(object);
		}
		return list;
	}
	
	/**
	 * 抽取某个属性
	 * @param beans
	 * @param property
	 * @param cls
	 * @return
	 */
	public static <T,K> List<K> extractPropertyOfBeans(List<T> beans, String property,Class<K> cls){
		List<K> list = new ArrayList<K>();
		for (T t : beans) {
			Object propertyValue = BeanUtil.getPropertySilently(t, property);
			K k = propertyValue == null ? null : TypeConverterManager.convertType(propertyValue, cls);
			list.add(k);
		}
		return list;
	}
	
	public static <T> Map<Object, T> listToMap(List<T> list, String propertyName)
	{
		Map<Object, T> map = new HashMap<Object, T>();
		for (T t : list) 
		{
			Object propertyValue = BeanUtil.getPropertySilently(t, propertyName);
			if(!map.containsKey(propertyValue))
			{
				map.put(propertyValue, t);
			}
		}
		return map;
	}
	
	/**
	 * 根据某个属性分组
	 * @param list
	 * @param propertyName
	 * @return
	 */
	public static <T> Map<Object, List<T>> groupByProperties(List<T> list, String propertyName){
		Map<Object, List<T>> map = new HashMap<Object, List<T>>();
		for (T t : list) {
			Object propertyValue = BeanUtil.getPropertySilently(t, propertyName);
			if(map.containsKey(propertyValue)){
				map.get(propertyValue).add(t);
			}else{
				List<T> tmpList = new ArrayList<T>();
				tmpList.add(t);
				map.put(propertyValue, tmpList);
			}
		}
		return map;
	}
	
	/**
	 * 按两个属性分组
	 * @param list
	 * @param first
	 * @param second
	 * @return
	 */
	public static <T> Map<Object, Map<Object, T>> uniqueGroupByTwoProperties(List<T> list, String first,String second){
		Map<Object, Map<Object, T>> map = new HashMap<Object, Map<Object, T>>();
		for (T t : list) {
			Object firstProperty = BeanUtil.getPropertySilently(t, first);
			Object secondProperty = BeanUtil.getPropertySilently(t, second);
			if(map.containsKey(firstProperty)){
				map.get(firstProperty).put(secondProperty,t);
			}else{
				Map<Object, T> tmp = new HashMap<Object, T>();
				tmp.put(secondProperty, t);
				map.put(firstProperty, tmp);
			}
		}
		return map;
	}
	/**
	 * 按两个属性分组
	 * @param list
	 * @param first
	 * @param second
	 * @return
	 */
	public static <T> Map<Object, Map<Object, List<T>>> groupByTwoProperties(List<T> list, String first,String second){
		Map<Object, Map<Object, List<T>>> map = new HashMap<Object, Map<Object, List<T>>>();
		for (T t : list) {
			Object firstProperty = BeanUtil.getPropertySilently(t, first);
			Object secondProperty = BeanUtil.getPropertySilently(t, second);
			if(map.containsKey(firstProperty)  && map.get(firstProperty).containsKey(secondProperty)){
					map.get(firstProperty).get(secondProperty).add(t);
			}else if(map.containsKey(firstProperty)){
				List<T> tmp = new ArrayList<T>();
				tmp.add(t);
				map.get(firstProperty).put(secondProperty, tmp);
			}else{
				Map<Object, List<T>> tmpMap = new HashMap<Object, List<T>>();
				List<T> tmp = new ArrayList<T>();
				tmp.add(t);
				tmpMap.put(secondProperty, tmp);
				map.put(firstProperty, tmpMap);
			}
		}
		return map;
	}
	/**
	 * 求平均
	 * @param list
	 * @return
	 */
	public static <T> double avg(List<T> list){
		double avg = 0;
		for (T value : list) {
			double val = value == null ? 0 : Convert.toDouble(value, 0d);
			avg += val;
		}
		int length = list.size() == 0 ? 1 : list.size();
		return avg/length;
	}
	public static <T> double sum(List<T> list){
		double sum = 0;
		for (T value : list) {
			double val = value == null ? 0 : Convert.toDouble(value, 0d);
			sum += val;
		}
		return sum;
	}
	
	/**
	 * arr转list
	 * @param arr
	 * @return
	 */
	public static <T> List<T> arrayToList(T[] arr){
		List<T> tmp = new LinkedList<T>();
		if(arr == null){
			return tmp;
		}
		return Arrays.asList(arr);
	}
	public static List<Double> arrayToList(double[] arr){
		if(arr == null){
			return new ArrayList<Double>();
		}
		List<Double> tmp = new LinkedList<Double>();
		for (double value : arr) {
			tmp.add(value);
		}
		return tmp;
	}
	
	/**
	 * list转array
	 * @param list
	 * @param cls
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static <T> T[] listToArr(List<T> list,Class<T> cls){
		if(list == null || list.isEmpty()){
			return null;
		}
		T[] tmp = (T[]) Array.newInstance(cls, list.size());
		return list.toArray(tmp);
	}
	
	public static String joinToStr(List<String> strList, String seperator) 
	{
		if(strList == null || strList.size() <= 0)
		{
			return "";
		}
		StringBuilder strBuilder = new StringBuilder();
		for (String str : strList) 
		{
			strBuilder.append(str).append(seperator);
		}
		return strBuilder.substring(0, strBuilder.length() - seperator.length());
	}
	
	public static boolean contains(List<String> mainList, List<String> subList) 
	{
		if(mainList == null || subList == null || mainList.size() < subList.size())
		{
			return false;
		}
		
		for (int i = 0 ; i < subList.size(); i++) 
		{
			if(!mainList.get(i).equals(subList.get(i)))
			{
				return false;
			}
		}
		return true;
	}

	public static String[]  toStringArray(Collection<?> col) {
		if(col == null || col.size() == 0){
			return null;
		}
		String[] tmp = new String[col.size()];
		int tmpi = 0;
		for (Object obj : col) {
			tmp[tmpi++] = StringUtil.toSafeString(obj);
		}
		return tmp;
	}
}
