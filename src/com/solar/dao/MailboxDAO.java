package com.solar.dao;

import java.util.List;

import com.solar.po.Mailbox;

public interface MailboxDAO {
	/**
	 * 新增方法
	 * @param mailbox
	 */
	void addMailbox(Mailbox mailbox);
	/**
	 * 模糊查询
	 * @param name
	 * @return
	 */
	List<Mailbox> listAll(String name);
	/**
	 * 分页查询
	 * @param page
	 * @param rows
	 * @param name
	 * @return
	 */
	List<Mailbox> list(Integer page, Integer rows,String name);
	/**
	 * 批量删除
	 * @param idLots
	 */
	void batchRemoval(String [] idLots);
	/**
	 * 根据ID查询信息
	 * @param id
	 * @return
	 */
	Mailbox queryAll(Integer id);
}
