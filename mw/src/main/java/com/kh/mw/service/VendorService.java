package com.kh.mw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mw.dao.VendorDao;
import com.kh.mw.vo.PagingVo;
import com.kh.mw.vo.VendorVo;;

@Service
public class VendorService {
	
	@Autowired
	private VendorDao vendorDao;
	
	
	//고객 화면 -  목록가져오기
	public List<VendorVo> listVendor(VendorVo vendorVo, PagingVo pagingVo){
		List<VendorVo> list=vendorDao.listVendor(vendorVo, pagingVo);
//		System.out.println("vendorService,vendorVo:"+vendorVo);
//		System.out.println("vendorService,pagingVo:"+pagingVo);
		return list;
	}
	
	
	// 고객 화면 - 목록 갯수
	public int getCount(PagingVo pagingVo,VendorVo vendorVo) {
		return vendorDao.getCount(pagingVo, vendorVo);
	}
}
