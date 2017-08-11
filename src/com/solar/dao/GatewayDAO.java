package com.solar.dao;

import java.util.List;

import org.springframework.stereotype.Component;

import com.solar.po.Gateway;
@Component
public interface GatewayDAO {
	//新增信息
	void add(Gateway gateway); 
	//模糊查询
	List<Gateway> listAll();
	List<Gateway> list(Integer page, Integer rows);
	//批量删除
	void deleteLots(String [] idLots);
}
