package com.solar.po;

import static javax.persistence.GenerationType.IDENTITY;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "picture", catalog = "zhanjiangportal")
public class Picture {
	private Integer id;//id
	private String pictureName;//图片名称
	private String picturePath;//图片路径
	private String state;//推送状态
	private Timestamp createTime;//上传时间
	
	public Picture(){}
	public Picture(Integer id,String pictureName,String picturePath,String state,Timestamp createTime){
		this.id=id;
		this.pictureName=pictureName;
		this.picturePath=picturePath;
		this.state=state;
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
	
	@Column(name = "PICTURE_NAME", length = 100)
	public String getPictureName() {
		return this.pictureName;
	}

	public void setPictureName(String pictureName) {
		this.pictureName = pictureName;
	}
	
	@Column(name = "PICTURE_PATH", length = 200)
	public String getPicturePath() {
		return this.picturePath;
	}

	public void setPicturePath(String picturePath) {
		this.picturePath = picturePath;
	}

	@Column(name = "STATE", length = 100)
	public String getState() {
		return this.state;
	}

	public void setState(String state) {
		this.state = state;
	}
	
	@Column(name = "CREATE_TIME", length = 19)
	public Timestamp getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}
}
