package com.solar.dao;

import java.io.Serializable;
import java.util.List;
import java.util.Map;
/**
 * DAO的基本方法接口
 * @author J.L.Zhou
 *
 * @param <T>
 */
public interface BaseDAO<T> {

	/**
	 * 保存对象
	 * @param o
	 */
	Serializable save(T o);

	/**
	 * 删除对象
	 * @param o
	 */
	void delete(T o);

	/**
	 * 更新对象
	 * @param o
	 */
	void update(T o);

	/**
	 * 保存或者更新
	 * @param o
	 */
	void saveOrUpdate(T o);

	/**
	 * 根据持久化类和对应的主键获取持久化对象
	 * @param c
	 * @param id
	 * @return
	 */
	T get(Class<T> c, Serializable id);

	/**
	 * 根据hql获取持久化对象
	 * @param hql
	 * @return
	 */
	T get(String hql,Object...params);

	/**
	 * 根据hql和参数获取持久化对象
	 * @param hql
	 * @param params
	 * @return
	 */
	T get(String hql, Map<String, Object> params);

	/**
	 * 根据hql获取持久化对象列表
	 * @param hql
	 * @return
	 */
	List<T> find(String hql,Object...params);

	/**
	 * 根据hql和参数获取持久化对象列表
	 * @param hql
	 * @param params
	 * @return
	 */
	List<T> find(String hql, Map<String, Object> params);
	

	/**
	 * 根据hql、页面和最大行数获取当前页的持久化对象列表
	 * @param hql
	 * @param page
	 * @param rows
	 * @return
	 */
	List<T> find(int page, int rows,String hql,Object...params);

	/**
	 * 根据hql、参数、页面和最大行数获取当前页的持久化对象列表
	 * @param hql
	 * @param params
	 * @param page
	 * @param rows
	 * @return
	 */
	List<T> find(String hql, Map<String, Object> params, int page, int rows);

	/**
	 * 根据hql获取统计数
	 * @param hql
	 * @return
	 */
	Long count(String hql,Object...params);

	/**
	 * 根据hql和参数获取统计数
	 * @param hql
	 * @param params
	 * @return
	 */
	Long count(String hql, Map<String, Object> params);

	/**
	 * 执行hql语句
	 * @param hql
	 * @return
	 */
	int executeHql(String hql,Object...params);
	/**
	 * 执行hql语句
	 * @param hql
	 * @param params
	 * @return
	 */
	int executeHql(String hql,Map<String, Object> params);
	/**
	 * 判断是否存在
	 * @param id
	 * @return
	 */
	T isexist(String hql,Object...params);
	
	/**
	 * 执行原生态的sql,返回集合
	 * @param sql
	 * @return
	 */
	public List findQuerySQL(String sql);
}
