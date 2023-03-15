package com.kh.mw.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.mw.service.MyPageService;
import com.kh.mw.vo.QnaVo;
import com.kh.mw.vo.UserVo;

@Controller
@RequestMapping("/mypage/*")
public class MyPageController {
	
	@Autowired
	private MyPageService myPageService;
	
	// 마이페이지 메인 - 내가 쓸 글
	@RequestMapping(value="/mypageMain", method = RequestMethod.GET)
	public String mypageMain(HttpSession session, Model model) {
		UserVo userVo = (UserVo)session.getAttribute("loginInfo");
		String userid = userVo.getUserid();
		List<QnaVo> qnaVo = myPageService.findQna(userid);
		model.addAttribute("qnaVo", qnaVo);
		return "mypage/mypageMain";
	}
	
	// 회원정보수정 비밀번호 폼
	@RequestMapping(value="/passwordCheck", method = RequestMethod.GET)
	public String passwordCheck(HttpSession session, Model model) {
		UserVo userVo = (UserVo)session.getAttribute("loginInfo");
		model.addAttribute("userVo", userVo);
		return "mypage/passwordCheck";
	}
	
	// 회원정보수정 - 비밀번호 확인
	@RequestMapping(value="/confirmPw", method = RequestMethod.POST)
	@ResponseBody
	public String checkpw(String userpw, HttpSession session) {
		UserVo userVo = (UserVo)session.getAttribute("loginInfo");
		String userid = userVo.getUserid();
		String checkpw = myPageService.confirmPw(userid);
		String result = "true";
		if(!userpw.equals(checkpw)) {
			result = "false";
		}
		return result;
	}
	
	// 회원정보수정 폼
	@RequestMapping(value="/mypageModify", method = RequestMethod.GET)
	public String mypageModify(HttpSession session, Model model) {
		UserVo userVo = (UserVo)session.getAttribute("loginInfo");
		model.addAttribute("userVo", userVo);
		return "mypage/mypageModify";
	}
	
	// 회원정보수정 실행
	@RequestMapping(value="/modify", method = RequestMethod.POST)
	public String modify(UserVo userVo, RedirectAttributes rttr, HttpSession session) {
		boolean result = myPageService.modify(userVo);
		rttr.addFlashAttribute("userModify_result", result);
		session.setAttribute("loginInfo", userVo);
		return "redirect:/mypage/mypageModify";
	}
	
	// 회원탈퇴 폼
	@RequestMapping(value="/mypageWithdraw", method = RequestMethod.GET)
	public String mypageWithdraw() {
		return "mypage/mypageWithdraw";
	}
	
	// 회원탈퇴
	@RequestMapping(value="/withdraw", method = RequestMethod.GET)
	public String withdraw(HttpSession session, RedirectAttributes rttr) {
		UserVo userVo = (UserVo)session.getAttribute("loginInfo");
		String userid = userVo.getUserid();
		boolean result = myPageService.withdraw(userid);
		rttr.addFlashAttribute("withdraw_result", result);
		String page="redirect:/mypage/mypageWithdraw";
		if(result) {
			session.invalidate();
			page = "redirect:/user/login";
		}
		return page;
	}

}
