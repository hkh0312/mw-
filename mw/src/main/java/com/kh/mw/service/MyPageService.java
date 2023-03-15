package com.kh.mw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mw.dao.MyPageDao;
import com.kh.mw.vo.QnaVo;
import com.kh.mw.vo.UserVo;

@Service
public class MyPageService {
	
	@Autowired
	private MyPageDao myPageDao;
	
	public List<QnaVo> findQna(String userid) {
		return myPageDao.findQna(userid);
	}
	
	public String confirmPw(String userid) {
		return myPageDao.confirmPw(userid);
	}
	
	public boolean modify(UserVo userVo) {
		return myPageDao.modify(userVo);
	}
	
	public boolean withdraw(String userid) {
		return myPageDao.withdraw(userid);
	}
	
}
