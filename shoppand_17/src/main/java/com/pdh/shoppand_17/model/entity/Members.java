package com.pdh.shoppand_17.model.entity;

import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;



@Entity
@Table(name = "Members")
public class Members {
	@Id
	@Column(name = "email")
	private String email;
	
	@Column 
	@Size(min = 1, max = 30)
    @NotNull
    private String password;
	
	@Column
	@Size(min = 1, max = 30)
    @NotNull
    private String name;
	
	@Column
	@Size(max = 1)
    @NotNull
    private String gender;
	
	@Column
	@Size(min = 1, max = 30)
    @NotNull
    private String location;
	
	@Column
    @NotNull
    private String profileImg;
	
	@ManyToMany(mappedBy = "groupMembers", fetch=FetchType.EAGER)
	private Set<Groups> memberGroups = new LinkedHashSet<Groups>();
	
	@OneToMany
	@JoinColumn(name = "email", nullable = false)
	private List<Replies> memberReplies = new ArrayList<Replies>();
	
	@ManyToMany(fetch=FetchType.EAGER)
	@JoinTable(name = "LIKE_SHARES",
			joinColumns=@JoinColumn(name="like_email"),
			inverseJoinColumns=@JoinColumn(name="like_share_id"))
	private Set<Shares> likeShares = new LinkedHashSet<Shares>();
	
	/*
	@ManyToMany(mappedBy = "")
	*/
	public Members() {
	}

	public Members(String email, String password, String name, String gender,
			String location, String profileImg) {
		super();
		this.email = email;
		this.password = password;
		this.name = name;
		this.gender = gender;
		this.location = location;
		this.profileImg = profileImg;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}

	

	public String getPassword() {
		return password;
	}



	public void setPassword(String password) {
		this.password = password;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getGender() {
		return gender;
	}



	public void setGender(String gender) {
		this.gender = gender;
	}



	public String getLocation() {
		return location;
	}



	public void setLocation(String location) {
		this.location = location;
	}

	

	public String getProfileImg() {
		return profileImg;
	}



	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}
	
	
	public Set<Groups> getMemberGroups() {
		return memberGroups;
	}



	public void setMemberGroups(Set<Groups> memberGroups) {
		this.memberGroups = memberGroups;
	}

	
	public boolean isRightPassword(String userPassword) {
		if(getPassword().equals(userPassword)){
			return true;
		}else{
			return false;
		}
	}

	
	public void addGroup(Groups group){
		this.memberGroups.add(group);
	}

	

	public List<Replies> getMemberReplies() {
		return memberReplies;
	}

	public void setMemberReplies(List<Replies> memberReplies) {
		this.memberReplies = memberReplies;
	}

	
	
	public Set<Shares> getLikeShares() {
		return likeShares;
	}

	public void setLikeShares(Set<Shares> likeShares) {
		this.likeShares = likeShares;
	}

	public void addReply(Replies reply){
		this.memberReplies.add(reply);
		reply.setMember(this);
	}
	
	@Override
	public String toString() {
		return "Members [email=" + email + ", password=" + password + ", name="
				+ name + ", gender=" + gender + ", location=" + location
				+ ", profileImg=" + profileImg + "]";
	}

	public void addLikeShare(Shares share) {
		this.likeShares.add(share);
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result + ((gender == null) ? 0 : gender.hashCode());
		result = prime * result
				+ ((location == null) ? 0 : location.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result
				+ ((password == null) ? 0 : password.hashCode());
		result = prime * result
				+ ((profileImg == null) ? 0 : profileImg.hashCode());
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
		Members other = (Members) obj;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (gender == null) {
			if (other.gender != null)
				return false;
		} else if (!gender.equals(other.gender))
			return false;
		if (location == null) {
			if (other.location != null)
				return false;
		} else if (!location.equals(other.location))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (password == null) {
			if (other.password != null)
				return false;
		} else if (!password.equals(other.password))
			return false;
		if (profileImg == null) {
			if (other.profileImg != null)
				return false;
		} else if (!profileImg.equals(other.profileImg))
			return false;
		return true;
	}

		
	
	
	
	/*public List<Groups> getGroup() {
		List<Groups> userGroups = new ArrayList<Groups>();
		while(memberGroups.iterator().hasNext()){
			Groups group = memberGroups.iterator().next();
			if(group.getMember().email.equals(this.getEmail())){
				userGroups.add(group.getGroup());
			}
		}
		return userGroups;
	}*/
	
	
}
