package com.pdh.shoppand_17.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pdh.shoppand_17.model.entity.Items;
import com.pdh.shoppand_17.service.ItemService;

@Controller
public class ItemController {

	@Autowired
	private ItemService itemService;
	
	@RequestMapping(value="/additemtag.do")
	@ResponseBody
	public String addItemTag(String xpos, String ypos, int price, String link, String imgurl, String itemname){
		link = link.replace('#','+');
		Items item = itemService.addItemTag(new Items(itemname, imgurl, link, price, xpos, ypos));
		System.out.println(xpos+" "+ypos+" "+price+" "+link);
		return item.getItemId().toString();
	}
	
	@RequestMapping(value="/delitemtag.do")
	@ResponseBody
	public String delItemTag(String itemId){
		System.out.println(itemId);
		itemService.delItemTag(itemId);
		return "i";
	}
	
}
