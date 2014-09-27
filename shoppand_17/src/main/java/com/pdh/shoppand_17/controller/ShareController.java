package com.pdh.shoppand_17.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.pdh.shoppand_17.model.entity.Shares;

@Controller
@SessionAttributes("userInfo")
public class ShareController {
	
	@RequestMapping(value = "/imgUploadForm.do")
	public ModelAndView imgUploadForm(){
		
		return new ModelAndView("imgUploadForm", "share", new Shares());
	}
	
	
}
