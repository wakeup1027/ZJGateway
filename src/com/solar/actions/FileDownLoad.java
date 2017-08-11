package com.solar.actions;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import com.solar.service.FileService;

@SuppressWarnings("serial")
public class FileDownLoad extends ActionSupport{

	private Integer id;
	private String fileName;
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	private FileService fileService;
	public FileService getFileService() {
		return fileService;
	}
	@Autowired
	public void setFileService(FileService fileService) {
		this.fileService = fileService;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	public InputStream getInputStream() throws UnsupportedEncodingException
	{
		
		fileName = fileService.findNameById(id);
		return  ServletActionContext.getServletContext().getResourceAsStream("upload/"+fileName); 
	}
	
	
	public String checkFile(){
		fileName = fileService.findNameById(id);
		String fileSavePath = ServletActionContext.getServletContext().getRealPath("/upload");
		File f = new File(fileSavePath+"\\"+fileName);
		
		HttpServletResponse response = ServletActionContext.getResponse();  
        PrintWriter writer=null;
		try {
			writer = response.getWriter();
		} catch (IOException e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		if (f.exists()){
			writer.print("true");  
			
		}else{
			writer.print("false");  
		}
        writer.flush(); 
        return null;
	}
	
	
	public  String execute()
	{
		return "success";
	}
	 public String getDownFileName() 
	 {   
		 String downFileName = fileName;   
	     try {   
	           downFileName = new String(downFileName.getBytes(), "ISO-8859-1");   
	        } catch (UnsupportedEncodingException e) {   
	            e.printStackTrace();   
	        }   
	        return downFileName;   
	    }   
}
