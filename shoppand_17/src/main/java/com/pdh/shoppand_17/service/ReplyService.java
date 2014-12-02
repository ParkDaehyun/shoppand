package com.pdh.shoppand_17.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pdh.shoppand_17.model.entity.Replies;
import com.pdh.shoppand_17.model.repository.ReplyRepository;

@Service
@Transactional
public class ReplyService {

	@Autowired
	private ReplyRepository replyRepository;
	
	public Replies addReply(Replies replies) {
		return replyRepository.save(replies);
	}

	public List<Replies> getRecentComm(long groupId) {
		return replyRepository.findByGroupIdOrderByReplyIdDesc(groupId);
	}
	
}
