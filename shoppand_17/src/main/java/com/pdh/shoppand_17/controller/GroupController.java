package com.pdh.shoppand_17.controller;


import java.util.HashMap;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.pdh.shoppand_17.model.entity.Groups;
import com.pdh.shoppand_17.model.entity.Members;
import com.pdh.shoppand_17.model.entity.Shares;
import com.pdh.shoppand_17.service.GroupService;
import com.pdh.shoppand_17.service.MemberService;
import com.pdh.shoppand_17.service.ReplyService;
import com.pdh.shoppand_17.service.ShareService;

@Controller
@SessionAttributes("userInfo")
public class GroupController {
	
	@Autowired
	private GroupService groupService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private ReplyService replyService;
	@Autowired
	private ShareService shareService;
	
	@RequestMapping(value = "/groupIndex.do")
	public String getAllGroups(@ModelAttribute("userInfo")Members member, Model model){
		model.addAttribute("shares", shareService.getMemberGroupShare(member.getEmail()));
		return "userGroups";
	}
	
	@RequestMapping(value = "/groupForm.do")
	public String groupForm(Model model){
		model.addAttribute("newgroup", new Groups());
		return "groupMakeForm";
	}
	
	@RequestMapping(value = "/groupCheck.do", method = RequestMethod.POST)
	@ResponseBody
	public String groupCheck(String gname){
		System.out.println(gname);
		Gson gson = new Gson();
		HashMap<String,String>hm = new HashMap<String, String>();
		if(groupService.groupCheck(gname)){
			hm.put("code", "1");
		}else{
			hm.put("code", "2");
		}
		return gson.toJson(hm);
	}
	
	@RequestMapping(value = "/groupadd.do")
	public String addGroup(@Valid Groups group, BindingResult result, Model model, @ModelAttribute("userInfo")Members member){
		try{
			Groups ngroup = groupService.addGroup(group);
			ngroup.addGroupMember(member);
			groupService.updateGroup(ngroup);
			model.addAttribute("userInfo", memberService.updateMember(member));
		}catch(Exception e){
			e.printStackTrace();
		}
		return "redirect:/categoryshare.do?groupId=" + group.getGroupId() + "&item=all&pageNum=0";
	}
	
	@RequestMapping(value = "/addMemberForm.do")
	public ModelAndView addMemberForm(String groupId){
		return new ModelAndView("addMember", "group", groupService.getGroup(Long.parseLong(groupId)));
	}
/*	
	@RequestMapping(value = "/aboutGroup.do")
	public String groupView(String groupId, Model model){
		model.addAttribute("group", groupService.getGroup(Long.parseLong(groupId)));
		return "aboutGroup";
	}*/
	
	@RequestMapping(value = "/chkGroupMember.do", method = RequestMethod.POST, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String chkGroupMember(String addmail, Long groupId){
		String msg = "1";
		Groups group = groupService.getGroup(groupId);
		if(memberService.findMember(addmail) instanceof Members ){
			if(group.hasMember(memberService.findMember(addmail))){
				msg = "2";
			}else{
				msg = memberService.findMember(addmail).getName();
			}			
		}
		return msg;
	}
	
	@RequestMapping(value = "/addGroupMember.do", method = RequestMethod.POST, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String addGroupMember(Long groupId, String addmail){
		String msg = "1";
		Groups group = groupService.getGroup(groupId);
		group.addGroupMember(memberService.findMember(addmail));
		groupService.updateGroup(group);
		memberService.updateMember(memberService.findMember(addmail));
		msg = memberService.findMember(addmail).getName();
				
		return msg;
	}
	
	@RequestMapping(value = "/groupshare.do")
	public ModelAndView groupShare(@ModelAttribute("userInfo")Members member, String groupId, int pageNum){
		System.out.println(Long.parseLong(groupId));
		ModelAndView mv = new ModelAndView();
		//mv.addObject("groups", groupService.getAllGroups());
		mv.addObject("size", groupService.getGroup(Long.parseLong(groupId)).getShares().size());
		mv.addObject("pageNum", pageNum);
		mv.addObject("shares", shareService.getPageShare(groupService.getGroup(Long.parseLong(groupId)), pageNum));
		mv.addObject("group", groupService.getGroup(Long.parseLong(groupId)));
		mv.addObject("recentComm", replyService.getRecentComm(Long.parseLong(groupId)));
				//getRecentComm(groupId));
		mv.setViewName("groupShare");
		return mv;
	}
}
