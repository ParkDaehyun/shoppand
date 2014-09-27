/*package com.pdh.shoppand_17.model.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="GROUP_MEMBERS")
public class GroupMembers {

	
	@Embeddable
	public static class GroupMemberId implements Serializable{
		
		@Column(name = "groupId")
		private Long groupId;
		
		@Column(name = "email")
		private String email;
				
		public GroupMemberId() {
		}
		
		public GroupMemberId(Long groupId, String email){
			this.groupId = groupId;
			this.email = email;
		}
		
		public boolean equals(Object obj) {
			if(obj!=null && obj instanceof GroupMemberId){
				GroupMemberId that = (GroupMemberId) obj;
				return this.groupId.equals(this.groupId) && this.email.equals(this.email);
			}else{
				return false;
			}
		}
		
		public int hashCode() {
			return groupId.hashCode() + email.hashCode();
		}
	}
	
	public GroupMembers() {
	}
	
	public GroupMembers(Members member, Groups group){
		this.group = group;
		this.member = member;
		
		groupMemberid.groupId = group.getGroupId();
		groupMemberid.email = member.getEmail();
	}
	
	@EmbeddedId
	private GroupMemberId groupMemberid = new GroupMemberId();
	
	@Column
	private String position;
	
	@ManyToOne
	@JoinColumn(name = "groupId", insertable = false, updatable = false)
	private Groups group;
	
	@ManyToOne
	@JoinColumn(name = "email", insertable = false, updatable = false)
	private Members member;

	public GroupMemberId getGroupMemberid() {
		return groupMemberid;
	}

	public void setGroupMemberid(GroupMemberId groupMemberid) {
		this.groupMemberid = groupMemberid;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public Groups getGroup() {
		return group;
	}

	public void setGroup(Groups group) {
		this.group = group;
	}

	public Members getMember() {
		return member;
	}

	public void setMember(Members member) {
		this.member = member;
	}
	
	
	
}*/
