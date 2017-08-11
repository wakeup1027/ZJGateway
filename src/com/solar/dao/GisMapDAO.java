package com.solar.dao;

import java.util.List;

import org.springframework.stereotype.Component;

import com.solar.po.GisMap;

@Component
public interface GisMapDAO {
	
	void addGis(GisMap gmap);
	
	void upGis(GisMap gmap);
	
	List<GisMap> listCount();
	
	List<GisMap> listPage(Integer page, Integer rows);
	
	void delGisMap(String[] idstr);
	
	List<GisMap> MapPoint();
	
	List<GisMap> findArea(String areaName);
	
}
