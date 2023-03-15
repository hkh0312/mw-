package com.kh.mw.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mw.vo.CheckVo;

@Repository
public class CheckDao {
	
	private final String NAMESPACE = "mappers.check.";
	
	@Autowired
	private SqlSession sqlSession;
	
	
	//체크리스트 등록하기
	public boolean insertCheck(CheckVo checkVo) {
		int count=sqlSession.insert(NAMESPACE+"insertCheck",checkVo);
//		System.out.println("CheckDao,checkVo"+checkVo);
		if(count>0) {
			return true;
		}
		return false;
	}
	
	//체크리스트 가져오기
	public List<CheckVo> listCheck(CheckVo checkVo){
		List<CheckVo> list=sqlSession.selectList(NAMESPACE+"listCheck",checkVo);
		return list;
	}
	
}
