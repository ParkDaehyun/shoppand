package com.pdh.shoppand_17.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pdh.shoppand_17.model.repository.ShareRepository;

@Service
public class ShareService {
	
	@Autowired
	private ShareRepository shareRepository;
	
	public void getShare(Long shareId) throws Exception{
		shareRepository.findByShareId(shareId);
	}
	
}
