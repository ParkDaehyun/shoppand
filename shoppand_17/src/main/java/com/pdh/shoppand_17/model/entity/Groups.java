package com.pdh.shoppand_17.model.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;


@Entity
@Table(name = "Groups")
public class Groups {

	
	@Id
	@Column
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long groupId;
	
	
	@Size(min = 1, max = 30)
    @NotNull
    @JoinColumn(name = "email")
    private String founder;
	
	@Column
	@Size(min = 1, max = 30)
    @NotNull
    private String groupName;
	
	@Column
    @NotNull
    private String groupDate;
	
	//@OneToMany(mappedBy = "group")
	@ManyToMany(fetch=FetchType.EAGER)
	@JoinTable(name = "GROUP_MEMBERS",
			joinColumns=@JoinColumn(name="group_Id"),
			inverseJoinColumns=@JoinColumn(name="user_email"))
	private List<Members> groupMembers = new ArrayList<Members>();

	@OneToMany(fetch=FetchType.EAGER)
	@Fetch(FetchMode.SUBSELECT)
	@JoinColumn(name = "groupId", nullable = false)
/*	@IndexColumn(name = "shareId")*/
	private List<Shares> shares = new ArrayList<Shares>();
	
	
	public Long getGroupId() {
		return groupId;
	}

	public void setGroupId(Long groupId) {
		this.groupId = groupId;
	}

	public String getFounder() {
		return founder;
	}

	public void setFounder(String founder) {
		this.founder = founder;
	}

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public String getGroupDate() {
		return groupDate;
	}

	public void setGroupDate(String groupDate) {
		this.groupDate = groupDate;
	}

	public List<Members> getGroupMembers() {
		return groupMembers;
	}

	public void setGroupMembers(List<Members> groupMembers) {
		this.groupMembers = groupMembers;
	}

	public List<Shares> getShares() {
		return shares;
	}

	public void setShares(List<Shares> shares) {
		this.shares = shares;
	}

	/*public Members callGroupMember(String groupId){
		return groupMembers.indexOf(memberService) 
	}*/
	
	public void addGroupMember(Members member){
		this.groupMembers.add(member);
		member.addGroup(this);
	}

	@Override
	public String toString() {
		return "Groups [groupId=" + groupId + ", founder=" + founder
				+ ", groupName=" + groupName + ", groupDate=" + groupDate
				+ ", groupMembers=" + groupMembers + ", shares=" + shares + "]";
	}

	public void addGroupShare(Shares share) {
		this.shares.add(share);
		
	}

	public boolean hasMember(Members findMember) {
		return this.groupMembers.contains(findMember);
	}

	
}