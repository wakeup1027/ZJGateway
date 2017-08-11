package com.solar.po;

import static javax.persistence.GenerationType.IDENTITY;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "information_input", catalog = "zhanjiangportal")
public class InformationInput {
	//id
	private Integer id;
	//标题
	private String title;
	//内容
	private String content;
	//具体模块
	private String modular;
	//发布人
	private String publisher;
	//发布状态
	private String releaseStatus;
	//发布时间
	private Timestamp releaseTime;
	//创建时间
	private Timestamp creationTime;
	//垃圾箱-状态为002该数据已被删除
	private String dustbin;
	//图片链接
	private String picture;
	//文章摘要
	private String fieldSummary;
	
	//点击率
	private Integer clickRate;
	
	public InformationInput(){}
	
	public InformationInput(Integer id, String title, String content,
			String modular, String publisher, String releaseStatus, 
			Timestamp releaseTime, Timestamp creationTime, String dustbin,
			String picture,String fieldSummary){
		this.id = id;
		this.title = title;
		this.content = content;
		this.modular = modular;
		this.publisher = publisher;
		this.releaseStatus = releaseStatus;
		this.releaseTime = releaseTime;
		this.creationTime = creationTime;
		this.dustbin = dustbin;
		this.picture = picture;
		this.fieldSummary = fieldSummary;
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

	@Column(name = "TITLE", length = 50)
	public String getTitle() {
		return this.title;
	}

	
	public void setTitle(String title) {
		this.title = title;
	}

	@Column(name = "CONTENT", length = 40000)
	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Column(name = "MODULAR", length = 50)
	public String getModular() {
		return this.modular;
	}

	public void setModular(String modular) {
		this.modular = modular;
	}

	@Column(name = "PUBLISHER", length = 20)
	public String getPublisher() {
		return this.publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	@Column(name = "RELEASE_STATUS", length = 20)
	public String getReleaseStatus() {
		return this.releaseStatus;
	}

	public void setReleaseStatus(String releaseStatus) {
		this.releaseStatus = releaseStatus;
	}

	@Column(name = "RELEASE_TIME")
	public Timestamp getReleaseTime() {
		return this.releaseTime;
	}

	public void setReleaseTime(Timestamp releaseTime) {
		this.releaseTime = releaseTime;
	}

	@Column(name = "CREATION_TIME")
	public Timestamp getCreationTime() {
		return this.creationTime;
	}

	public void setCreationTime(Timestamp creationTime) {
		this.creationTime = creationTime;
	}

	@Column(name = "DUSTBIN", length = 20)
	public String getDustbin() {
		return this.dustbin;
	}

	public void setDustbin(String dustbin) {
		this.dustbin = dustbin;
	}
	@Column(name = "PICTURE")
	public String getPicture() {
		return this.picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	@Column(name = "FIELD_SUMMARY", length = 40000)
	public String getFieldSummary() {
		return this.fieldSummary;
	}

	public void setFieldSummary(String fieldSummary) {
		this.fieldSummary = fieldSummary;
	}
	
	@Column(name = "CLICK_RATE", length = 100)
	public Integer getClickRate() {
		return this.clickRate;
	}

	public void setClickRate(Integer clickRate) {
		this.clickRate = clickRate;
	}
	
	
}
