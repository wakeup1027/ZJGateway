package com.solar.dao;

import java.util.List;

import com.solar.po.Files;

public interface FileDAO {

	/*上传文件*/
	void saveFile(Files files);
	/*总数*/
	List<Files> listAll(String name,String userName,String userType);
	/*列出*/
	List<Files> list(Integer page,Integer rows,String name,String userName,String userType);
	/*根据id查询文件名*/
	Files findNameById(Integer id);
	//修改
	void update(Files files);
	/*删除*/
	void deleteFile(Integer id);
	/*查询路径*/
	Files findFileURL(Integer id);
	/*批量修改状态"是"*/
	void batchUpdate(Integer idLots);
	/*批量修改状态"否"*/
	void batchUpdateTwo(Integer idLots);
	/*总数*/
	List<Files> listAll1();
	//模糊查询
	List<Files> list1(Integer page,Integer rows);
	//查询
	List<Files> queryFile();
	
}
