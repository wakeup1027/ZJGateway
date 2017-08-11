package com.solar.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.solar.dao.GatewayDAO;
import com.solar.po.Gateway;

@Service
public class GatewayServier {
	private GatewayDAO gatewayDAO;

	public GatewayDAO getGatewayDAO() {
		return gatewayDAO;
	}
	@Autowired
	public void setGatewayDAO(GatewayDAO gatewayDAO) {
		this.gatewayDAO = gatewayDAO;
	}
	
	//新增信息
	public void add(Gateway gateway){
		gatewayDAO.add(gateway);
	}
	
	//模糊查询
	public Integer listAll(){
		return gatewayDAO.listAll().size();
	}
	public List<Map<String , Object>> list(Integer page, Integer rows){
		List<Map<String, Object>> result = new ArrayList<Map<String,Object>>();
		List<Gateway> list = gatewayDAO.list(page, rows);
		for(Gateway gateway : list){
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("id", gateway.getId());
			map.put("contactPhone", gateway.getContactPhone());
			map.put("contacts", gateway.getContacts());
			map.put("entryName", gateway.getEntryName());
			map.put("industryType", gateway.getIndustryType());
			map.put("mailbox", gateway.getMailbox());
			map.put("mobilePhone", gateway.getMobilePhone());
			map.put("createTime", gateway.getCreateTime());
			result.add(map);
		}
		return result;
		
	}
	
	public void deleteLots(String [] idLots) {
		gatewayDAO.deleteLots(idLots);
	}
}
