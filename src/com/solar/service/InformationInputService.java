package com.solar.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.solar.dao.InformationInputDAO;
import com.solar.po.InformationInput;
@Service
public class InformationInputService {
	private InformationInputDAO informationInputDAO;
	
	
	public InformationInputDAO getInformationInputDAO() {
		return informationInputDAO;
	}

	@Autowired
	public void setInformationInputDAO(InformationInputDAO informationInputDAO) {
		this.informationInputDAO = informationInputDAO;
	}

	//新增方法
	public void addInformation(InformationInput informationInput) {
		informationInputDAO.addInformation(informationInput);
	}
	
	//统计总数
	public Integer listAll(String title, String modular){
		return informationInputDAO.listAll(title, modular).size();
	}
	
	//模糊查询
	public List<Map<String, Object>> list(Integer page, Integer rows, String title, String modular){
		List<Map<String, Object>> result = new ArrayList<Map<String,Object>>();
		List<InformationInput> list = informationInputDAO.list(page, rows, title, modular);
		for(InformationInput informationInput : list){
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("id", informationInput.getId());
			map.put("title", informationInput.getTitle());
			map.put("content", informationInput.getContent());
			map.put("modular", informationInput.getModular());
			map.put("publisher", informationInput.getPublisher());
			map.put("releaseStatus", informationInput.getReleaseStatus());
			map.put("releaseTime", informationInput.getReleaseTime());
			result.add(map);
		}
		return result;
	}
	
	//垃圾箱统计总数
	public Integer listAlll(String title, String modular){
		return informationInputDAO.listAlll(title, modular).size();
	}
		
	//垃圾箱模糊查询
	public List<Map<String, Object>> list1(Integer page, Integer rows, String title, String modular){
		List<Map<String, Object>> result = new ArrayList<Map<String,Object>>();
		List<InformationInput> list = informationInputDAO.list1(page, rows, title, modular);
		for(InformationInput informationInput : list){
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("id", informationInput.getId());
			map.put("title", informationInput.getTitle());
			map.put("content", informationInput.getContent());
			map.put("modular", informationInput.getModular());
			map.put("publisher", informationInput.getPublisher());
			map.put("releaseStatus", informationInput.getReleaseStatus());
			map.put("releaseTime", informationInput.getReleaseTime());
			result.add(map);
		}
		return result;
	}
	
	//门户的分页查询
	public Integer listPagingQuery(String modular,
			String releaseStatus, String dustbin){
		return informationInputDAO.listPagingQuery(modular, releaseStatus, dustbin).size();
	}
	public List<Map<String, Object>> list2(Integer page, Integer rows,
			String modular, String releaseStatus, String dustbin){
		List<Map<String, Object>> result = new ArrayList<Map<String,Object>>();
		List<InformationInput> list = informationInputDAO.list2(page, rows, modular, releaseStatus, dustbin);
		for(InformationInput informationInput : list){
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("id", informationInput.getId());
			map.put("title", informationInput.getTitle());
			map.put("content", informationInput.getContent());
			map.put("modular", informationInput.getModular());
			map.put("publisher", informationInput.getPublisher());
			map.put("releaseStatus", informationInput.getReleaseStatus());
			map.put("releaseTime", informationInput.getReleaseTime());
			map.put("fieldSummary", informationInput.getFieldSummary());
			map.put("picture", informationInput.getPicture());
			map.put("clickRate", informationInput.getClickRate());
			result.add(map);
		}
		return result;
	}
	//查询
	public InformationInput queryInformationInput(Integer id) {
		// TODO Auto-generated method stub
		return informationInputDAO.queryInformationInput(id);
	}
	
	//上一条
	public List<InformationInput> lastOne(Integer id,String modular) {
		// TODO Auto-generated method stub
		return informationInputDAO.lastOne(id,modular);
	}
	
	//下一条
	public List<InformationInput> nextArticle(Integer id,String modular) {
		// TODO Auto-generated method stub
		return informationInputDAO.nextArticle(id,modular);
	}
	
