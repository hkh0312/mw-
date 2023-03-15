package com.kh.mw.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/create/*")
public class HCreateController {
	
	// 페이지 만들기 - 템플릿 선택 페이지
	@RequestMapping(value = "/choose_temp", method = RequestMethod.GET)
	public String chooseTemp() {
		return "/create/choose_temp";
	}
	
	// 템플릿 선택 페이지 - 템플릿 미리보기 페이지(tempY)
	@RequestMapping(value = "/preview_tempY", method = RequestMethod.GET)
	public String preview_tempY() {
		return null;
	}
	
	// 템플릿 선택 페이지 - 템플릿 미리보기 페이지(tempH)
	@RequestMapping(value = "/preview_tempH", method = RequestMethod.GET)
	public String preview_tempH() {
		return "redirect:/preview/h_home";
	}
}
