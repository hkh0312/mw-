package com.kh.mw.controller;


import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.mw.service.Y_LikeService;
import com.kh.mw.vo.Y_LikeVo;

@Controller
@RequestMapping(value="/like/*")
public class LikeController {
	@Autowired
	 Y_LikeService y_likeService;
	@RequestMapping(value="/chkcookie", method=RequestMethod.GET)
	@ResponseBody
	public String checkCookie(HttpServletRequest request, Model model, HttpServletResponse response) {
		Cookie[] cookies = request.getCookies();
		String cvalue = null;
		for(Cookie aCookie : cookies) {
			String cname = aCookie.getName();
			cvalue = aCookie.getValue();
//			System.out.println("cname: " + cname);
//			System.out.println("cvalue: " + cvalue);
			aCookie.setMaxAge(60*60*24);
			response.addCookie(aCookie);
		}	
		return cvalue;
	}
	
	@RequestMapping(value="/sendLike", method= RequestMethod.POST)
	@ResponseBody
	public boolean sendLike(Y_LikeVo likeVo) {				
//		System.out.println("like controller:" + likeVo);		
		return y_likeService.sendLike(likeVo);
	}
	@RequestMapping(value="/getLikeCount", method= RequestMethod.GET)
	@ResponseBody
	public void getLikeCount(Y_LikeVo likeVo) {
				
	}
	@RequestMapping(value="/isLike", method= RequestMethod.GET)
	@ResponseBody
	public String isLike(Y_LikeVo likeVo) {
		int count  = y_likeService.isLike(likeVo);
		return String.valueOf(count);
	}
}
