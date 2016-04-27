package com.szfore.action.exception;

public class IllegalParameterException extends Exception {
	
	private static final long serialVersionUID = 1L;

	public IllegalParameterException()
	{
		super("非法的请求参数");
	}
}
