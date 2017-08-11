package com.solar.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.solar.dao.FileDAO;
import com.solar.dao.PictureDAO;
import com.solar.po.Files;
import com.solar.po.Picture;

@Service
public class PictureService {

	private PictureDAO pictureDAO;
	
	public PictureDAO getPictureDAO() {
		return pictureDAO;
	}
	
	@Autowired
	public void setPictureDAO(PictureDAO pictureDAO) {
		this.pictureDAO = pictureDAO;
	}
	/*新建*/
	public void savePicture(Picture picture)
	{
		pictureDAO.savePicture(picture);
	}
	
	
	/*批量修改状态"是"*/
	public void batchUpdate(Integer idLots)
	{
		pictureDAO.batchUpdate(idLots);
	}
	
	/*批量修改状态"否"*/
	public void batchUpdateTwo(Integer idLots)
	{
		pictureDAO.batchUpdateTwo(idLots);
	}
	
	/*删除*/
	public void deletePicture(Integer id)
	{
		pictureDAO.deletePicture(id);
	}
	
	
	public Integer listAll()
	{
		Integer integer=pictureDAO.listAll().size();
		return integer;
	}
	
	public List<Map<String, Object>> list(Integer page,Integer rows)
	{
		List<Map<String, Object>> result = new ArrayList<Map<String,Object>>();
		List<Picture> list = pictureDAO.list(page,rows);
		for(Picture picture : list)
		{
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("id", picture.getId());
			map.put("pictureName",picture.getPictureName());
			map.put("picturePath", picture.getPicturePath());
			map.put("createTime", picture.getCreateTime());
			map.put("state", picture.getState());
			result.add(map);
		}
		return result;
	}
	
	
	public List<Map<String, Object>> listData()
	{
		List<Map<String, Object>> result = new ArrayList<Map<String,Object>>();
		List<Picture> list = pictureDAO.listAll();
		for(Picture picture : list)
		{
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("id", picture.getId());
			map.put("pictureName",picture.getPictureName());
			map.put("picturePath", picture.getPicturePath());
			map.put("createTime", picture.getCreateTime());
			map.put("state", picture.getState());
			result.add(map);
		}
		return result;
	}
	
}
