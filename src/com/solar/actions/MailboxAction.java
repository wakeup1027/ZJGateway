package com.solar.actions;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.solar.po.Mailbox;
import com.solar.service.MailboxService;

public class MailboxAction {
	private MailboxService mailboxService;
	private Mailbox mailbox;
	//页
	private Integer page = 1;
	//行
	private Integer rows = 20;
	//名称
	private String  name;
	/**
	 * 电子邮箱
	 */
	private String electronicMail;
	/**
	 * 联系电话
	 */
	private String contactPhone;
	/**
	 * 联系地址
	 */
	private String contactAddress;
	/**
	 * 主题
	 */
	private String title;
	/**
	 * 内容
	 */
	private String contents;
	//批量ID
	private String [] idLots;
	//id
	private Integer id;
	
	
	public MailboxService getMailboxService() {
		return mailboxService;
	}

	public void setMailboxService(MailboxService mailboxService) {
		this.mailboxService = mailboxService;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getRows() {
		return rows;
	}

	public void setRows(Integer rows) {
		this.rows = rows;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public String[] getIdLots() {
		return idLots;
	}

	public void setIdLots(String[] idLots) {
		this.idLots = idLots;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	
	public Mailbox getMailbox() {
		return mailbox;
	}

	public void setMailbox(Mailbox mailbox) {
		this.mailbox = mailbox;
	}
	

	public String getElectronicMail() {
		return electronicMail;
	}

	public void setElectronicMail(String electronicMail) {
		this.electronicMail = electronicMail;
	}

	public String getContactPhone() {
		return contactPhone;
	}

	public void setContactPhone(String contactPhone) {
		this.contactPhone = contactPhone;
	}

	public String getContactAddress() {
		return contactAddress;
	}

	public void setContactAddress(String contactAddress) {
		this.contactAddress = contactAddress;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	/**
	 * 分页查询
	 * @return list
	 */
	public String execute()
	{
		Integer totalNum = mailboxService.listAll(name);
		Integer totalPage =  totalNum/rows+1;
		if(totalNum%rows==0)
		{
			totalPage =totalPage-1; 
		}
		if(page<1)
		{
			page=1;
		}
		else if(page>totalPage)
		{
			page=totalPage;
		}
		List<Map<String, Object>> list = mailboxService.list(page,rows,name);
		ActionContext.getContext().put("totalNum",totalNum);
		ActionContext.getContext().put("totalPage", totalPage);
		ActionContext.getContext().put("mailbox",list);
		return "list";
	}
	
	/**
	 * 批量删除
	 * @return null
	 */
	public String batchRemoval(){
		mailboxService.batchRemoval(idLots);
		//在此处响应出数据
		HttpServletResponse response = ServletActionContext.getResponse();  
		response.setCharacterEncoding("UTF-8");
        PrintWriter writer=null;
		try {
			writer = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}  
        writer.print("success");
        writer.flush();
		return null;
	}
	
	/**
	 * 根据ID查询信息
	 * @return list
	 */
	public String queryAll(){
		Mailbox mailbox = mailboxService.queryAll(id);
		ActionContext.getContext().put("mailbox", mailbox);
		return "queryAll";
	}
	
	public String modifyJump(){
		Mailbox mailbox = mailboxService.queryAll(id);
		ActionContext.getContext().put("mailbox", mailbox);
		return "modifyInformation";
	}
	public String modifyInformation(){
		mailbox = mailboxService.queryAll(id);
		mailbox.setName(name);
		mailbox.setElectronicMail(electronicMail);
		mailbox.setContactPhone(contactPhone);
		mailbox.setContactAddress(contactAddress);
		mailbox.setContents(contents);
		mailbox.setTitle(title);
		mailbox.setCreationTime(new Timestamp(System.currentTimeMillis()));
		mailboxService.addMailbox(mailbox);
		return "tolist";
	}
}
