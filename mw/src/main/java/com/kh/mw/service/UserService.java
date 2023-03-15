package com.kh.mw.service;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mw.dao.UserDao;
import com.kh.mw.vo.UserVo;

@Service
public class UserService {
	
	@Autowired
	private UserDao userDao;
	
	public boolean userRegister(UserVo userVo) {
		return userDao.userRegister(userVo);
	}
	
	public int checkDupId(String userid) {
		return userDao.checkDupId(userid);
	}
	
	public UserVo login(String userid, String userpw) {
		return userDao.login(userid, userpw);
	}
	
	public UserVo findId(String username, String email) {
		return userDao.findId(username, email);
	}
	
	public String findPw(String userid, String username, String email) {
		return userDao.findPw(userid, username, email);
	}
	
	

	public int updatepjnum(int prevPjnum, String userid) {
		return userDao.updatepjnum(prevPjnum, userid);		
	}
	public String findid(String url) {
		return userDao.findid(url);
	}

}
