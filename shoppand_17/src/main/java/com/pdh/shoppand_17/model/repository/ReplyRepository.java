package com.pdh.shoppand_17.model.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.pdh.shoppand_17.model.entity.Replies;

public interface ReplyRepository extends CrudRepository<Replies, Long> {
	List<Replies> findByGroupIdOrderByReplyIdDesc(Long groupId);
}
