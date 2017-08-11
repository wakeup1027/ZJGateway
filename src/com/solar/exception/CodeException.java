package com.solar.exception;


import org.apache.struts2.json.annotations.JSON;

@SuppressWarnings("serial")
public class CodeException extends RuntimeException {
	private int code;
	private String message;
	
	public CodeException(int code){
		this.code = code;
	}
	public CodeException(int code,Throwable throwable){
		super(throwable);
		this.code = code;
	}
	public String getMessage() {
		return message==null?super.getMessage():message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public int getCode() {
		return code;
	}
	@JSON(serialize=false,deserialize=false)
	public StackTraceElement[] getStackTrace(){
		return super.getStackTrace();
	}
}