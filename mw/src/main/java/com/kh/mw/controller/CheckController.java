package com.kh.mw.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.mw.service.CheckService;
import com.kh.mw.vo.CheckVo;

@Controller
@RequestMapping("/check/*")
public class CheckController {
	
	@Autowired
	private CheckService checkService;
	
	//체크리스트 폼 기능
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String registerForm() {
		return "check/register";
	}


	@RequestMapping(value="/register",method=RequestMethod.POST)
	public String registerCheck(CheckVo checkVo, HttpSession session, RedirectAttributes rttr) {
//		UserVo userVo = (UserVo)session.getAttribute("loginInfo");
//		String userid=UserVo.getUserid();
//		System.out.println("checkController,checkVo"+checkVo);
		boolean result=checkService.insertCheck(checkVo);
		rttr.addFlashAttribute("result",result);
		return "redirect:/check/checklist";
	}
	
	//체크리스트 가져오기
	@RequestMapping(value="/checklist",method=RequestMethod.GET)
	public String listCheck(CheckVo checkVo,Model model) {
		List<CheckVo> list=checkService.listCheck(checkVo);
		model.addAttribute("list",list);
		return "check/checklist";
	}
	
}
