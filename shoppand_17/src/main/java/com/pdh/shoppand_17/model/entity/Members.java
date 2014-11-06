package com.pdh.shoppand_17.model.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
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
	private List<Groups> memberGroups = new ArrayList<Groups>();
	
	@OneToMany
	@JoinColumn(name = "email", nullable = false)
	private List<Replies> memberReplies = new ArrayList<Replies>();
	
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

	

	public String getprofileImg() {
		return profileImg;
	}



	public void setprofileImg(String profileImg) {
		this.profileImg = profileImg;
	}
	
	public List<Groups> getMemberGroups() {
		return memberGroups;
	}



	public void setMemberGroups(List<Groups> memberGroups) {
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
