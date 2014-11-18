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
			hm.put("msg", "Duplicated");
			hm.put("code", "1");
		}else{
			hm.put("msg", "not Duplicated");
			hm.put("code", "2");
		}
		return gson.toJson(hm);
	}
	
	@RequestMapping(value = "/groupadd.do", produces="text/plain;charset=UTF-8")
	public String addGroup(@Valid Groups group, BindingResult result, Model model, @ModelAttribute("userInfo")Members member){
		try{
			Groups ngroup = groupService.addGroup(group);
			ngroup.addGroupMember(member);
			groupService.updateGroup(ngroup);
			model.addAttribute("userInfo", memberService.updateMember(member));
		}catch(Exception e){
			e.printStackTrace();
		}
		return "redirect:/groupshare.do?groupId=" + group.getGroupId();
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
	
	@RequestMapping(value = "/chkGroupMember.do", method = RequestMethod.POST)
	@ResponseBody
	public String chkGroupMember(String addmail, Long groupId){
		String msg = "1";
		Members mem = memberService.findMember(addmail);
		System.out.println(mem);
		System.out.println(addmail);
		//System.out.println(groupname);
		System.out.println(groupService.getGroup(groupId).getGroupMembers());
		System.out.println(mem.getMemberGroups());
		if(mem instanceof Members){/*
			groupService.findGroup(groupname).addGroupMember(mem);
			System.out.println(mem.getMemberGroups());
			System.out.println(groupService.findGroup(groupname).getGroupMembers());*/
			
		}else{
			msg = "2";
		}
		return msg;
	}
	
	@RequestMapping(value = "/addGroupMember.do", method = RequestMethod.POST)
	@ResponseBody
	public String addGroupMember(Long groupId, String addmail){
		String msg = "1";
		Groups group = groupService.getGroup(groupId);
		if(memberService.findMember(addmail) instanceof Members ){
			try{
				if(group.hasMember(memberService.findMember(addmail))){
					msg = "2";
				}else{
					group.addGroupMember(memberService.findMember(addmail));
					groupService.updateGroup(group);
					memberService.updateMember(memberService.findMember(addmail));
				}
				//System.out.println(member.getMemberGroups());
			}catch(Exception e){
				msg = "2";
			}
		}else{
			msg = "2";
		}
		return msg;
	}
	
	@RequestMapping(value = "/groupshare.do")
	public ModelAndView groupShare(@ModelAttribute("userInfo")Members member, String groupId){
		System.out.println(Long.parseLong(groupId));
		ModelAndView mv = new ModelAndView();
		//mv.addObject("groups", groupService.getAllGroups());
		mv.addObject("recentnum", groupService.getGroup(Long.parseLong(groupId)).getShares().size());
		//mv.addObject("shares", groupService.getGroup(Long.parseLong(groupId)).getShares());
		mv.addObject("group", groupService.getGroup(Long.parseLong(groupId)));
		mv.addObject("recentComm", replyService.getRecentComm(Long.parseLong(groupId)));
				//getRecentComm(groupId));
		mv.setViewName("groupShare");
		return mv;
	}
}
