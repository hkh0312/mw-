package com.kh.mw.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mw.vo.PagingVo;
import com.kh.mw.vo.VendorVo;

@Repository
public class VendorDao {
	private final String NAMESPACE = "mappers.vendor.";
	
	@Autowired
	private SqlSession sqlSession;
	
	
	//고객화면 - 벤더 목록 가져오기
	public List<VendorVo> listVendor(VendorVo vendorVo, PagingVo pagingVo){
//		System.out.println("VendorDao,vendorVo:"+vendorVo);
//		System.out.println("VendorDao,pagingVo:"+pagingVo);
		String catecode = null;
		if (pagingVo.getV_category() != null && pagingVo.getV_local() != null) {
			int v_category = Integer.parseInt(pagingVo.getV_category()); // 100
			int v_local = Integer.parseInt(pagingVo.getV_local()); // 1
			catecode = String.valueOf(v_category + v_local);
		}
		
		Map<String, Object> map = new HashMap<>();
		map.put("vendorVo", vendorVo);
		map.put("catecode", catecode);
		map.put("pagingVo", pagingVo);
		List<VendorVo> list=sqlSession.selectList(NAMESPACE+"listVendor",map);
//		System.out.println("VendorDao,list"+list);
		return list;
	}
	
	//고객화면 - 벤더 목록 총 갯수
	public int getCount(PagingVo pagingVo, VendorVo vendorVo) {
		
		String catecode = null;
		if (pagingVo.getV_category() != null && pagingVo.getV_local() != null) {
			int v_category = Integer.parseInt(pagingVo.getV_category()); // 100
			int v_local = Integer.parseInt(pagingVo.getV_local()); // 1
			catecode = String.valueOf(v_category + v_local);
		}
			
		Map<String, Object> map=new HashMap<>();
		map.put("pagingVo", pagingVo);
		map.put("vendorVo", vendorVo);
		map.put("catecode", catecode);
		
		int count = sqlSession.selectOne(NAMESPACE+"getCount",map);
		return count;
	}
	
}
