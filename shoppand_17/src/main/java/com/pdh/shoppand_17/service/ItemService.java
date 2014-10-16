package com.pdh.shoppand_17.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pdh.shoppand_17.model.entity.Items;
import com.pdh.shoppand_17.model.repository.ItemRepository;

@Service
public class ItemService {

	@Autowired
	private ItemRepository itemRepository;


	public Items addItemTag(Items item) {
		return itemRepository.save(item);
	}


	public void delItemTag(String itemId) {
		itemRepository.delete(itemRepository.findOne(Long.parseLong(itemId)));
	}


	public Items findItem(Long itemId) {
		return itemRepository.findOne(itemId);
	}
	
	

}
