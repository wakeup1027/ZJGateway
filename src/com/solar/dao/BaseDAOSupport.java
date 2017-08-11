package com.solar.dao;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.CriteriaSpecification;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@SuppressWarnings("unchecked")
@Component
public class BaseDAOSupport<T> implements BaseDAO<T> {


	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	protected Session getCurrentSession() {
		return this.sessionFactory.getCurrentSession();
	}

	@Override
	public Serializable save(T o) {
		return this.getCurrentSession().save(o);
	}

	
	@Override
	public T get(Class<T> c, Serializable id) {
		return (T) this.getCurrentSession().get(c, id);
	}

	@Override
	public List findQuerySQL(String sql){
		Query query = this.getCurrentSession().createSQLQuery(sql);
		//在此处设置参数
		//query.setString(0,username);
		query.setResultTransformer(CriteriaSpecification.ALIAS_TO_ENTITY_MAP);
		//执行查询
		return query.list();
	}
	
	
	@Override
	public T get(String hql,Object...params) {
		Query q = this.getCurrentSession().createQuery(hql);
		setParams(q, params);
		List<T> l = q.list();
		if (l != null && l.size()==1) {
			return l.get(0);
		}
		return null;//throw new RuntimeException("获取的对象不只有一个："+l.size());
	}

	@Override
	public T get(String hql, Map<String, Object> params) {
		Query q = this.getCurrentSession().createQuery(hql);
		setParams(q, params);
		List<T> l = q.list();
		if (l != null && l.size() ==1) {
			return l.get(0);
		}
		throw new RuntimeException("获取的对象不只有一个："+l.size());
	}

	@Override
	public void delete(T o) {
		this.getCurrentSession().delete(o);
	}

	@Override
	public void update(T o) {
		this.getCurrentSession().update(o);
	}

	@Override
	public void saveOrUpdate(T o) {
		this.getCurrentSession().saveOrUpdate(o);
	}

	@Override
	public List<T> find(String hql,Object...params) {
		Query q = this.getCurrentSession().createQuery(hql);
		setParams(q, params);
		return q.list();
	}
	

	@Override
	public List<T> find(String hql, Map<String, Object> params) {
		Query q = this.getCurrentSession().createQuery(hql);
		setParams(q, params);
		return q.list();
	}

	@Override
	public List<T> find(String hql, Map<String, Object> params, int page, int rows) {
		Query q = this.getCurrentSession().createQuery(hql);
		setParams(q, params);
		return q.setFirstResult((page - 1) * rows).setMaxResults(rows).list();
	}

	@Override
	public List<T> find(int page, int rows,String hql,Object...params) {
		Query q = this.getCurrentSession().createQuery(hql);
		setParams(q, params);
		return q.setFirstResult((page - 1) * rows).setMaxResults(rows).list();
	}

	@Override
	public Long count(String hql,Object...params) {
		Query q = this.getCurrentSession().createQuery(hql);
		setParams(q, params);
		return (Long) q.uniqueResult();
	}

	@Override
	public Long count(String hql, Map<String, Object> params) {
		Query q = this.getCurrentSession().createQuery(hql);
		setParams(q, params);
		return (Long) q.uniqueResult();
	}

	@Override
	public int executeHql(String hql,Object...params) {
		Query q = this.getCurrentSession().createQuery(hql);
		setParams(q, params);
		return q.executeUpdate();
	}

	@Override
	public int executeHql(String hql, Map<String, Object> params) {
		Query q = this.getCurrentSession().createQuery(hql);
		setParams(q, params);
		return q.executeUpdate();
	}
	private void setParams(Query q,Map<String, Object> params){
		if (params != null && !params.isEmpty()) {
			for (String key : params.keySet()) {
				q.setParameter(key, params.get(key));
			}
		}
	}


	
	private void setParams(Query q,Object...params){
		if(params!=null&&params.length>0){
			for(int i=0;i<params.length;i++){
				q.setParameter(i, params[i]);
			}
		}
	}

	@Override
	public T isexist(String hql,Object...params) {
		// TODO Auto-generated method stub
		Query q = this.getCurrentSession().createQuery(hql);
		setParams(q, params);
		List<T> l = q.list();
		if (l != null && l.size()==1)
		{
			return l.get(0);
		}
		return null;
	}

}
