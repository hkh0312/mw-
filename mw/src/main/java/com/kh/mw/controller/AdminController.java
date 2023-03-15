package com.kh.mw.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.mw.service.AdminService;
import com.kh.mw.vo.CategoryVo;
import com.kh.mw.vo.PagingVo;
import com.kh.mw.vo.VendorVo;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	//관리자 등록 화면 띄우기
	@RequestMapping(value="/register", method = RequestMethod.GET)
	public String registerForm() {
		return "admin/register";
	}
	
	//관리자 등록 데이터 넘기기
	@RequestMapping(value="/register", method= RequestMethod.POST)
	public String registerRun(VendorVo vendorVo,RedirectAttributes rttr,CategoryVo categoryVo,Model model) {
//		System.out.println("AdminComtroller,vendorVo:"+vendorVo);
		boolean result=adminService.insertVendor(vendorVo);
		rttr.addFlashAttribute("register_result",result);
//		System.out.println("AdminComtroller,result:"+result);
		
		List<CategoryVo> cateList=adminService.listCategory(categoryVo);
		model.addAttribute("cateList",cateList);
		
		return "redirect:/admin/list";
	}
	
	//관리자 관리 목록 화면 띄우기
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String listVendor(VendorVo vendorVo,Model model,CategoryVo categoryVo,PagingVo pagingVo) {
		//페이징처리하기
		pagingVo.setPagingInfo(pagingVo.getPage(), pagingVo.getPerPage(), adminService.getCount(pagingVo, vendorVo));
		
		List<VendorVo> list = adminService.listVendor(vendorVo,pagingVo);
		List<CategoryVo> cateList=adminService.listCategory(categoryVo);
		model.addAttribute("list",list);
		model.addAttribute("cateList",cateList);
		return "admin/list";
	}
	
	//삭제하기
	@RequestMapping(value="/delete",method=RequestMethod.GET)
	public String deleteVendor(int v_no) {
		adminService.deleteVendor(v_no);
		return "redirect:/admin/list";
	}
	
	
}	
	
