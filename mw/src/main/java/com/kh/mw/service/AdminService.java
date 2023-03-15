package com.kh.mw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mw.dao.AdminDao;
import com.kh.mw.vo.CategoryVo;
import com.kh.mw.vo.PagingVo;
import com.kh.mw.vo.VendorVo;

@Service
public class AdminService {
	
	@Autowired
	private AdminDao adminDao; 
	
	//벤더 등록하기
	public boolean insertVendor(VendorVo vendorVo) {
//		System.out.println("AdminService,vendorVo:"+vendorVo);
		return adminDao.insertVendor(vendorVo);
	}
	
	//벤더 관리자 -  목록가져오기
	public List<VendorVo> listVendor(VendorVo vendorVo,PagingVo pagingVo){
		List<VendorVo> list=adminDao.listVendor(vendorVo,pagingVo);
//		System.out.println("AdminService,vendorVo:"+vendorVo);
		return list;
	}
	
	//벤더 관리자 - 카테고리 가져오기
	public List<CategoryVo> listCategory(CategoryVo categoryVo){
		List<CategoryVo> cateList = adminDao.listCategory(categoryVo);
		return cateList;
	}
	
	//벤더 삭제하기
	public boolean deleteVendor(int vno) {
		return adminDao.deleteVendor(vno);
	}
	
	//글 총 갯수
	public int getCount(PagingVo pagingVo, VendorVo vendorVo) {
		return adminDao.getCount(pagingVo,vendorVo);
	}
}
