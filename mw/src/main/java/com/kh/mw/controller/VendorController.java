package com.kh.mw.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.mw.service.VendorService;
import com.kh.mw.vo.PagingVo;
import com.kh.mw.vo.VendorVo;

@Controller
@RequestMapping("/vendor/*")
public class VendorController {
	
	@Autowired
	private VendorService vendorService;
	
	
	//고객화면 - 목록 화면 띄우기
	@RequestMapping(value="list", method=RequestMethod.GET)
	public String listVendor(VendorVo vendorVo,Model model,PagingVo pagingVo) {
		
		//페이징처리하기
		pagingVo.setPagingInfo(pagingVo.getPage(), pagingVo.getPerPage(), vendorService.getCount(pagingVo, vendorVo));
		
		List<VendorVo> list = vendorService.listVendor(vendorVo, pagingVo);
		model.addAttribute("list",list);
		model.addAttribute("pagingVo",pagingVo);
		
//		System.out.println("VendorController,list"+list);
//		System.out.println("VendorController,pagingVo"+pagingVo);
		
		return "vendor/list";
	}
	

	
	
}
