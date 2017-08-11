package com.solar.dao.imp;

import java.util.List;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.solar.dao.BaseDAOSupport;
import com.solar.dao.PictureDAO;
import com.solar.po.Picture;


@Component
public class PictureDAOImpl extends BaseDAOSupport<Picture> implements PictureDAO{
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void savePicture(Picture picture) {
		save(picture);
	}
	

	@Override
	public List<Picture> listAll() {
		
		String hql = "from Picture where 1=1 ";
		return find(hql);
	}

	@Override
	public List<Picture> list(Integer page,Integer rows) {
		
		String hql = "from Picture where 1=1 ";
		return find(page,rows,hql);
	}

	@Override
	public void deletePicture(Integer id) {
		
		Picture picture = get("from Picture where id = ?",id);
		delete(picture);
	}


	/**
	 * 批量修改状态"是"
	 */
	@Override
	public void batchUpdate(Integer idLots) {
		Session session = sessionFactory.openSession();
		SQLQuery sQLQuery=session.createSQLQuery("UPDATE picture SET STATE='是' WHERE id="+idLots+" ");
		sQLQuery.executeUpdate();
		
	}
	/**
	 * 批量修改状态"否"
	 */
	@Override
	public void batchUpdateTwo(Integer idLots) {
		Session session = sessionFactory.openSession();
		SQLQuery sQLQuery=session.createSQLQuery("UPDATE picture SET STATE='否' WHERE id="+idLots);
		sQLQuery.executeUpdate();
	}

}