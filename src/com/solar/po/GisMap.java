package com.solar.po;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "gisMap", catalog = "zhanjiangportal")
public class GisMap {
	
	private Integer id;
	
	private String xpoint; //x轴坐标
	
	private String ypoint; //y轴坐标
	
	private String commitTitle; //备注标题
	
	private String commit; //备注
	
	private String areaName; //所属区域
	
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "xpoint", length = 25)
	public String getXpoint() {
		return xpoint;
	}

	public void setXpoint(String xpoint) {
		this.xpoint = xpoint;
	}

	@Column(name = "ypoint", length = 25)
	public String getYpoint() {
		return ypoint;
	}

	public void setYpoint(String ypoint) {
		this.ypoint = ypoint;
	}

	@Column(name = "commitTitle", length = 255)
	public String getCommitTitle() {
		return commitTitle;
	}

	public void setCommitTitle(String commitTitle) {
		this.commitTitle = commitTitle;
	}
	
	@Column(name = "commit", length = 1000)
	public String getCommit() {
		return commit;
	}

	public void setCommit(String commit) {
		this.commit = commit;
	}
	
	@Column(name = "areaName", length = 50)
	public String getAreaName() {
		return areaName;
	}

	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}

	@Override
	public String toString() {
		return "{\"id\":\"" + id + "\", \"xpoint\":\"" + xpoint + "\", \"ypoint\":\"" + ypoint + "\", \"commitTitle\":\"" + commitTitle + "\", \"areaName\":\"" + areaName + "\", \"commit\":\"" + commit + "\"}";
	}
}
