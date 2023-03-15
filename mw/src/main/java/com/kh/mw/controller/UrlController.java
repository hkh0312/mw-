package com.kh.mw.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.mw.service.HService;
import com.kh.mw.service.UrlService;
import com.kh.mw.vo.H_HomeScheduleVo;
import com.kh.mw.vo.H_HomeVo;
import com.kh.mw.vo.H_OurstoryVo;
import com.kh.mw.vo.H_PhotosDataVo;
import com.kh.mw.vo.H_PhotosVo;
import com.kh.mw.vo.H_QnaDataVo;
import com.kh.mw.vo.H_QnaVo;
import com.kh.mw.vo.H_TempPhotosVo;
import com.kh.mw.vo.H_TravelVo;
import com.kh.mw.vo.UserVo;

@Controller
@RequestMapping("/url/*")
public class UrlController {
	
	@Autowired
	private UrlService urlService;
	
	@Autowired
	private HService hService;
	
	// url/*
	@RequestMapping(value = "/*", method = RequestMethod.GET)
	public String url() {
//		System.out.println("url/* 입력");
		return null;
	}
	
	// 유저 url 홈페이지 - Home 
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String url_home(HttpSession session, Model model) {
//		System.out.println("*Url컨트롤러* url-home입니다.");
		String url_keyword = (String)session.getAttribute("url_keyword");
//		System.out.println("*Url컨트롤러* url_keyword: "+url_keyword);
		UserVo userVo = urlService.getUserVo_byUrl(url_keyword);
//		System.out.println("*Url컨트롤러* userVo: "+userVo);
		if (userVo != null) {
			if (userVo.getPjnum() != 0) {
				H_TempPhotosVo tpVo = hService.getTpVo(userVo.getUserid());
				H_HomeVo hVo = hService.getHvo(userVo.getUserid());
				List<H_HomeScheduleVo> list_hsVo = hService.getList_hsVo(hVo.getH_no());
				
				model.addAttribute("userVo", userVo);
				model.addAttribute("tpVo", tpVo);
				model.addAttribute("hVo", hVo);
				model.addAttribute("list_hsVo", list_hsVo);
			}
			return "/create/temp_h/h_home";
		} else {
			String message = "존재하지 않는 url입니다.";
			session.setAttribute("message", message);
			return "redirect:/preview/h_home";
		}
	}
	
	// 유저 url 홈페이지 - Ourstory 
	@RequestMapping(value = "*/ourstory", method = RequestMethod.GET)
	public String url_ourstory(HttpSession session, Model model) {
//		System.out.println("*Url컨트롤러* url-ourstory입니다.");
		String url_keyword = (String)session.getAttribute("url_keyword");
//		System.out.println("*Url컨트롤러* url_keyword: "+url_keyword);
		UserVo userVo = urlService.getUserVo_byUrl(url_keyword);
		if (userVo != null) {
//			System.out.println("*Url컨트롤러* userVo: "+userVo);
			if (userVo.getPjnum() != 0) {
				H_TempPhotosVo tpVo = hService.getTpVo(userVo.getUserid());
				H_HomeVo hVo = hService.getHvo(userVo.getUserid());
				H_OurstoryVo oVo = hService.getOvo(userVo.getUserid());
				
				model.addAttribute("userVo", userVo);
				model.addAttribute("hVo", hVo);
				model.addAttribute("tpVo", tpVo);
				model.addAttribute("oVo", oVo);
			}
			return "/create/temp_h/h_ourstory";
		} else {
//			System.out.println("존재하지 않는 url입니다.");
			String message = "존재하지 않는 url입니다.";
			session.setAttribute("message", message);
			return "redirect:/preview/h_ourstory";
		}
	}
	
	// 유저 url 홈페이지 - Photos
	@RequestMapping(value = "*/photos", method = RequestMethod.GET)
	public String url_photos(HttpSession session, Model model) {
//		System.out.println("*Url컨트롤러* url-photos입니다.");
		String url_keyword = (String)session.getAttribute("url_keyword");
		UserVo userVo = urlService.getUserVo_byUrl(url_keyword);
		if (userVo != null) {
//			System.out.println("*Url컨트롤러* userVo: "+userVo);
			if (userVo.getPjnum() != 0) {
				H_TempPhotosVo tpVo = hService.getTpVo(userVo.getUserid());
				H_HomeVo hVo = hService.getHvo(userVo.getUserid());
				H_PhotosVo pVo = hService.getPvo(userVo.getUserid());
				List<H_PhotosDataVo> list_pdVo = hService.getList_pdVo(pVo.getP_no());
				
				model.addAttribute("userVo", userVo);
				model.addAttribute("hVo", hVo);
				model.addAttribute("tpVo", tpVo);
				model.addAttribute("pVo", pVo);
				model.addAttribute("list_pdVo", list_pdVo);
			}
			return "/create/temp_h/h_photos";
		} else {
//			System.out.println("존재하지 않는 url입니다.");
			String message = "존재하지 않는 url입니다.";
			session.setAttribute("message", message);
			return "redirect:/preview/h_photos";
		}
	}
	
