package com.pdh.shoppand_17.model.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="SHARES")
public class Shares {
	
	@Id
	@Column(name = "shareId")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long shareId;
	
	@Column
	private String writer;
		
	@Column
	private String writingDate;
	
	@Column
	private String imgName;
	
	@Column
	private String info;
	
	@ManyToOne
	@JoinColumn(name = "groupId", updatable = false, insertable = false)
	private Groups group;
	

	@OneToMany(mappedBy = "share")
	private List<SharedItems> sharedItems = new ArrayList<SharedItems>();

	public Long getShareId() {
		return shareId;
	}

	public void setShareId(Long shareId) {
		this.shareId = shareId;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getWritingDate() {
		return writingDate;
	}

	public void setWritingDate(String writingDate) {
		this.writingDate = writingDate;
	}

	public String getImgName() {
		return imgName;
	}

	public void setImgName(String imgName) {
		this.imgName = imgName;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}
	
	public Groups getGroup() {
		return group;
	}

	public void setGroup(Groups group) {
		this.group = group;
	}
}
