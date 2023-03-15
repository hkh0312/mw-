package com.kh.mw.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/main/*")
public class MainController {
	
	@RequestMapping(value = "/home_form", method = RequestMethod.GET)
	public String home() {
		return "main/home_form";
	}
	
	@RequestMapping(value = "/dashboard", method = RequestMethod.GET)
	public String dataInsert() {
		return "main/updateBlog";
	}
	@RequestMapping(value = "/create_form", method = RequestMethod.GET)
	public String createForm() {
		return "main/create_form";
	}
	
	// 메인페이지 - Log in
	@RequestMapping(value = "/login_form", method = RequestMethod.GET)
	public String login() {
		return "/main/login_form";
	}
	
	
}
