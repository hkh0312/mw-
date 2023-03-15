package com.kh.mw.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/preview/*")
public class PreviewController {
	
	// 미리보기 페이지 - Home 
	@RequestMapping(value = "/h_home", method = RequestMethod.GET)
	public String h_home() {
		return "/create/temp_h/h_home";
	}
	
	// 미리보기 페이지 - Ourstory
	@RequestMapping(value = "/h_ourstory", method = RequestMethod.GET)
	public String h_ourstory() {
		return "/create/temp_h/h_ourstory";
	}
	
	// 미리보기 페이지 - Photos
	@RequestMapping(value = "/h_photos", method = RequestMethod.GET)
	public String h_photos() {
		return "/create/temp_h/h_photos";
	}
	
	// 미리보기 페이지 - Q + A
	@RequestMapping(value = "/h_qna", method = RequestMethod.GET)
	public String h_qna() {
		return "/create/temp_h/h_qna";
	}
	
	// 미리보기 페이지 - Travel
	@RequestMapping(value = "/h_travel", method = RequestMethod.GET)
	public String h_travel() {
		return "/create/temp_h/h_travel";
	}
	
	// 미리보기 페이지 - Messages
	@RequestMapping(value = "/h_messages", method = RequestMethod.GET)
	public String h_messages() {
		return "/create/temp_h/h_messages";
	}
		
}
