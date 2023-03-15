package com.kh.mw.dao;

import java.util.HashMap;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mw.vo.UserVo;

@Repository
public class UserDao {
	private final String NAMESPACE = "mappers.user.";
	
	@Autowired
	private SqlSession sqlSession;
	
	// 회원 등록
	public boolean userRegister(UserVo userVo) {
		int count = sqlSession.insert(NAMESPACE+"userRegister", userVo);
		if(count > 0) {
			return true;
		}
		return false;
	}
	
	// 아이디 중복 체크
	public int checkDupId(String userid) {
		return sqlSession.selectOne(NAMESPACE+"checkDupId", userid);
	}
	
	// 로그인
	public UserVo login(String userid, String userpw) {
		Map<String, String> map = new HashMap<>();
		map.put("userid", userid);
		map.put("userpw", userpw);
		UserVo userVo = sqlSession.selectOne(NAMESPACE+"login", map);
		return userVo;
	}
	
	// 아이디 찾기
	public UserVo findId(String username, String email) {
		Map<String, String> map = new HashMap<>();
		map.put("username", username);
		map.put("email", email);
		return sqlSession.selectOne(NAMESPACE+"findId", map);
	}
	
	// 비밀번호 찾기
	public String findPw(String userid, String username, String email) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("userid", userid);
		map.put("username", username);
		map.put("email", email);
		return sqlSession.selectOne(NAMESPACE+"findPw", map);
	}
	
	
	public int updatepjnum(int prevPjnum, String userid) {
		int pjnum = prevPjnum + 1;
		Map<String,Object> map = new HashMap<>();
		map.put("pjnum", pjnum);
		map.put("userid", userid);
		return sqlSession.update(NAMESPACE + "updatepjnum", map);
	}
	
	public String findid(String url) {
		UserVo userVo = sqlSession.selectOne(NAMESPACE + "findid", url);
		String clientId = userVo.getUserid();
		return clientId;
	}
	
	
	
}
