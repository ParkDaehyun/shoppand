package com.pdh.shoppand_17.model.repository;

import org.springframework.data.repository.CrudRepository;

import com.pdh.shoppand_17.model.entity.Shares;

public interface ShareRepository extends CrudRepository<Shares, String> {

	Shares findByShareId(Long shareId);
}
