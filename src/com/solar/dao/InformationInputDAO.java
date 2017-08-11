package com.solar.dao;

import java.util.List;

import com.solar.po.InformationInput;

public interface InformationInputDAO {
	//新增方法
	void addInformation(InformationInput informationInput);
	//模糊查询
	List<InformationInput> listAll(String title, String modular);
	List<InformationInput> list(Integer page, Integer rows, String title, String modular);
	//修改
	InformationInput queryInformationInput(Integer id);
	void updateInformation(InformationInput informationInput);
	//上一条数据
	List<InformationInput> lastOne(Integer id,String title);
	//下一条数据
	List<InformationInput> nextArticle(Integer id,String title);
	//删除
	void delete(Integer id);
	//垃圾箱批量删除
	void batchRemoval(String [] idLots);
	//垃圾箱模糊查询
	List<InformationInput> listAlll(String title, String modular);
	List<InformationInput> list1(Integer page, Integer rows, String title, String modular);
	
	//普通查询
	List<InformationInput> query(String modular,String releaseStatus,String dustbin);
	
	//门户分页查询
	List<InformationInput> listPagingQuery(String modular,String releaseStatus,String dustbin);
	List<InformationInput> list2(Integer page, Integer rows, String modular,String releaseStatus,String dustbin);
	
	//查询首页-企业动态，首页-通知公告，首页-通知公告
	List<InformationInput> query1(String releaseStatus,String dustbin);
	
	//门户信息公开-通知公告分页查询
	List<InformationInput> listPagingQuery1(String releaseStatus,String dustbin);
	List<InformationInput> list3(Integer page, Integer rows, String releaseStatus,String dustbin);
	
	//站内检索
	List<InformationInput> siteSearchList(String keyName);
}
