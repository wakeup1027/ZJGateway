package com.solar.dao;

import java.util.List;

import com.solar.po.Picture;

public interface PictureDAO {
	/*上传图片*/
	void savePicture(Picture picture);
	/*总数*/
	List<Picture> listAll();
	/*列出*/
	List<Picture> list(Integer page,Integer rows);
	/*删除*/
	void deletePicture(Integer id);
	/*批量修改状态"是"*/
	void batchUpdate(Integer idLots);
	/*批量修改状态"否"*/
	void batchUpdateTwo(Integer idLots);
}
