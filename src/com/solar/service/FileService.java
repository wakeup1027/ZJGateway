package com.solar.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.solar.dao.FileDAO;
import com.solar.po.Files;

@Service
public class FileService {

	private FileDAO filedao;

	/*新建*/
	public void saveFile(Files files)
	{
		filedao.saveFile(files);
	}
	
	//修改
	public void update(Files files){
		filedao.update(files);
	}
	
	/*批量修改状态"是"*/
	public void batchUpdate(Integer idLots)
	{
		filedao.batchUpdate(idLots);
	}
	
	/*批量修改状态"否"*/
	public void batchUpdateTwo(Integer idLots)
	{
		filedao.batchUpdateTwo(idLots);
	}
	
	/*删除*/
	public void deleteFile(Integer id)
	{
		filedao.deleteFile(id);
	}
	
	public String findFileURL(Integer id)
	{
		return filedao.findFileURL(id).getRsUrl();
	}
	
	public Integer listAll(String name,String userName,String userType)
	{
		if(name!=null)
		{
			name=name.replaceAll("'", "''");
		}
		return filedao.listAll(name,userName,userType).size();
	}
	
	public List<Map<String, Object>> list(Integer page,Integer rows,String name,String userName,String userType,String realName)
	{
		if(name!=null)
		{
			name=name.replaceAll("'", "''");
		}
		List<Map<String, Object>> result = new ArrayList<Map<String,Object>>();
		List<Files> list = filedao.list(page,rows,name,userName,userType);
		for(Files file : list)
		{
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("id", file.getId());
			map.put("fileName",file.getFileName());
			map.put("fileSize", file.getFileSize()+"KB");
			map.put("downTime", file.getDownTime());
			map.put("createTime", file.getCreateTime());
			map.put("releaseTime", file.getReleaseTime());
			map.put("releasePerson", file.getReleasePerson());
			map.put("url",file.getRsUrl());
			map.put("user", file.getRealName());
			map.put("sharedState", file.getSharedState());
			map.put("isRole", realName.equals(file.getRealName())?"true":"false");
			result.add(map);
		}
		return result;
	}
	
	public String findNameById(Integer id)
	{
		return filedao.findNameById(id).getFileName();
	}
	
	public Files findNameById1(Integer id){
		return filedao.findNameById(id);
	}
	
	//查询显示
	public List<Map<String, Object>> queryFile(){
		List<Map<String, Object>> result = new ArrayList<Map<String,Object>>();
		List<Files> list = filedao.queryFile();
		for(Files files : list){
			Map<String , Object> map = new HashMap<String, Object>();
			map.put("id", files.getId());
			map.put("fileName", files.getFileName());
			map.put("releasePerson", files.getReleasePerson());
			map.put("releaseTime", files.getReleaseTime());
			result.add(map);
		}
		return result;
	}
	
	//统计总数
	public Integer listAll1() {
		// TODO Auto-generated method stub
		return filedao.listAll1().size();
	}
	//模糊查询
	public List<Map<String, Object>> list1(Integer page,Integer rows){
		List<Map<String, Object>> result = new ArrayList<Map<String,Object>>();
		List<Files> list = filedao.list1(page, rows);
		for(Files files : list){
			Map<String , Object> map = new HashMap<String, Object>();
			map.put("id", files.getId());
			map.put("fileName", files.getFileName());
			map.put("releasePerson", files.getReleasePerson());
			map.put("releaseTime", files.getReleaseTime());
			result.add(map);
		}
		return result;
	}
	
	public FileDAO getFiledao() {
		return filedao;
	}
	@Autowired
	public void setFiledao(FileDAO filedao) {
		this.filedao = filedao;
	}

}
