package com.pdh.shoppand_17.model.entity;

import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
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
	
	@Column
	private int likes = 0;
	
	@ManyToOne
	@JoinColumn(name = "groupId", updatable = false, insertable = false)
	private Groups group;
	
	@OneToMany(mappedBy = "share")
	private List<Items> items = new ArrayList<Items>();

	@OneToMany(mappedBy = "share")
	private List<Replies> replies = new ArrayList<Replies>();
	
	@ManyToMany(mappedBy = "likeShares")
	private Set<Members> likeMembers = new LinkedHashSet<Members>();
	
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

	public Set<Members> getLikeMembers() {
		return likeMembers;
	}

	public void setLikeMembers(Set<Members> likeMembers) {
		this.likeMembers = likeMembers;
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
	
	public void addLikeUser(Members member) {
		System.out.println(member);
		this.likeMembers.add(member);
		member.addLikeShare(this);
		this.likes = likeMembers.size();
	}

	public int getLikes() {
		return likes;
	}

	public void setLikes(int likes) {
		this.likes = likes;
	}

	@Override
	public String toString() {
		return "Shares [shareId=" + shareId + ", writer=" + writer + ", title="
				+ title + ", writingDate=" + writingDate + ", imgName="
				+ imgName + ", info=" + info + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + accessAuth;
		result = prime * result
				+ ((category == null) ? 0 : category.hashCode());
		result = prime * result + ((imgName == null) ? 0 : imgName.hashCode());
		result = prime * result + ((info == null) ? 0 : info.hashCode());
		result = prime * result + likes;
		result = prime * result + replyCount;
		result = prime * result + ((shareId == null) ? 0 : shareId.hashCode());
		result = prime * result + ((title == null) ? 0 : title.hashCode());
		result = prime * result + ((writer == null) ? 0 : writer.hashCode());
		result = prime * result
				+ ((writingDate == null) ? 0 : writingDate.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Shares other = (Shares) obj;
		if (accessAuth != other.accessAuth)
			return false;
		if (category == null) {
			if (other.category != null)
				return false;
		} else if (!category.equals(other.category))
			return false;
		if (imgName == null) {
			if (other.imgName != null)
				return false;
		} else if (!imgName.equals(other.imgName))
			return false;
		if (info == null) {
			if (other.info != null)
				return false;
		} else if (!info.equals(other.info))
			return false;
		if (likes != other.likes)
			return false;
		if (replyCount != other.replyCount)
			return false;
		if (shareId == null) {
			if (other.shareId != null)
				return false;
		} else if (!shareId.equals(other.shareId))
			return false;
		if (title == null) {
			if (other.title != null)
				return false;
		} else if (!title.equals(other.title))
			return false;
		if (writer == null) {
			if (other.writer != null)
				return false;
		} else if (!writer.equals(other.writer))
			return false;
		if (writingDate == null) {
			if (other.writingDate != null)
				return false;
		} else if (!writingDate.equals(other.writingDate))
			return false;
		return true;
	}


	
	
	
	
}
