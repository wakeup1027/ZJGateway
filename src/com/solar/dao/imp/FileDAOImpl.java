package com.solar.dao.imp;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.solar.dao.BaseDAOSupport;
import com.solar.dao.FileDAO;
import com.solar.po.Files;


@Component
public class FileDAOImpl extends BaseDAOSupport<Files> implements FileDAO{
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void saveFile(Files files) {
		
		save(files);
	}
	
	@Override
	public void update(Files files) {
		
		saveOrUpdate(files);
	}

	@Override
	public List<Files> listAll(String name,String userName,String userType) {
		
		String hql = "from Files where 1=1 ";
		if(name!=null)
		{
			hql = hql+"and fileName like '%"+name+"%'";
		}
		return find(hql);
	}

	@Override
	public List<Files> list(Integer page,Integer rows,String name,String userName,String userType) {
		
		String hql = "from Files where 1=1 ";
		if(name!=null)
		{
			hql = hql+"and fileName like '%"+name+"%'";
		}
		return find(page,rows,hql);
	}

	@Override
	public Files findNameById(Integer id) {
		
		return get("from Files where id  = ?",id);
	}

	@Override
	public void deleteFile(Integer id) {
		
		Files file = get("from Files where id = ?",id);
		delete(file);
	}

	@Override
	public Files findFileURL(Integer id) {
		
		return get("from Files where id = ?",id);
	}
	

	/**
	 * 批量修改状态"是"
	 */
	@Override
	public void batchUpdate(Integer idLots) {
		System.out.println("测试："+idLots);
		Session session = sessionFactory.openSession();
		SQLQuery sQLQuery=session.createSQLQuery("UPDATE files SET SHARED_STATE='是' WHERE id="+idLots+" ");
		sQLQuery.executeUpdate();
		
	}
	/**
	 * 批量修改状态"否"
	 */
	@Override
	public void batchUpdateTwo(Integer idLots) {
		Session session = sessionFactory.openSession();
		SQLQuery sQLQuery=session.createSQLQuery("UPDATE files SET SHARED_STATE='否' WHERE id="+idLots);
		sQLQuery.executeUpdate();
	}

	@Override
	public List<Files> queryFile() {
		// TODO Auto-generated method stub
		return find("from Files where SHARED_STATE='是'");
	}

	@Override
	public List<Files> listAll1() {
		// TODO Auto-generated method stub
		return find("from Files where SHARED_STATE='是'");
	}

	@Override
	public List<Files> list1(Integer page, Integer rows) {
		// TODO Auto-generated method stub
		return find(page,rows,"from Files where SHARED_STATE='是'");
	}
	

}