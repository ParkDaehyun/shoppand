package com.pdh.shoppand_17.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import com.pdh.shoppand_17.model.entity.Members;
import com.pdh.shoppand_17.service.GroupService;
import com.pdh.shoppand_17.service.MemberService;
//import com.pdh.shoppand_17.service.MemberService;

@Controller
@SessionAttributes("userInfo")
public class MemberController {
		
	@Autowired
	private MemberService memberService;
	@Autowired
	private GroupService groupService;
	
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
/*	
	@ResponseBody
	@RequestMapping(value="/profileName.do", method = RequestMethod.POST)
	public String fileName(MultipartRequest multipartRequest){
		MultipartFile file = multipartRequest.getFile("profileImg");
		String fileName = file.getOriginalFilename();//첨부된파일이름
		//long size =file.getSize();//파일용량
		System.out.println(fileName);
		try{
			//폴더에 파일 저장
			file.transferTo(new File("C:/dev/workspace/shoppand_17/WebContent/img/" + fileName));
		}catch(Exception e){
			e.printStackTrace();
		}
				
		return fileName;
	}*/
	
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
			file.transferTo(new File("C:/dev/workspace/shoppand_17/WebContent/images/profileImgs/" + fileName));
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return fileName;
	}
	
	@RequestMapping(value = "/loginForm.do")
	public String loginForm(){
		return "login";
	}
	
	@RequestMapping(value = "/login.do")
	public ModelAndView login(@RequestParam(value="email")String email, @RequestParam(value="password")String password, Model model) {
		ModelAndView mv = new ModelAndView();
		String url = "about";
		try{
			memberService.login(email, password);
			model.addAttribute("userInfo", memberService.findMember(email));
			System.out.println(email);
			System.out.println(memberService.findMember(email).getMemberGroups());
			System.out.println(memberService.getGroups(email));
			mv.addObject("grouplist", memberService.getGroups(email));
			mv.addObject("groups",groupService.getAllGroups());
		}catch(Exception e){
			System.out.println("err");
			url = "login";
		}
		mv.setViewName(url);
		return mv;
	}
		
}
