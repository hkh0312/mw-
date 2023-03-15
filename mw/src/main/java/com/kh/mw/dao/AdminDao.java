package com.kh.mw.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mw.vo.CategoryVo;
import com.kh.mw.vo.PagingVo;
import com.kh.mw.vo.VendorVo;

@Repository
public class AdminDao {
private final String NAMESPACE = "mappers.admin.";
	
	@Autowired
	private SqlSession sqlSession;
	
	
	//벤더 등록하기
	public boolean insertVendor(VendorVo vendorVo) {
		int count=sqlSession.insert( NAMESPACE + "insertVendor",vendorVo);
//		System.out.println("AdminDao,vendorVo:"+vendorVo);
//		System.out.println(count);
		if(count > 0) {
			return true;
		}
		return false;
	}
	
	//벤더 관리자 - 벤더 목록 가져오기
	public List<VendorVo> listVendor(VendorVo vendorVo,PagingVo pagingVo){
//		System.out.println("AdminDao,vendorVo:"+vendorVo);
		
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
//		System.out.println("AdminDao,list"+list);
		return list;
	}
	
	//벤더 관리자 - 벤더 카테고리가져오기
	public List<CategoryVo> listCategory(CategoryVo categoryVo){
//		System.out.println("AdminDao,categoryVo:"+categoryVo);
		
		List<CategoryVo> cateList = sqlSession.selectList(NAMESPACE+"listCategory",categoryVo);
//		System.out.println("AdminDao,cateList:"+cateList);
		return cateList;
	}
	
	//벤더 삭제하기
	public boolean deleteVendor(int vno) {
		int count=sqlSession.delete(NAMESPACE+"deleteVendor",vno);
		if(count>0) {
			return true;
		}
		return false;
	}
	
	//총 갯수
	public int getCount(PagingVo pagingVo,VendorVo vendorVo) {
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
