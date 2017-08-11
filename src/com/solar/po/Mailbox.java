package com.solar.po;

import static javax.persistence.GenerationType.IDENTITY;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "mailbox", catalog = "zhanjiangportal")
public class Mailbox {
	/**
	 * id
	 */
	private Integer id;
	/**
	 * 名称
	 */
	private String name;
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
	/**
	 * 创建时间
	 */
	private Timestamp creationTime;
	
	public Mailbox(){}
	
	public Mailbox(Integer id,String name,String electronicMail,
			String contactPhone,String contactAddress,String title,String contents){
		this.id = id;
		this.name = name;
		this.electronicMail = electronicMail;
		this.contactPhone = contactPhone;
		this.contactAddress = contactAddress;
		this.title = title;
		this.contents = contents;
		
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

	@Column(name = "NAME", length = 19)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "ELECTRONIC_MAIL", length = 19)
	public String getElectronicMail() {
		return this.electronicMail;
	}

	public void setElectronicMail(String electronicMail) {
		this.electronicMail = electronicMail;
	}

	@Column(name = "CONTACT_PHONE", length = 19)
	public String getContactPhone() {
		return this.contactPhone;
	}

	public void setContactPhone(String contactPhone) {
		this.contactPhone = contactPhone;
	}

	@Column(name = "CONTACT_ADDRESS", length = 19)
	public String getContactAddress() {
		return this.contactAddress;
	}

	public void setContactAddress(String contactAddress) {
		this.contactAddress = contactAddress;
	}

	@Column(name = "TITLE", length = 19)
	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Column(name = "CONTENTS", length = 5000)
	public String getContents() {
		return this.contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	@Column(name = "CREATION_TIME")
	public Timestamp getCreationTime() {
		return this.creationTime;
	}

	public void setCreationTime(Timestamp creationTime) {
		this.creationTime = creationTime;
	}
	
	
	
}
