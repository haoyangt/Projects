package com.szfore.cache;

import java.util.List;
import java.util.Map;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import com.szfore.plugin.Page;
import com.szfore.util.DateUtil;

@Aspect
@Component
public class RedisCacheAspect {

	@Around("execution(* com.szfore.service.*.*(..)) && @annotation(redisCache) && args(keyword,page)")
	public Object getFromCache(ProceedingJoinPoint pjp,RedisCache redisCache,String keyword,Page page) throws Throwable {
		if(keyword != null && !"".equals(keyword)) {
			return  pjp.proceed();
		}
		List list = RedisManager.getInstance().findJobsFromCache(page);
		if(list != null && !list.isEmpty()) {
			return list;
		}
		return pjp.proceed();
	}
	
	@Around("execution(* com.szfore.service.*.*(..)) && @annotation(redisCache) && args(jobId)")
	public Object getFromCache(ProceedingJoinPoint pjp,RedisCache redisCache,int jobId) throws Throwable {
		Map map = RedisManager.getInstance().getJobDetailById(jobId);
		if(map != null && !map.isEmpty() ) {
			map.put("publishTime", DateUtil.dateFormat(map.get("publishTime").toString()));
			System.out.println("从缓存获取职位详细信息");
			return map;
		}
		return pjp.proceed();
	}
	
	
}
