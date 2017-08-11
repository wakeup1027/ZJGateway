package com.solar.actions;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionContext;
import com.solar.po.GisMap;
import com.solar.service.GisMapService;

public class GISmapAction {
	private GisMapService gismapService;
	private GisMap gMap;
	//批量ID
	private String [] idLots;
	
	//页
	private Integer page = 1;
	//行
	private Integer rows = 20;
	
	private Integer id;
	
	private String xpoint;
	
	private String ypoint;
	
	private String commitTitle;
	
	private String commit;
	
	private String areaName;

	public GisMap getgMap() {
		return gMap;
	}

	public void setgMap(GisMap gMap) {
		this.gMap = gMap;
	}

	public GisMapService getGismapService() {
		return gismapService;
	}
	@Autowired
	public void setGismapService(GisMapService gismapService) {
		this.gismapService = gismapService;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getXpoint() {
		return xpoint;
	}

	public void setXpoint(String xpoint) {
		this.xpoint = xpoint;
	}

	public String getYpoint() {
		return ypoint;
	}

	public void setYpoint(String ypoint) {
		this.ypoint = ypoint;
	}

	public String getCommitTitle() {
		return commitTitle;
	}

	public void setCommitTitle(String commitTitle) {
		this.commitTitle = commitTitle;
	}

	public String getCommit() {
		return commit;
	}

	public void setCommit(String commit) {
		this.commit = commit;
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

	public String[] getIdLots() {
		return idLots;
	}

	public void setIdLots(String[] idLots) {
		this.idLots = idLots;
	}

	public String getAreaName() {
		return areaName;
	}

	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}

	/**
	 * 分页查询
	 * @return list
	 */
	public String execute()
	{
		Integer totalNum = gismapService.listCount();
		Integer totalPage =  totalNum/rows+1;
		if(totalNum%5==0)
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
		List<Map<String, Object>> list = gismapService.listPage(page,rows);
		ActionContext.getContext().put("totalNum",totalNum);
		ActionContext.getContext().put("totalPage", totalPage);
		ActionContext.getContext().put("gismap",list);
		return "list";
	}
	
	public String addGIS(){
		GisMap MG = new GisMap();
		MG.setCommit(commit);
		MG.setXpoint(xpoint);
		MG.setYpoint(ypoint);
		MG.setCommitTitle(commitTitle);
		MG.setAreaName(areaName);
		gismapService.addgis(MG);
		return "tolist";
	}
	
	public String upGISinfo(){
		GisMap MG = new GisMap();
		MG.setId(id);
		MG.setCommit(commit);
		MG.setXpoint(xpoint);
		MG.setYpoint(ypoint);
		MG.setCommitTitle(commitTitle);
		MG.setAreaName(areaName);
		gismapService.upgis(MG);
		return "tolist";
	}
	
	public String batchRemoval(){
		gismapService.delGisMap(idLots);
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
	
	public void getMapPoint(){
		List<GisMap> MapDate = gismapService.getMapPoint();
		//在此处响应出数据
		HttpServletResponse response = ServletActionContext.getResponse();  
		response.setCharacterEncoding("UTF-8");
		PrintWriter writer=null;
		try {
				writer = response.getWriter();
		} catch (IOException e) {
				e.printStackTrace();
		}  
		writer.print("{\"GisMap\":"+MapDate+"}");
		writer.flush();
	}
	
	public void findAreaPoint(){
		if("全部".equals(areaName)){
			getMapPoint();
		}else{
			List<GisMap> MapDate = gismapService.findArea(areaName);
			//在此处响应出数据
			HttpServletResponse response = ServletActionContext.getResponse();  
			response.setCharacterEncoding("UTF-8");
			PrintWriter writer=null;
			try {
					writer = response.getWriter();
			} catch (IOException e) {
					e.printStackTrace();
			}  
			writer.print("{\"GisMap\":"+MapDate+"}");
			writer.flush();
		}
		
	}
	
	

}
