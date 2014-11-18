package com.pdh.shoppand_17.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.validation.Valid;

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
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import com.pdh.shoppand_17.model.entity.Members;
import com.pdh.shoppand_17.model.entity.Shares;
import com.pdh.shoppand_17.service.GroupService;
import com.pdh.shoppand_17.service.MemberService;
import com.pdh.shoppand_17.service.ShareService;

@Controller
@SessionAttributes("userInfo")
public class MemberController {
		
	@Autowired
	private MemberService memberService;
	@Autowired
	private GroupService groupService;
	@Autowired
	private ShareService shareService;
	
	@RequestMapping(value = "/register.do" , method = RequestMethod.GET)
	public ModelAndView registerForm(){
		return new ModelAndView("register","member", new Members());
	}
	
	@RequestMapping(value = "/register.do" , method = RequestMethod.POST)
	public String addMember(@Valid Members member, BindingResult result, Model model){
		System.out.println(member);
		/*if(result.hasErrors()){
			return "register";
		}*/
		try{
			memberService.addMember(member);
		}catch(Exception e){
			e.printStackTrace();
		}
		return "login";
	}
	
	@ResponseBody
	@RequestMapping(value="/profileUp.do", method = RequestMethod.POST)
	public String upload(MultipartRequest multipartRequest){
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		MultipartFile file = multipartRequest.getFile("profileImg");
		String fileName = file.getOriginalFilename() + dateFormat.format(calendar.getTime());//첨부된파일이름
		//long size =file.getSize();//파일용량
		
		System.out.println(fileName+"!");
		try{
			//폴더에 파일 저장
			file.transferTo(new File("C:/Users/Administrator/git/shoppand_17/shoppand_17/WebContent/images/profileImgs/" + fileName));
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return fileName;
	}
	
	@RequestMapping(value = "/loginForm.do")
	public String loginForm(){
		return "login";
	}
	
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String login(@RequestParam(value="email")String email, @RequestParam(value="password")String password, Model model) {
		String url = "redirect:/groupIndex.do";
		try{
			memberService.login(email, password);
			model.addAttribute("userInfo", memberService.findMember(email));
		}catch(Exception e){
			System.out.println("err");
			url = "login";
		}
		return url;
	}
	
	@RequestMapping(value = "/logout.do")
	public String logOut(SessionStatus sessionstatus){
		sessionstatus.setComplete();
		return "redirect:/index.jsp";
	}
	
	@RequestMapping(value = "/aboutUser.do")
	public String aboutUser(@ModelAttribute("userInfo")Members mem, String user, Model model){
		model.addAttribute("user", memberService.findMember(user));
		if(mem.getEmail().equals(user)){
			model.addAttribute("shares", shareService.getMemberShare(user));
		}else{
			model.addAttribute("shares", shareService.getMemberAuthShare(user));
		}
		return "aboutUser";
	}
		
}
