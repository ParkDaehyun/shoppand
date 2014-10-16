package com.pdh.shoppand_17.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pdh.shoppand_17.model.entity.Items;
import com.pdh.shoppand_17.model.entity.Shares;
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
	
	/*@RequestMapping(value="/tagaddon.do")
	public String tagAddOn(String imgName, String firitem, String secitem, String thiitem, String fouitem, Model model){
		ArrayList<String> list = new ArrayList<String>();
		list.add(0, firitem);
		list.add(1, secitem);
		list.add(2, thiitem);
		list.add(3, fouitem);
		for(int i=0; i<list.size(); i++){
			if(list.get(i)!=""){
				System.out.println(list.get(i));
				model.addAttribute("item"+i, itemService.findItem(list.get(i)));
			}
		}
		model.addAttribute("share", new Shares());
		model.addAttribute("imgName", imgName);
		model.addAttribute("list", list);
		return "shareTextUploadForm";
	}*/
}
