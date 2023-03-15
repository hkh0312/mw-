package com.kh.mw.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mw.vo.Y_LikeVo;

@Repository
public class Y_LikeDao {
	private final String NAMESPACE_L = "mappers.like.";
	@Autowired
	private SqlSession sqlsession;

	public boolean sendLike(Y_LikeVo likeVo) {
//		System.out.println("like Y_LikeDao:" + likeVo);
		int count = sqlsession.insert(NAMESPACE_L + "sendLike", likeVo);
//		System.out.println("like dao: " + count);
		if (count > 0) {
			return true;
		}
		return false;
	}

	public int getLikeCount(int qno) {
		return sqlsession.selectOne(NAMESPACE_L + "getLikeCount", qno);
	}

	public int isLike(Y_LikeVo likeVo) {
//		System.out.println("dao isLike likeVo: " + likeVo);
		int likeCount = sqlsession.selectOne(NAMESPACE_L + "isLike", likeVo);
//		System.out.println("dao likeCOunt: " + likeCount);
		return likeCount;
	}

	public boolean delLike(Y_LikeVo likeVo) {
		int count = sqlsession.delete(NAMESPACE_L + "delLike", likeVo);
//		System.out.println("delLike count: " + count);
		if (count > 0) {
			return true;
		}
		return false;
	}
	public int likecheck(String clientId) {
		System.out.println("dao checklike: " + clientId);
		int likeCount = sqlsession.selectOne(NAMESPACE_L + "likecheck", clientId);
		System.out.println("dao likecheck count: " + likeCount);
		return likeCount;
	}

	
	public boolean delete(String clientId) {
		int count = sqlsession.delete(NAMESPACE_L + "delete", clientId);
		System.out.println("delete count: " + count);
		if (count > 0) {
			return true;
		}
		return false;
	}

}
