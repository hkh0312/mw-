package com.kh.mw.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mw.vo.QnaVo;
import com.kh.mw.vo.UserVo;

@Repository
public class MyPageDao {
	
	private final String NAMESPACE = "mappers.mypage.";
	
	@Autowired
	private SqlSession sqlSession;

	// 본인이 쓴 글 찾기
	public List<QnaVo> findQna(String userid) {
		return sqlSession.selectList(NAMESPACE+"findQna", userid);
	}
	
	// 마이페이지 - 비밀번호 확인
	public String confirmPw(String userid) {
		return sqlSession.selectOne(NAMESPACE + "confirmPw", userid);
	}
	
	// 회원정보수정
	public boolean modify(UserVo userVo) {
		int count = sqlSession.update(NAMESPACE + "modify", userVo);
		if(count>0) {
			return true;
		}
		return false;
	}
	
	// 회원 탈퇴
	public boolean withdraw(String userid) {
		int count = sqlSession.delete(NAMESPACE + "withdraw", userid);
		if(count > 0) {
			return true;
		}
		return false;
	}
	
}
