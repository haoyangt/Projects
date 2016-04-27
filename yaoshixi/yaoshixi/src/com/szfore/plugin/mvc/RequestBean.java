package com.szfore.plugin.mvc;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 自定义注入注解
 * @author zhangyong 
 * Sep 22, 2013-10:29:33 AM
 * info:
 */
@Target(ElementType.PARAMETER)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface RequestBean {
	String value() default "_def_param_name";
}
