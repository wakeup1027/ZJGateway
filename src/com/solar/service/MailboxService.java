package com.solar.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.solar.dao.MailboxDAO;
import com.solar.po.Gateway;
import com.solar.po.Mailbox;

@Service
public class MailboxService {
	private MailboxDAO mailboxDAO;

	public MailboxDAO getMailboxDAO() {
		return mailboxDAO;
	}

	@Autowired
	public void setMailboxDAO(MailboxDAO mailboxDAO) {
		this.mailboxDAO = mailboxDAO;
	}
	
	/**
	 * 新增方法
	 * @param mailbox
	 */
	public void addMailbox(Mailbox mailbox){
		mailboxDAO.addMailbox(mailbox);
	}
	
	/**
	 * 统计条数
	 * @param name
	 * @return
	 */
	public Integer listAll(String name) {
		return mailboxDAO.listAll(name).size();
	}

	/**
	 * 分页查询
	 * @param page
	 * @param rows
	 * @param name
	 * @return
	 */
	public List<Map<String, Object>> list(Integer page, Integer rows, String name) {
		List<Map<String, Object>> result = new ArrayList<Map<String,Object>>();
		List<Mailbox> list = mailboxDAO.list(page, rows, name);
		for(Mailbox mailbox : list){
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("id", mailbox.getId());
			map.put("name", mailbox.getName());
			map.put("contactPhone", mailbox.getContactPhone());
			map.put("title", mailbox.getTitle());
			result.add(map);
		}
		return result;
	}
	
	/**
	 * 批量删除
	 * @param idLots
	 */
	public void batchRemoval(String [] idLots){
		mailboxDAO.batchRemoval(idLots);
	}
	
	/**
	 * 根据ID查询信息
	 * @param id
	 * @return
	 */
	public Mailbox queryAll(Integer id){
		return mailboxDAO.queryAll(id);
	}
	
}
