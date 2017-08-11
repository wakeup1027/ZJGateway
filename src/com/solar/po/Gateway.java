package com.solar.po;

import static javax.persistence.GenerationType.IDENTITY;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "gateway", catalog = "zhanjiangportal")
public class Gateway implements java.io.Serializable {
	//id
	private Integer id;
	//产业类型
	private String industryType;
	//项目名称
	private String entryName;
	//联系人
	private String contacts;
	//邮箱
	private String mailbox;
	//联系电话
	private String contactPhone;
	//手机
	private String mobilePhone;
	//创建时间
	private Timestamp createTime;
	
	public Gateway(){}
	
	public Gateway(Integer id, String industryType, String entryName,
			String contacts, String mailbox, String contactPhone,
			String mobilePhone, Timestamp createTime){
		this.id = id;
		this.industryType = industryType;
		this.entryName = entryName;
		this.contacts = contacts;
		this.mailbox = mailbox;
		this.contactPhone = contactPhone;
		this.mobilePhone = mobilePhone;
		this.createTime = createTime;
	}

	
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "ID", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "INDUSTRY_TYPE", length = 50)
	public String getIndustryType() {
		return this.industryType;
	}

	public void setIndustryType(String industryType) {
		this.industryType = industryType;
	}

	@Column(name = "ENTRY_NAME", length = 50)
	public String getEntryName() {
		return this.entryName;
	}

	public void setEntryName(String entryName) {
		this.entryName = entryName;
	}

	@Column(name = "CONTACTS", length = 50)
	public String getContacts() {
		return this.contacts;
	}

	public void setContacts(String contacts) {
		this.contacts = contacts;
	}

	@Column(name = "MAILBOX", length = 50)
	public String getMailbox() {
		return this.mailbox;
	}

	public void setMailbox(String mailbox) {
		this.mailbox = mailbox;
	}

	@Column(name = "CONTACT_PHONE", length = 50)
	public String getContactPhone() {
		return this.contactPhone;
	}

	public void setContactPhone(String contactPhone) {
		this.contactPhone = contactPhone;
	}

	@Column(name = "MOBILE_PHONE", length = 50)
	public String getMobilePhone() {
		return this.mobilePhone;
	}

	public void setMobilePhone(String mobilePhone) {
		this.mobilePhone = mobilePhone;
	}
	

	@Column(name = "CREATETIME")
	public Timestamp getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}
	
	
	
}