	//修改
	public void  updateInformation(InformationInput informationInput){
		informationInputDAO.updateInformation(informationInput);
	}
	
	//删除
	public void delete(Integer id) {
		informationInputDAO.delete(id);
	}
	
	//普通查询
	public List<Map<String, Object>> query(String modular,String releaseStatus,String dustbin) {
		// TODO Auto-generated method stub
		List<Map<String, Object>> result = new ArrayList<Map<String,Object>>();
		List<InformationInput> list = informationInputDAO.query(modular, releaseStatus, dustbin);
		for(InformationInput informationInput : list){
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("id", informationInput.getId());
			map.put("title", informationInput.getTitle());
			map.put("releaseTime", informationInput.getReleaseTime());
			map.put("picture", informationInput.getPicture());
			map.put("modular", informationInput.getModular());
			map.put("content", informationInput.getContent());
			map.put("content1", informationInput.getContent().substring(informationInput.getContent().indexOf("<p")+3, informationInput.getContent().indexOf("</p")+3));
			map.put("fieldSummary", informationInput.getFieldSummary());
			result.add(map);
		}
		return result;
	}
	
	//垃圾箱批量删除
	public void batchRemoval(String [] idLots) {
		informationInputDAO.batchRemoval(idLots);
	}
	
	
	//首页-通知公告
	public List<Map<String, Object>> query1(String releaseStatus,String dustbin){
		// TODO Auto-generated method stub
		List<Map<String, Object>> result = new ArrayList<Map<String,Object>>();
		List<InformationInput> list = informationInputDAO.query1(releaseStatus,dustbin);
		for(InformationInput informationInput : list){
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("id", informationInput.getId());
			map.put("title", informationInput.getTitle());
			map.put("releaseTime", informationInput.getReleaseTime());
			map.put("picture", informationInput.getPicture());
			map.put("modular", informationInput.getModular());
			map.put("content", informationInput.getContent());
			map.put("content1", informationInput.getContent().substring(informationInput.getContent().indexOf("<p")+3, informationInput.getContent().indexOf("</p")+3));
			map.put("fieldSummary", informationInput.getFieldSummary());
			result.add(map);
		}
		return result;
	}
	
	
	//门户信息公开-通知公告分页查询
	public Integer listPagingQuery1(String releaseStatus, String dustbin){
		return informationInputDAO.listPagingQuery1(releaseStatus, dustbin).size();
	}
	public List<Map<String, Object>> list3(Integer page, Integer rows,String releaseStatus, String dustbin){
		List<Map<String, Object>> result = new ArrayList<Map<String,Object>>();
		List<InformationInput> list = informationInputDAO.list3(page, rows,  releaseStatus, dustbin);
		for(InformationInput informationInput : list){
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("id", informationInput.getId());
			map.put("title", informationInput.getTitle());
			map.put("content", informationInput.getContent());
			map.put("modular", informationInput.getModular());
			map.put("publisher", informationInput.getPublisher());
			map.put("releaseStatus", informationInput.getReleaseStatus());
			map.put("releaseTime", informationInput.getReleaseTime());
			result.add(map);
		}
		return result;
	}
	
	
	
	public List<Map<String, Object>> siteSearchList(String keyName){
		List<Map<String, Object>> result = new ArrayList<Map<String,Object>>();
		List<InformationInput> list = informationInputDAO.siteSearchList(keyName);
		for(InformationInput informationInput : list){
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("id", informationInput.getId());
			map.put("title", informationInput.getTitle());
			map.put("content", informationInput.getContent());
			map.put("modular", informationInput.getModular());
			map.put("publisher", informationInput.getPublisher());
			map.put("releaseStatus", informationInput.getReleaseStatus());
			map.put("releaseTime", informationInput.getReleaseTime());
			map.put("fieldSummary", informationInput.getFieldSummary());
			result.add(map);
		}
		return result;
	}
}
