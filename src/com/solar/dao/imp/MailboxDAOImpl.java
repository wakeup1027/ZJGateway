package com.solar.dao.imp;

import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;

import com.solar.dao.BaseDAOSupport;
import com.solar.dao.MailboxDAO;
import com.solar.po.Mailbox;

@Component
public class MailboxDAOImpl  extends BaseDAOSupport<Mailbox> implements MailboxDAO {

	@Override
	public void addMailbox(Mailbox mailbox) {
		saveOrUpdate(mailbox);
	}

	@Override
	public List<Mailbox> listAll(String name) {
		String hql = "from Mailbox where 1=1";
		if(name!=null){
			hql = hql+ " and NAME like '%"+name+"%'";
		}
		return find(hql);
	}

	@Override
	public List<Mailbox> list(Integer page, Integer rows, String name) {
		String hql = "from Mailbox where 1=1";
		
		if(name!=null){
			hql = hql+ " and NAME like '%"+name+"%'";
		}
		return find(page, rows, hql);
	}

	@Override
	public void batchRemoval(String[] idLots) {
		for(int i=0;i<idLots.length;i++){
			System.out.println(Integer.parseInt(idLots[i]));
			String sql="DELETE FROM Mailbox WHERE id='"+Integer.parseInt(idLots[i])+"'";
			SessionFactory sf = this.getSessionFactory();
			SQLQuery query=sf.openSession().createSQLQuery(sql);
		    int result = query.executeUpdate(); 
		}
	}

	@Override
	public Mailbox queryAll(Integer id) {
		// TODO Auto-generated method stub
		return get("from Mailbox where id = ?", id);
	}
}