	// 유저 url 홈페이지 - Q + A
	@RequestMapping(value = "*/qna", method = RequestMethod.GET)
	public String url_qna(HttpSession session, Model model) {
//		System.out.println("*Url컨트롤러* url-qna입니다.");
		String url_keyword = (String)session.getAttribute("url_keyword");
		UserVo userVo = urlService.getUserVo_byUrl(url_keyword);
		if (userVo != null) {
//			System.out.println("*Url컨트롤러* userVo: "+userVo);
			if (userVo.getPjnum() != 0) {
				H_TempPhotosVo tpVo = hService.getTpVo(userVo.getUserid());
				H_HomeVo hVo = hService.getHvo(userVo.getUserid());
				H_QnaVo qVo = hService.getQvo(userVo.getUserid());
				List<H_QnaDataVo> list_qdVo = hService.getList_qdVo(qVo.getQ_no());
				
				model.addAttribute("userVo", userVo);
				model.addAttribute("hVo", hVo);
				model.addAttribute("tpVo", tpVo);
				model.addAttribute("qVo", qVo);
				model.addAttribute("list_qdVo", list_qdVo);
			}
			return "/create/temp_h/h_qna";
		} else {
//			System.out.println("존재하지 않는 url입니다.");
			String message = "존재하지 않는 url입니다.";
			session.setAttribute("message", message);
			return "redirect:/preview/h_qna";
		}
	}
	
	// 유저 url 홈페이지 - Travel
	@RequestMapping(value = "*/travel", method = RequestMethod.GET)
	public String url_travel(HttpSession session, Model model) {
//		System.out.println("*Url컨트롤러* url-travel입니다.");
		String url_keyword = (String)session.getAttribute("url_keyword");
		UserVo userVo = urlService.getUserVo_byUrl(url_keyword);
		if (userVo != null) {
//			System.out.println("*Url컨트롤러* userVo: "+userVo);
			if (userVo.getPjnum() != 0) {
				H_TempPhotosVo tpVo = hService.getTpVo(userVo.getUserid());
				H_HomeVo hVo = hService.getHvo(userVo.getUserid());
				H_TravelVo tVo = hService.getTvo(userVo.getUserid());
				
				model.addAttribute("userVo", userVo);
				model.addAttribute("hVo", hVo);
				model.addAttribute("tpVo", tpVo);
				model.addAttribute("tVo", tVo);
			}
			return "/create/temp_h/h_travel";
		} else {
//			System.out.println("존재하지 않는 url입니다.");
			String message = "존재하지 않는 url입니다.";
			session.setAttribute("message", message);
			return "redirect:/preview/h_travel";
		}
	}
	
	// 유저 url 홈페이지 - Messages
	@RequestMapping(value = "*/messages", method = RequestMethod.GET)
	public String url_messages(HttpSession session, Model model) {
//		System.out.println("*Url컨트롤러* url-messages입니다.");
		String url_keyword = (String)session.getAttribute("url_keyword");
		UserVo userVo = urlService.getUserVo_byUrl(url_keyword);
		if (userVo != null) {
//			System.out.println("*Url컨트롤러* userVo: "+userVo);
			if (userVo.getPjnum() != 0) {
				H_TempPhotosVo tpVo = hService.getTpVo(userVo.getUserid());
				H_HomeVo hVo = hService.getHvo(userVo.getUserid());
				
				model.addAttribute("userVo", userVo);
				model.addAttribute("hVo", hVo);
				model.addAttribute("tpVo", tpVo);
			}
			return "/create/temp_h/h_messages";
		} else {
//			System.out.println("존재하지 않는 url입니다.");
			String message = "존재하지 않는 url입니다.";
			session.setAttribute("message", message);
			return "redirect:/preview/h_messages";
		}
	}
		
}
