package com.solar.actions;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.solar.po.Picture;
import com.solar.service.PictureService;

public class PictureAction{

	private Picture picture;
	private String pictureName;
	private String picturePath;
	private String state;
	private PictureService pictureService;
	private Integer page = 1;
	private Integer rows = 20;
	private String  id;
	private String idLots;
	//分页查询
	public String execute()
	{
		Integer totalNum = pictureService.listAll();
		Integer totalPage =  totalNum/rows+1;
		if(totalNum%rows==0)
		{
			totalPage =totalPage-1; 
		}
		if(page<1)
		{
			page=1;
		}
		else if(page>totalPage)
		{
			page=totalPage;
		}
		List<Map<String, Object>> list = pictureService.list(page,rows);
		ActionContext.getContext().put("totalNum",totalNum);
		ActionContext.getContext().put("totalPage", totalPage);
		ActionContext.getContext().put("picture",list);
		return "list";
	}
	
	//删除文件
	public String delete()
	{
		pictureService.deletePicture(Integer.parseInt(id));
		return "tolist";
	}
	
	//图片上传
	public String uploadFile()
	{
		//在此处响应出数据
		HttpServletResponse response = ServletActionContext.getResponse();  
		response.setCharacterEncoding("UTF-8");
        PrintWriter writer=null;
		try {
			String [] sry = picturePath.split(",");
			for(int i = 0;i<sry.length;i++){
				Picture pictureData = new Picture();
				pictureData.setPicturePath(sry[i].toString());
				pictureData.setCreateTime(new Timestamp(System.currentTimeMillis()));
				pictureService.savePicture(pictureData);
			}
			writer = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}  
        writer.print("success");
        writer.flush();
		return null;
	}
		
	/*批量修改状态"是"*/
	public String batchUpdate(){
		String pictureid[]=idLots.split(",");
		String id="";
		for (String string : pictureid) {
			id=string.replace(" ", "");
			pictureService.batchUpdate(Integer.parseInt(id));
		}
		 //在此处响应出数据
		HttpServletResponse response = ServletActionContext.getResponse();  
		response.setCharacterEncoding("UTF-8");
        PrintWriter writer=null;
		try {
			writer = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}  
        writer.print("success");
        writer.flush();
		return null;
		
	}
	/*批量修改状态"否"*/
	public String batchUpdateTwo(){
		String fileid[]=idLots.split(",");
		String id="";
		for (String string : fileid) {
			id=string.replace(" ", "");
			pictureService.batchUpdateTwo(Integer.parseInt(id));
		}
		 //在此处响应出数据
		HttpServletResponse response = ServletActionContext.getResponse();  
		response.setCharacterEncoding("UTF-8");
        PrintWriter writer=null;
		try {
			writer = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}  
        writer.print("success");
        writer.flush();
		return null;
		
	}
	
	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getRows() {
		return rows;
	}

	public void setRows(Integer rows) {
		this.rows = rows;
	}

	public String getIdLots() {
		return idLots;
	}

	public void setIdLots(String idLots) {
		this.idLots = idLots;
	}

	public Picture getPicture() {
		return picture;
	}

	public void setPicture(Picture picture) {
		this.picture = picture;
	}

	public String getPictureName() {
		return pictureName;
	}

	public void setPictureName(String pictureName) {
		this.pictureName = pictureName;
	}

	public String getPicturePath() {
		return picturePath;
	}

	public void setPicturePath(String picturePath) {
		this.picturePath = picturePath;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public PictureService getPictureService() {
		return pictureService;
	}

	public void setPictureService(PictureService pictureService) {
		this.pictureService = pictureService;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	
	
}
