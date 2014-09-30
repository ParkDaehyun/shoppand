package com.pdh.shoppand_17.service;

import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pdh.shoppand_17.model.entity.Groups;
import com.pdh.shoppand_17.model.entity.Members;
import com.pdh.shoppand_17.model.repository.MemberRepository;


@Service
public class MemberService {
	
	@Autowired
	private MemberRepository memberRepository;
	
	public void addMember(Members member) throws Exception{
		if(findMember(member.getEmail()) != null){
			throw new Exception(member.getEmail() + "는 이미 존재하는 아이디 입니다");
		}
		memberRepository.save(member);
	}
	
	public boolean login (String email, String password) throws Exception{
		Members member = findMember(email);
		if(!member.isRightPassword(password)) {
			throw new Exception("비밀번호가 일치하지 않습니다.");
		}
		return true;
	}
	
	public Members findMember(String email){
		System.out.println("findmem");
		return memberRepository.findOne(email);
	}
	
	public List<Groups> getGroups(String email){
		return memberRepository.findByEmail(email).getMemberGroups();
	}

	public Members updateMember(Members findMember) {
		return memberRepository.save(findMember);
	}
}
