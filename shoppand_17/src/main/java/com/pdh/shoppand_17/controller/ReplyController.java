package com.pdh.shoppand_17.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.pdh.shoppand_17.model.entity.Members;
import com.pdh.shoppand_17.model.entity.Replies;
import com.pdh.shoppand_17.model.entity.Shares;
import com.pdh.shoppand_17.service.MemberService;
import com.pdh.shoppand_17.service.ReplyService;
import com.pdh.shoppand_17.service.ShareService;

@Controller
@SessionAttributes("userInfo")
public class ReplyController {

	@Autowired
	private ReplyService replyService;
	
	@Autowired
	private ShareService shareService;
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="addReply.do")
	public String addReply(String groupId, String shareId, String rpWriter, String rpDate, String rpContents){
		try {
			rpContents = new String(rpContents.getBytes("ISO_8859_1"),"UTF-8");
			Shares share = shareService.getShare(Long.parseLong(shareId));
			Members member = memberService.findMember(rpWriter);
			Replies addedRp = replyService.addReply(new Replies(Long.parseLong(groupId), rpContents, rpDate));
			share.addReplies(addedRp);
			share.setReplyCount(share.getReplyCount()+1);
			member.addReply(addedRp);
			shareService.saveShare(share);
			memberService.updateMember(member);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/sharecontent.do?shareId="+shareId;
	}
}
