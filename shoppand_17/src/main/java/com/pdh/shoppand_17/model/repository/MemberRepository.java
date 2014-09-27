package com.pdh.shoppand_17.model.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.pdh.shoppand_17.model.entity.Members;

public interface MemberRepository extends CrudRepository<Members, String> {
	Members findByEmail(String email);
}
