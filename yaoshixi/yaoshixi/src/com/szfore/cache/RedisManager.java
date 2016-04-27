package com.szfore.cache;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.SortingParams;

import com.google.gson.Gson;
import com.szfore.plugin.Page;
import com.szfore.util.DateUtil;
import com.szfore.utils.PropertyUtils;

/**
 * Redis缓存管理器
 * @author WangLinkai
 * email:wanglk@szfore.com
 * Dec 10, 2013
 */
public class RedisManager {
	
	public static final String DB_JOB_LIST = "c_job:list";
	public static final String DB_JOB_ID = "c_job:id:";
	public static final String DB_JOB_TOTAL_PAGE = "c_job:totalPage";
	public static final String DB_JOB_TOTAL_RECORD = "c_job:totalRecord";
	

	private static Jedis jedis = null;
	private static RedisManager instance = null;
	private Gson gson = new Gson();
	
	public RedisManager() {}
	
	public static RedisManager getInstance() {
		if(instance == null) {
			synchronized (RedisManager.class) {
				instance = new RedisManager();
				init();
			}
		}
		return instance;
	}
	
	private static void init() {
		jedis = new Jedis(PropertyUtils.getProperty("host"), PropertyUtils.getPropertyToInt("redisPort"));
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List findJobsFromCache(Page page) {
		List<Map<String,String>> list = new ArrayList<Map<String,String>>();
		SortingParams sp = new SortingParams();
		sp.desc();
		sp.get(DB_JOB_ID+"*");
		List<String> jsonList  = jedis.sort(DB_JOB_LIST, sp);
		int totalRecord = Integer.parseInt(jedis.get(DB_JOB_TOTAL_RECORD) == null?"0":jedis.get(DB_JOB_TOTAL_RECORD));
		System.out.println("totalRecord:"+totalRecord);
		int totalPage = Integer.parseInt(jedis.get(DB_JOB_TOTAL_PAGE) == null?"0":jedis.get(DB_JOB_TOTAL_RECORD));
		System.out.println("totalPage:"+totalPage);
		page.setTotalRecord(totalRecord);
		page.setTotalPage(totalPage);
		int size = jsonList.size();
		
	/*	if(size > page.getNumPerPage()) {
			jsonList = jsonList.subList((page.getPageNum()-1)*page.getNumPerPage(), page.getNumPerPage());
		}*/
		
		int start = (page.getPageNum()-1) * page.getNumPerPage();
		if(start > size) {
			return null;
		}
		int end = start + page.getNumPerPage();
		if(size < end) {
			end = size;
		}
		for(int i=start; i<end; i++) {
			Map<String,String> map = gson.fromJson(jsonList.get(i), HashMap.class);
			list.add(map);
		}
		
		return list;
	}
	
	public void cacheJobs(List<Map<String,Object>> list,Page<Map<String,Object>> page) {
		int size = list.size();
		jedis.flushDB();
		for(int i=size-1; i>=0; i--) {
			Map<String,Object> map = list.get(i);
			map.put("publishTime", DateUtil.dateFormat("yyyy-MM-dd HH:mm:ss", map.get("publishTime")));
			int id = Integer.parseInt(map.get("id").toString());
			jedis.sadd(DB_JOB_LIST, String.valueOf(id));
			jedis.set(DB_JOB_ID+id, gson.toJson(map));
		}
		jedis.set(DB_JOB_TOTAL_RECORD, String.valueOf(page.getTotalRecord()));
		jedis.setnx(DB_JOB_TOTAL_PAGE, String.valueOf(page.getTotalPage()));
	}
	
	/**
	 * 根据jobId 查找详情。
	 * @param id
	 * @return
	 */
	public Map getJobDetailById(int id) {
		return gson.fromJson(jedis.get(DB_JOB_ID+id), HashMap.class);
	}
	
	/**
	 * 根据键从缓存中获取数据
	 * @param key
	 * @return
	 */
	public Map getMapFromCache(String key) {
		return gson.fromJson(jedis.get(key), HashMap.class);
	}
	
	/**
	 * 根据
	 * @param key
	 * @return
	 */
	public String getStringFromCache(String key) {
		return jedis.get(key);
	}
	
	
	@SuppressWarnings("rawtypes")
	public static void main(String[] args) {
		/*List<Map<String, String>> list = new ArrayList<Map<String,String>>();
		for(int i=100; i>=0; i--) {
			Map<String,String> map = new HashMap<String, String>();
			map.put("id", String.valueOf((i+1)));
			map.put("jobName", "职位名称："+(i+1));
			map.put("publishTime", DateUtil.dateFormat("yyyy-MM-dd HH:mm:ss", new Date()));
			list.add(map);
		}
		RedisManager.getInstance().cacheJobs(list);*/
		
	/*	List<Map<String,String>> jobs = RedisManager.getInstance().findJobsFromCache(new Page());
		for(int i=0; i<jobs.size(); i++) {
			Map<String,String> map = jobs.get(i);
			System.out.println(map.get("jobName"));
		}*/
		
		jedis = new Jedis(PropertyUtils.getProperty("host"), PropertyUtils.getPropertyToInt("redisPort"));
		jedis.flushAll();
		jedis.sadd("c_job:list", "2","3","11");
		jedis.sadd("c_job:list", "2","3","11");
		
		jedis.set("c_job:id:11", "{'title':'职位11'}");
		jedis.set("c_job:id:2", "{'title':'职位2'}");
		jedis.set("c_job:id:3", "{'title':'职位3'}");
		
		SortingParams sp = new SortingParams();
		sp.desc();
		sp.get("c_job:id:*");
		List<String> list = jedis.sort("c_job:list", sp);
		for(int i=0; i<list.size(); i++) {
			System.out.println(list.get(i).toString());
		}
		
	}
	
}
