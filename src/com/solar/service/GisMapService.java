package com.solar.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.solar.dao.GisMapDAO;
import com.solar.po.GisMap;

@Service
public class GisMapService {
	private GisMapDAO gismapdao;
	

	public GisMapDAO getGismapdao() {
		return gismapdao;
	}

	@Autowired
	public void setGismapdao(GisMapDAO gismapdao) {
		this.gismapdao = gismapdao;
	}

	public List<Map<String, Object>> listPage(Integer page, Integer rows){
		List<Map<String, Object>> result = new ArrayList<Map<String,Object>>();
		List<GisMap> gmlist = gismapdao.listPage(page, rows);
		for(GisMap chGs : gmlist){
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("id", chGs.getId());
			map.put("commitTitle", chGs.getCommitTitle());
			map.put("commit", chGs.getCommit());
			map.put("xpoint", chGs.getXpoint());
			map.put("ypoint", chGs.getYpoint());
			map.put("areaName", chGs.getAreaName());
			result.add(map);
		}
		return result;
	}
	
	public Integer listCount(){
		return gismapdao.listCount().size();
	}

	public void addgis(GisMap gm){
		gismapdao.addGis(gm);
	}

	public void upgis(GisMap gm){
		try {
			gismapdao.upGis(gm);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
	}
	
	public void delGisMap(String[] idstr){
		gismapdao.delGisMap(idstr);
	}
	
	public List<GisMap> getMapPoint(){
		return gismapdao.MapPoint();
	}
	
	public List<GisMap> findArea(String areaName){
		return gismapdao.findArea(areaName);
	}
	
}
