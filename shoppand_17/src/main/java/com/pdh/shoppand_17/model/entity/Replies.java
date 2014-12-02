package com.pdh.shoppand_17.model.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="REPLIES")
public class Replies {
	
	@Id
	@Column(name = "replyId")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long replyId;
	
	@Column
	private String rpContents;
	
	@Column
	private String rpDate;
	
	@Column
	private Long groupId;
	
	@ManyToOne
	@JoinColumn(name = "shareId")
	private Shares share;

	@ManyToOne
	@JoinColumn(name = "email", updatable = false, insertable = false)
	private Members member;
	
	public Replies() {
		super();
	}

	public Replies(Long groupId, String rpContents,
			String rpDate) {
		super();
		this.groupId = groupId;
		this.rpContents = rpContents;
		this.rpDate = rpDate;
	}

	public Long getReplyId() {
		return replyId;
	}

	public void setReplyId(Long replyId) {
		this.replyId = replyId;
	}

	public String getRpContents() {
		return rpContents;
	}

	public void setRpContents(String rpContents) {
		this.rpContents = rpContents;
	}

	public String getRpDate() {
		return rpDate;
	}

	public void setRpDate(String rpDate) {
		this.rpDate = rpDate;
	}

	
	
	public Long getGroupId() {
		return groupId;
	}

	public void setGroupId(Long groupId) {
		this.groupId = groupId;
	}

	public Shares getShare() {
		return share;
	}

	public void setShare(Shares share) {
		this.share = share;
	}
	
	public Members getMember() {
		return member;
	}

	public void setMember(Members member) {
		this.member = member;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((groupId == null) ? 0 : groupId.hashCode());
		result = prime * result + ((replyId == null) ? 0 : replyId.hashCode());
		result = prime * result
				+ ((rpContents == null) ? 0 : rpContents.hashCode());
		result = prime * result + ((rpDate == null) ? 0 : rpDate.hashCode());
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
		Replies other = (Replies) obj;
		if (groupId == null) {
			if (other.groupId != null)
				return false;
		} else if (!groupId.equals(other.groupId))
			return false;
		if (replyId == null) {
			if (other.replyId != null)
				return false;
		} else if (!replyId.equals(other.replyId))
			return false;
		if (rpContents == null) {
			if (other.rpContents != null)
				return false;
		} else if (!rpContents.equals(other.rpContents))
			return false;
		if (rpDate == null) {
			if (other.rpDate != null)
				return false;
		} else if (!rpDate.equals(other.rpDate))
			return false;
		return true;
	}
	
	
}
