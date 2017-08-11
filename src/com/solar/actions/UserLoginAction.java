package com.solar.actions;

import com.opensymphony.xwork2.ActionContext;

public class UserLoginAction {
	//用户名
	private String userName;
	//密码
	private String passWord;
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassWord() {
		return passWord;
	}
	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}
	
	public String login(){
		return "login";
	}
	
	//登录校验
	public String loginJump(){
		System.out.println(userName+passWord);
		if("admin".equals(userName)&&"admin".equals(passWord)){
			return "success";
		}else{
			
			ActionContext.getContext().put("msg", "用户名密码错误！");
			return "false";
		}
	}
	
	//登录校验
	public String testLogin(){
		System.out.println(userName+"/"+passWord);
		return "";
	}
	
}
