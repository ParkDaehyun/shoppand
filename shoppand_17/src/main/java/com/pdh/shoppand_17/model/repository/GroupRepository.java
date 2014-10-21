package com.pdh.shoppand_17.model.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.pdh.shoppand_17.model.entity.Groups;

public interface GroupRepository extends CrudRepository<Groups, Long> {
	Groups findByGroupName(String groupName);

}
