package com.kh.mw.controller;


import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.mw.service.UserService;
import com.kh.mw.vo.UserVo;

@Controller
@RequestMapping("/user/*")
public class UserController {

	@Autowired
	private UserService userService;
	
	// 로그인 페이지
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login() {
		return "user/login";
	}
	
	// 로그인 실행
	@RequestMapping(value="/login", method = RequestMethod.POST)
	public String login(String userid, String userpw, String saveId, RedirectAttributes rttr, HttpSession session, HttpServletResponse response) {
		UserVo userVo = userService.login(userid, userpw);
		String page = "";
		if(userVo == null) {
			rttr.addFlashAttribute("login_result", "fail");
			page = "redirect:/user/login";
		}else {
			Cookie cookie = new Cookie("userid", userid);
			if(saveId != null) {
				cookie.setMaxAge(60 * 60 * 24 * 7);	// 1주일
			} else {
				cookie.setMaxAge(0);
			}
			response.addCookie(cookie);
			
			rttr.addFlashAttribute("login_result", "success");
			session.setAttribute("loginInfo", userVo);
			String targetLocation = (String)session.getAttribute("targetLocation");
			session.removeAttribute("targetLocation");
			if(targetLocation != null && !targetLocation.equals("")) {
				page = "redirect:" + targetLocation;
			} else {
				page = "redirect:/main/home_form";
			}
		}
		return page;
	}
	
	//로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/user/login";
	}
	
	// 회원가입 페이지
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public String register() {
		return "user/register_form";
	}
	
	// 회원가입 실행
	@RequestMapping(value="/register", method = RequestMethod.POST)
	public String register(UserVo userVo, RedirectAttributes rttr) {
		System.out.println(userVo);
		boolean result = userService.userRegister(userVo);
		String page="";
		if(result) {
			rttr.addFlashAttribute("register_result", "success");
			page = "redirect:/user/login";
		}else {
			rttr.addFlashAttribute("register_result", "fail");
			page = "redirect:/user/register_form";
		}
		return page;
	}
	
	// 아이디 중복 체크
	@ResponseBody
	@RequestMapping(value="/checkDupId", method=RequestMethod.POST)
	public String checkDupId(String userid) {
		System.out.println(userid);
		int count = userService.checkDupId(userid);
		System.out.println(count);
		return String.valueOf(count);
	}
	
	// 아이디 찾기
	@RequestMapping(value="/findId", method=RequestMethod.GET)
	public String findId() {
		return "user/find_id";
	}
	
	// 아이디 정보 확인
	@ResponseBody
	@RequestMapping(value="/findId", method=RequestMethod.POST)
	public String findId(String username, String email) {
		System.out.println(username + email);
		UserVo userVo = userService.findId(username, email);
		String result = "";
		if(userVo != null) {
			result = userVo.getUserid();
		} else {
			result = null;
		}
		System.out.println(result);
		return result;
	}

	// 비밀번호 찾기
	@RequestMapping(value="/findPw", method=RequestMethod.GET)
	public String findPw() {
		return "user/find_pw";
	}
	
	// 비밀번호 찾기 - 비밀번호 정보 확인
	@ResponseBody
	@RequestMapping(value="/findPw", method=RequestMethod.POST)
	public String findPw(String userid, String username, String email){
		String userpw = userService.findPw(userid, username, email);
		String result = "";
		if(userpw != null) {
			result = userpw;
		}else {
			result = null;
		}
		return result;
	}
	
	
}
