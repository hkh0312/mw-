package com.kh.mw.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mw.vo.Y_AskVo;

@Repository
public class Y_GuestDao {
	private final String NAMESPACE_A = "mappers.ask.";

	@Autowired
	private SqlSession sqlSession;
	
	public List<Y_AskVo> searchQues(String clientId){		
		return sqlSession.selectList(NAMESPACE_A + "search",  clientId);
	}
	public int unreadQues(String recipient) {
//		System.out.println("guestDao: " + recipient);
		int count = sqlSession.selectOne(NAMESPACE_A + "unreadQues", recipient);
//		System.out.println("dao ques " + count);
		return count;
	}
}
