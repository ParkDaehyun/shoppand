package com.pdh.shoppand_17.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pdh.shoppand_17.model.entity.Groups;
import com.pdh.shoppand_17.model.repository.GroupRepository;

@Service
@Transactional
public class GroupService {

		
		@Autowired
		private GroupRepository groupRepository;
		

		public Iterable<Groups> getAllGroups() {
			return groupRepository.findAll();
		}

		public Groups findGroupByName(String gname) {
			return groupRepository.findByGroupName(gname);
		}
		
		public Groups addGroup(Groups group) {
			return groupRepository.save(group);
		}

		public boolean groupCheck(String gname) {
			if(groupRepository.findByGroupName(gname) instanceof Groups){
				return true;
			}else{
				return false;
			}
		}

		public Groups getGroup(Long groupId) {
			return groupRepository.findOne(groupId);
		}

		public Groups updateGroup(Groups group) {
			return groupRepository.save(group);
		}

}
