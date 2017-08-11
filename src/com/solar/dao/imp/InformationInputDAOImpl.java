package com.solar.dao.imp;

import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;

import com.solar.dao.BaseDAOSupport;
import com.solar.dao.InformationInputDAO;
import com.solar.po.InformationInput;

@Component
public class InformationInputDAOImpl extends BaseDAOSupport<InformationInput> implements InformationInputDAO {

	@Override
	public void addInformation(InformationInput informationInput) {
		save(informationInput);
		
	}

	@Override
	public List<InformationInput> listAll(String title, String modular) {
		// TODO Auto-generated method stub
		String hql = "from InformationInput where DUSTBIN ='001' ";
		if(title!=null){
			hql = hql+" and TITLE like '%"+title+"%'";
			if(!"".equals(modular)){
				hql = hql+" and MODULAR like '%"+modular+"%'";
			}
		}
		hql=hql+" order by CREATION_TIME desc";
		return find(hql);
	}

	@Override
	public List<InformationInput> list(Integer page, Integer rows, String title, String modular) {
		// TODO Auto-generated method stub
		String hql = "from InformationInput where DUSTBIN ='001' ";
		if(title!=null){
			hql = hql+" and TITLE like '%"+title+"%'";
			if(!"".equals(modular)){
				hql = hql+" and MODULAR like '%"+modular+"%'";
			}
		}
		hql=hql+" order by CREATION_TIME desc";
		return find(page, rows, hql);
	}

	@Override
	public InformationInput queryInformationInput(Integer id) {
		// TODO Auto-generated method stub
		return get("from InformationInput where id=?", id);
	}
	
	@Override
	public List<InformationInput> lastOne(Integer id,String modular) {
		// TODO Auto-generated method stub
		return find("from InformationInput where id < "+id+"  and  MODULAR = '"+modular+"' and RELEASE_STATUS = '已发布' ORDER BY ID DESC ");
	}
	//SELECT * FROM information_input WHERE id = (SELECT MIN(id) FROM information_input WHERE id>452)
	@Override
	public List<InformationInput> nextArticle(Integer id,String modular) {
		// TODO Auto-generated method stub
		return find("from InformationInput where id > "+id+"  and  MODULAR = '"+modular+"' and RELEASE_STATUS = '已发布' ");
	}

	@Override
	public void updateInformation(InformationInput informationInput) {
		// TODO Auto-generated method stub
		update(informationInput);
	}

	@Override
	public void delete(Integer id) {
		delete(get("from InformationInput where id=?", id));
	}

	@Override
	public List<InformationInput> listAlll(String title, String modular) {
		// TODO Auto-generated method stub
		String hql = "from InformationInput where DUSTBIN ='002' ";
		if(title!=null){
			hql = hql+" and TITLE like '%"+title+"%'";
			if(!"".equals(modular)){
				hql = hql+" and MODULAR like '%"+modular+"%'";
			}
		}
		return find(hql);
	}

	@Override
	public List<InformationInput> list1(Integer page, Integer rows,
			String title, String modular) {
		// TODO Auto-generated method stub
		String hql = "from InformationInput where DUSTBIN ='002' ";
		if(title!=null){
			hql = hql+" and TITLE like '%"+title+"%'";
			if(!"".equals(modular)){
				hql = hql+" and MODULAR like '%"+modular+"%'";
			}
		}
		return find(page, rows, hql);
	}

	@Override
	public List<InformationInput> query(String modular,String releaseStatus,String dustbin) {
		// TODO Auto-generated method stub
		String hql = "from InformationInput where MODULAR='"+modular+"' and RELEASE_STATUS='"+releaseStatus+"' and DUSTBIN ='"+dustbin+"' order by RELEASE_TIME desc";
		return find(hql);
	}

	@Override
	public void batchRemoval(String [] idLots) {
		// TODO Auto-generated method stub
		for(int i=0;i<idLots.length;i++){
			System.out.println(Integer.parseInt(idLots[i]));
			String sql="DELETE FROM information_input WHERE id='"+Integer.parseInt(idLots[i])+"'";
			SessionFactory sf = this.getSessionFactory();
			SQLQuery query=sf.openSession().createSQLQuery(sql);
		    int result = query.executeUpdate(); 
		}
	}

	@Override
	public List<InformationInput> listPagingQuery(String modular,
			String releaseStatus, String dustbin) {
		String hql = "from InformationInput where MODULAR='"+modular+"' and RELEASE_STATUS='"+releaseStatus+"' and DUSTBIN ='"+dustbin+"' ";
		return find(hql);
	}

	@Override
	public List<InformationInput> list2(Integer page, Integer rows,
			String modular, String releaseStatus, String dustbin) {
		String hql = "from InformationInput where MODULAR='"+modular+"' and RELEASE_STATUS='"+releaseStatus+"' and DUSTBIN ='"+dustbin+"' ";
		return find(page, rows, hql);
	}

	@Override
	public List<InformationInput> query1(String releaseStatus,String dustbin) {
		// TODO Auto-generated method stub
		String hql = "from InformationInput where (MODULAR ='首页-企业动态' and RELEASE_STATUS='"+releaseStatus+"' and DUSTBIN ='"+dustbin+"') OR (MODULAR ='首页-最新资讯' and RELEASE_STATUS='"+releaseStatus+"' and DUSTBIN ='"+dustbin+"') OR (MODULAR ='首页-通知公告' and RELEASE_STATUS='"+releaseStatus+"' and DUSTBIN ='"+dustbin+"') order by RELEASE_TIME desc";
		return find(hql);
	}

	@Override
	public List<InformationInput> listPagingQuery1(String releaseStatus,
			String dustbin) {
		String hql = "from InformationInput where (MODULAR ='首页-企业动态' and RELEASE_STATUS='"+releaseStatus+"' and DUSTBIN ='"+dustbin+"') OR (MODULAR ='首页-最新资讯' and RELEASE_STATUS='"+releaseStatus+"' and DUSTBIN ='"+dustbin+"') OR (MODULAR ='首页-通知公告' and RELEASE_STATUS='"+releaseStatus+"' and DUSTBIN ='"+dustbin+"') order by RELEASE_TIME desc";
		return find(hql);
	}

	@Override
	public List<InformationInput> list3(Integer page, Integer rows,
			String releaseStatus, String dustbin) {
		String hql = "from InformationInput where (MODULAR ='首页-企业动态' and RELEASE_STATUS='"+releaseStatus+"' and DUSTBIN ='"+dustbin+"') OR (MODULAR ='首页-最新资讯' and RELEASE_STATUS='"+releaseStatus+"' and DUSTBIN ='"+dustbin+"') OR (MODULAR ='首页-通知公告' and RELEASE_STATUS='"+releaseStatus+"' and DUSTBIN ='"+dustbin+"') order by RELEASE_TIME desc";

		return find(page, rows, hql);
	}

	@Override
	public List<InformationInput> siteSearchList(String keyName) {
		String hql = "from InformationInput where (RELEASE_STATUS = '已发布' AND TITLE LIKE '%"+keyName+"%' ) OR (RELEASE_STATUS = '已发布' AND CONTENT LIKE '%"+keyName+"%' )";
		return find(hql);
	}

}
