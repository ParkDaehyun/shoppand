package com.pdh.shoppand_17.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.validation.Valid;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import com.pdh.shoppand_17.model.entity.Members;
import com.pdh.shoppand_17.model.entity.Shares;
import com.pdh.shoppand_17.service.GroupService;
import com.pdh.shoppand_17.service.ItemService;
import com.pdh.shoppand_17.service.MemberService;
import com.pdh.shoppand_17.service.ReplyService;
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
	
	@Autowired
	private ReplyService replyService;
	
	@Autowired
	private MemberService memberService;
	
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
	public String shareUp(@Valid Shares share, BindingResult result, String items, String group, Model model, @ModelAttribute("userInfo")Members member){
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
		memberService.updateMember(member);
		model.addAttribute("userInfo", memberService.findMember(member.getEmail()));
		return "redirect:/categoryshare.do?groupId="+group+"&item=all&pageNum=0";
	}
	
	@ResponseBody
	@RequestMapping(value="keywordSearch.do", method = RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public String keywordSearch(@RequestParam("keyword")String keyword){
		JSONArray result = null;
		try {
			System.out.println(keyword);
			/*keyword = new String(keyword.getBytes("8859_1"), "UTF-8");
			System.out.println(keyword);*/
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
	
	@RequestMapping(value="categoryshare.do")
	public ModelAndView categoryshare(@ModelAttribute("userInfo")Members member, String groupId, String item, int pageNum){
		ModelAndView mv = new ModelAndView();
		List<Shares> categoryShare;
		if(item.equals("all")){
			categoryShare = shareService.getPageShare(groupService.getGroup(Long.parseLong(groupId)), pageNum);
			mv.addObject("size", groupService.getGroup(Long.parseLong(groupId)).getShares().size());
		}else{
			categoryShare = shareService.getGroupCategoryShare(groupService.getGroup(Long.parseLong(groupId)), item, pageNum);
			mv.addObject("size", shareService.getGroupCategoryShare(groupService.getGroup(Long.parseLong(groupId)), item).size());
		}		
		mv.addObject("pageNum", pageNum);
		mv.addObject("shares", categoryShare);
		mv.addObject("category", item);
		mv.addObject("group", groupService.getGroup(Long.parseLong(groupId)));
		mv.addObject("recentComm", replyService.getRecentComm(Long.parseLong(groupId)));
		mv.setViewName("groupShare");
		return mv;
	}
	
	@RequestMapping(value="likeUp.do")
	@ResponseBody
	public String likeUp(@ModelAttribute("userInfo")Members member, String shareId, Model model){
		Shares share = null;
		try {
			share = shareService.getShare(Long.parseLong(shareId));
			System.out.println(share.getTitle());
			System.out.println(share.getLikes());
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(!share.getLikeMembers().isEmpty()){
			System.out.println(share.getLikeMembers().iterator().next());
			System.out.println(share.getLikeMembers().iterator().next().equals(member));
		}
		System.out.println("mem :" + member.getLikeShares());
		System.out.println("share :" + share.getLikeMembers());
		System.out.println(share.getLikeMembers().contains(member));
		if(!share.getLikeMembers().contains(member)){			
			share.addLikeUser(member);
			share = shareService.saveShare(share);
			groupService.updateGroup(share.getGroup());
			System.out.println(member.getMemberGroups());
			//System.out.println(memberService.updateMember(member).getMemberGroups());
			model.addAttribute("userInfo", memberService.updateMember(member));
			System.out.println("after : " + member.getMemberGroups());
			//System.out.println(model.("userInfo"));
			System.out.println(share.getLikeMembers());
			//share = shareService.saveShare(share);
			System.out.println(share.getTitle());
			System.out.println(share.getLikes());
		}
		return String.valueOf(share.getLikes());
	}
	
	
	@RequestMapping(value="recommendShareList.do")
	public ModelAndView recommendShareList(@ModelAttribute("userInfo")Members member){
		return new ModelAndView("userRecomm","shares", shareService.recommendShareList(member));
	}
}
