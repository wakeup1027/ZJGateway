package com.solar.actions;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import com.opensymphony.xwork2.ActionContext;
import com.solar.exception.CodeException;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.json.JSONUtil;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;



@SuppressWarnings("serial")
@Controller
@Scope("prototype")
@ParentPackage("my-default")
public abstract class ActionSupport extends com.opensymphony.xwork2.ActionSupport {
	
	public static final String JSON = "json";
	public static final String MSG = "msg";
	

	public String execute(){
		
		return JSON;
	}
	
	public String messageView(String msg){
		ActionContext.getContext().put("msg", msg);
		return MSG;
	}

	/**
	 * 格式化JSON list
	 * @param list
	 * @return null
	 * @throws IOException
	 * @throws Exception 
	 */
	public String json(List<?> list){
		try{
			ServletActionContext.getResponse().getWriter().print(JSONUtil.serialize(list));
			return null;
		}catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	
	/**
	 * 输出json格式的错误消息<br/>
	 * 格式：{"code":1,"error":"错误消息"}
	 * @param exception
	 * @return
	 */
	public String json(Exception exception){
		Map<String,Object> json = new HashMap<String, Object>();
		if(exception instanceof CodeException){
			loadMessage((CodeException)exception);
			json.put("code", ((CodeException)exception).getCode());
		}
		json.put("error", exception.getMessage()==null?exception.getClass().getName():exception.getMessage());
		return json(json);
	}
	
	/**
	 * 格式化输出JSON Object
	 * @param map
	 * @return null
	 * @throws Exception
	 */
	public String json(Object map){
		try{
			ServletActionContext.getResponse().getWriter().print(JSONUtil.serialize(map));
			return null;
		}catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	
	public String json(){
		try{
			ServletActionContext.getResponse().getWriter().print("{}");
			return null;
		}catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	

	/**
	 * 禁止浏览器缓存
	 */
	public void setExpires(){
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setHeader("Pragma", "No-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires",Integer.MIN_VALUE);
	}
	
	public String sendError(int errorCode){
		try {
			ServletActionContext.getResponse().sendError(errorCode);
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage(),e);
		}
		return null;
	}
	
	

	/**
	 * 获取错误消息的内容
	 * @param codeException
	 * @return
	 */
	public String findMessage(CodeException codeException){
		loadMessage(codeException);
		return codeException.getMessage();
	}
	
	/**
	 * 装载错误消息的内容
	 * @param codeException
	 */
	public void loadMessage(CodeException codeException){
		codeException.setMessage(this.getText("code."+codeException.getCode()));
	}
	
}
