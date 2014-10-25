package com.pdh.shoppand_17.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.validation.Valid;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import com.pdh.shoppand_17.model.entity.Groups;
import com.pdh.shoppand_17.model.entity.Shares;
import com.pdh.shoppand_17.service.GroupService;
import com.pdh.shoppand_17.service.ItemService;
import com.pdh.shoppand_17.service.ShareService;

@Controller
@SessionAttributes("userInfo")
public class ShareController {
	
	@Autowired
	private GroupService groupService;
	
	@Autowired
	private ShareService shareService;
	
	@Autowired
	private ItemService itemService;
	
	@RequestMapping(value = "/shareUploadForm.do")
	public ModelAndView imgUploadForm(Long groupId){
		ModelAndView mv = new ModelAndView("shareUploadForm");
		mv.addObject("share", new Shares());
		mv.addObject("group", groupService.getGroup(groupId));
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="/shareImgUp.do", method = RequestMethod.POST)
	public String shareImgUpload(MultipartRequest multipartRequest){
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		MultipartFile file = multipartRequest.getFile("profileImg");
		String fileName = file.getOriginalFilename() + dateFormat.format(calendar.getTime());		
		System.out.println(fileName+"!");
		try{
			file.transferTo(new File("C:/Users/Administrator/git/shoppand_17/shoppand_17/WebContent/images/shareImgs/" + fileName));
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return fileName;
	}
	
	@RequestMapping(value = "/shareUp.do")
	public String shareUp(@Valid Shares share, BindingResult result, String items, String group){
		String [] itemarray = items.split(",");
		Shares nshare = shareService.saveShare(share);
		nshare.setGroup(groupService.getGroup(Long.parseLong(group)));
		System.out.println(itemarray);
		for(String i : itemarray){
			System.out.println(i);
			if(i!=""){
				nshare.addItems(itemService.findItem(Long.parseLong(i)));
			}
		}
		shareService.saveShare(nshare);
		groupService.updateGroup(groupService.getGroup(Long.parseLong(group)));
		return "redirect:/groupshare.do?groupId="+group;
	}
	
	@ResponseBody
	@RequestMapping(value="keywordSearch.do", method = RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public String keywordSearch(@RequestParam("keyword")String keyword){
		JSONArray result = null;
		try {
			keyword = new String(keyword.getBytes("8859_1"), "UTF-8");
			result = shareService.naverOpenAPI(keyword);
		} catch(Exception e) {
			e.printStackTrace();
		}
		System.out.println(result);
		String json = result.toString();
		System.out.println(json);
		return json;
	}
	
	@RequestMapping(value="sharecontent.do")
	public ModelAndView shareContent(String shareId){
		Shares sh = null;
		try {
			sh = shareService.getShare(Long.parseLong(shareId));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ModelAndView("shareContent","share", sh);
	}
}
