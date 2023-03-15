package com.kh.mw.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mw.dao.CheckDao;
import com.kh.mw.vo.CheckVo;

@Service
public class CheckService {

	@Autowired
	private CheckDao checkDao;
	
	//체크리스트 등록하기
	public boolean insertCheck(CheckVo checkVo) {
//		System.out.println("CheckService,checkVo"+checkVo);
		return checkDao.insertCheck(checkVo);
	}
	
	//체크리스트 목록 가져오기
	public List<CheckVo> listCheck(CheckVo checkVo){
		return checkDao.listCheck(checkVo);
	}
}
