package com.pdh.shoppand_17.model.repository;

import org.springframework.data.repository.CrudRepository;

import com.pdh.shoppand_17.model.entity.Items;

public interface ItemRepository extends CrudRepository<Items, Long> {

}
