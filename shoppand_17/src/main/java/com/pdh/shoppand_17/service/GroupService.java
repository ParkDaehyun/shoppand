package com.pdh.shoppand_17.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pdh.shoppand_17.model.entity.Groups;
import com.pdh.shoppand_17.model.repository.GroupRepository;

@Service
public class GroupService {

		
		@Autowired
		private GroupRepository groupRepository;
		

		public Iterable<Groups> getAllGroups() {
			return groupRepository.findAll();
		}

		public Groups findGroup(String gname) {
			return groupRepository.findByGroupName(gname);
		}
		
		public Groups addGroup(Groups group) {
			return groupRepository.save(group);
		}

		public boolean groupCheck(String gname) {
			if(groupRepository.findByGroupName(gname) instanceof Groups){
				System.out.println("!!");
				return true;
			}else{
				System.out.println("??");
				return false;
			}
		}

		public Groups getGroup(Long groupId) {
			return groupRepository.findByGroupId(groupId);
		}


}
