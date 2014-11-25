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
	private String title;
	
	@Column
	private String writingDate;
	
	@Column
	private String imgName;
	
	@Column
	private String info;
	
	@Column
	private int replyCount;
	
	@Column
	private int accessAuth;
	
	@Column
	private String category;
	
	@ManyToOne
	@JoinColumn(name = "groupId", updatable = false, insertable = false)
	private Groups group;
	

	@OneToMany(mappedBy = "share")
	private List<Items> items = new ArrayList<Items>();

	@OneToMany(mappedBy = "share")
	private List<Replies> replies = new ArrayList<Replies>();
	
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
	
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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
	
	public int getReplyCount() {
		return replyCount;
	}

	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}
		
	public int getAccessAuth() {
		return accessAuth;
	}

	public void setAccessAuth(int accessAuth) {
		this.accessAuth = accessAuth;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public Groups getGroup() {
		return group;
	}

	public void setGroup(Groups group) {
		this.group = group;
		group.addGroupShare(this);
	}

	public List<Items> getItems() {
		return items;
	}

	public void setItems(List<Items> items) {
		this.items = items;
	}
	
	public List<Replies> getReplies() {
		return replies;
	}

	public void setReplies(List<Replies> replies) {
		this.replies = replies;
	}

	public void addItems(Items item) {
		this.items.add(item);
		item.setShare(this);
	}
	
	public void addReplies(Replies reply){
		this.replies.add(reply);
		reply.setShare(this);
	}
	
	public boolean isAccessible(int flag){
		if(flag == 1) {return true;}
		else{return false;}
	}

	@Override
	public String toString() {
		return "Shares [shareId=" + shareId + ", writer=" + writer + ", title="
				+ title + ", writingDate=" + writingDate + ", imgName="
				+ imgName + ", info=" + info + "]";
	}
	
	
}
