package com.solar.po;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Files entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "files", catalog = "zhanjiangportal")
public class Files implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer foldId;
	private String realName;
	private String fileName;
	private Integer rsId;
	private String rsUrl;
	private Integer fileTypeId;
	private Integer fileSize;
	private Integer state;
	private Integer downTime;
	private Integer browerTime;
	private Integer needIntegral;
	private String needLevel;
	private String description;
	private Integer sourceProductId;
	private Integer sourceEntityId;
	private Integer allowView;
	private Integer allowDown;
	private String typeCode;
	private Integer userId;
	private Timestamp createTime;
	private Timestamp lastUpdateTime;
	private Integer lastUpdateUserId;
	private String checkView;
	private String currentUser;
	private String sharedState;
	//发布时间
	private Timestamp releaseTime;
	//发布人
	private String releasePerson;

	// Constructors

	/** default constructor */
	public Files() {
	}

	/** full constructor */
	public Files(Integer foldId, String realName, String fileName,
			Integer rsId, String rsUrl, Integer fileTypeId, Integer fileSize,
			Integer state, Integer downTime, Integer browerTime,
			Integer needIntegral, String needLevel, String description,
			Integer sourceProductId, Integer sourceEntityId, Integer allowView,
			Integer allowDown, String typeCode, Integer userId,
			Timestamp createTime, Timestamp lastUpdateTime,
			Integer lastUpdateUserId, String checkView, String currentUser, String sharedState,
			Timestamp releaseTime,String releasePerson) {
		this.foldId = foldId;
		this.realName = realName;
		this.fileName = fileName;
		this.rsId = rsId;
		this.rsUrl = rsUrl;
		this.fileTypeId = fileTypeId;
		this.fileSize = fileSize;
		this.state = state;
		this.downTime = downTime;
		this.browerTime = browerTime;
		this.needIntegral = needIntegral;
		this.needLevel = needLevel;
		this.description = description;
		this.sourceProductId = sourceProductId;
		this.sourceEntityId = sourceEntityId;
		this.allowView = allowView;
		this.allowDown = allowDown;
		this.typeCode = typeCode;
		this.userId = userId;
		this.createTime = createTime;
		this.lastUpdateTime = lastUpdateTime;
		this.lastUpdateUserId = lastUpdateUserId;
		this.checkView = checkView;
		this.currentUser = currentUser;
		this.sharedState=sharedState;
		this.releaseTime=releaseTime;
		this.releasePerson=releasePerson;
		
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "ID", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "FOLD_ID")
	public Integer getFoldId() {
		return this.foldId;
	}

	public void setFoldId(Integer foldId) {
		this.foldId = foldId;
	}

	@Column(name = "REAL_NAME", length = 100)
	public String getRealName() {
		return this.realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	@Column(name = "FILE_NAME", length = 300)
	public String getFileName() {
		return this.fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	@Column(name = "RS_ID")
	public Integer getRsId() {
		return this.rsId;
	}

	public void setRsId(Integer rsId) {
		this.rsId = rsId;
	}

	@Column(name = "RS_URL", length = 500)
	public String getRsUrl() {
		return this.rsUrl;
	}

	public void setRsUrl(String rsUrl) {
		this.rsUrl = rsUrl;
	}

	@Column(name = "FILE_TYPE_ID")
	public Integer getFileTypeId() {
		return this.fileTypeId;
	}

	public void setFileTypeId(Integer fileTypeId) {
		this.fileTypeId = fileTypeId;
	}

	@Column(name = "FILE_SIZE")
	public Integer getFileSize() {
		return this.fileSize;
	}

	public void setFileSize(Integer fileSize) {
		this.fileSize = fileSize;
	}

	@Column(name = "STATE")
	public Integer getState() {
		return this.state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	@Column(name = "DOWN_TIME")
	public Integer getDownTime() {
		return this.downTime;
	}

	public void setDownTime(Integer downTime) {
		this.downTime = downTime;
	}

	@Column(name = "BROWER_TIME")
	public Integer getBrowerTime() {
		return this.browerTime;
	}

	public void setBrowerTime(Integer browerTime) {
		this.browerTime = browerTime;
	}

	@Column(name = "NEED_INTEGRAL")
	public Integer getNeedIntegral() {
		return this.needIntegral;
	}

	public void setNeedIntegral(Integer needIntegral) {
		this.needIntegral = needIntegral;
	}

	@Column(name = "NEED_LEVEL", length = 10)
	public String getNeedLevel() {
		return this.needLevel;
	}

	public void setNeedLevel(String needLevel) {
		this.needLevel = needLevel;
	}

	@Column(name = "DESCRIPTION", length = 500)
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Column(name = "SOURCE_PRODUCT_ID")
	public Integer getSourceProductId() {
		return this.sourceProductId;
	}

	public void setSourceProductId(Integer sourceProductId) {
		this.sourceProductId = sourceProductId;
	}

	@Column(name = "SOURCE_ENTITY_ID")
	public Integer getSourceEntityId() {
		return this.sourceEntityId;
	}

	public void setSourceEntityId(Integer sourceEntityId) {
		this.sourceEntityId = sourceEntityId;
	}

	@Column(name = "ALLOW_VIEW")
	public Integer getAllowView() {
		return this.allowView;
	}

	public void setAllowView(Integer allowView) {
		this.allowView = allowView;
	}

	@Column(name = "ALLOW_DOWN")
	public Integer getAllowDown() {
		return this.allowDown;
	}

	public void setAllowDown(Integer allowDown) {
		this.allowDown = allowDown;
	}

	@Column(name = "TYPE_CODE", length = 100)
	public String getTypeCode() {
		return this.typeCode;
	}

	public void setTypeCode(String typeCode) {
		this.typeCode = typeCode;
	}

	@Column(name = "USER_ID")
	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	@Column(name = "CREATE_TIME", length = 19)
	public Timestamp getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}

	@Column(name = "LAST_UPDATE_TIME", length = 19)
	public Timestamp getLastUpdateTime() {
		return this.lastUpdateTime;
	}

	public void setLastUpdateTime(Timestamp lastUpdateTime) {
		this.lastUpdateTime = lastUpdateTime;
	}

	@Column(name = "LAST_UPDATE_USER_ID")
	public Integer getLastUpdateUserId() {
		return this.lastUpdateUserId;
	}

	public void setLastUpdateUserId(Integer lastUpdateUserId) {
		this.lastUpdateUserId = lastUpdateUserId;
	}

	@Column(name = "CHECK_VIEW", length = 3)
	public String getCheckView() {
		return this.checkView;
	}

	public void setCheckView(String checkView) {
		this.checkView = checkView;
	}
	@Column(name = "CURRENTUSER", length = 20)
	public String getCurrentUser() {
		return this.currentUser;
	}

	public void setCurrentUser(String currentUser) {
		this.currentUser = currentUser;
	}
	@Column(name = "SHARED_STATE", length = 20)
	public String getSharedState() {
		return this.sharedState;
	}

	public void setSharedState(String sharedState) {
		this.sharedState = sharedState;
	}

	@Column(name = "RELEASE_TIME")
	public Timestamp getReleaseTime() {
		return this.releaseTime;
	}

	public void setReleaseTime(Timestamp releaseTime) {
		this.releaseTime = releaseTime;
	}

	@Column(name = "RELEASE_PERSON")
	public String getReleasePerson() {
		return this.releasePerson;
	}

	public void setReleasePerson(String releasePerson) {
		this.releasePerson = releasePerson;
	}
	
	
}