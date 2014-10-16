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

import com.pdh.shoppand_17.model.entity.Shares;
import com.pdh.shoppand_17.service.ItemService;
import com.pdh.shoppand_17.service.ShareService;

@Controller
@SessionAttributes("userInfo")
public class ShareController {
	
	@Autowired
	private ShareService shareService;
	
	@Autowired
	private ItemService itemService;
	
	@RequestMapping(value = "/shareUploadForm.do")
	public ModelAndView imgUploadForm(){
		return new ModelAndView("shareUploadForm", "share", new Shares());
	}
	
	@ResponseBody
	@RequestMapping(value="/shareImgUp.do", method = RequestMethod.POST)
	public String shareImgUpload(MultipartRequest multipartRequest){
		System.out.println("abccccccc");
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
	@ResponseBody
	public String shareUp(@Valid Shares share, BindingResult result, String items){
		String [] itemarray = items.split(",");
		Shares nshare = shareService.saveShare(share);
		System.out.println(nshare.getTitle());
		for(String i : itemarray){
			if(i!=""){
				nshare.addItems(itemService.findItem(Long.parseLong(i)));
			}
		}
		System.out.println(nshare.getItems().get(0).getItemName());
		System.out.println(nshare.getItems().get(1).getItemName());
		return "!";
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
}
