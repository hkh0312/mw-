package com.kh.mw.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mw.vo.Y_AskVo;
import com.kh.mw.vo.Y_HomeVo;
import com.kh.mw.vo.Y_MessageVo;
import com.kh.mw.vo.Y_PhotoVo;
import com.kh.mw.vo.Y_QnaVo;
import com.kh.mw.vo.Y_StoryVo;
import com.kh.mw.vo.Y_TravelVo;

@Repository
public class Y_CreateDao {
	String clientId = "lee";
	private final String NAMESPACE_H = "mappers.home.";
	private final String NAMESPACE_S = "mappers.story.";
	private final String NAMESPACE_Q = "mappers.qna.";
	private final String NAMESPACE_T = "mappers.travel.";
	private final String NAMESPACE_P = "mappers.photo.";
	private final String NAMESPACE_M = "mappers.message.";
	private final String NAMESPACE_A = "mappers.ask.";

	@Autowired
	private SqlSession sqlSession;

	public boolean insert(Y_HomeVo homeVo, Y_StoryVo storyVo, Y_TravelVo travelVo, Y_PhotoVo photoVo, int prevPjnum) {
		if (prevPjnum == 0) {
			int count_h = sqlSession.insert(NAMESPACE_H + "insert", homeVo);
			int count_s = sqlSession.insert(NAMESPACE_S + "insert", storyVo);
			int count_t = sqlSession.insert(NAMESPACE_T + "insert", travelVo);
			int count_p = sqlSession.insert(NAMESPACE_P + "insert", photoVo);
//			System.out.println("count_h: " + count_h);
//			System.out.println("count_s: " + count_s);
//			System.out.println("count_t: " + count_t);
//			System.out.println("count_p: " + count_p);
			if (count_h > 0 && count_s > 0 && count_t > 0 && count_p > 0) {
				return true;
			}
		}
		if (prevPjnum == 1) {
//			System.out.println("createDao update");
//			System.out.println("dao homeVo: " + homeVo);
			int count_h = sqlSession.update(NAMESPACE_H + "update", homeVo);
			int count_s = sqlSession.update(NAMESPACE_S + "update", storyVo);
			int count_t = sqlSession.update(NAMESPACE_T + "update", travelVo);
			int count_p = sqlSession.update(NAMESPACE_P + "update", photoVo);
//			System.out.println("count_h: " + count_h);
//			System.out.println("count_s: " + count_s);
//			System.out.println("count_t: " + count_t);
//			System.out.println("count_p: " + count_p);
			if (count_h > 0 && count_s > 0 && count_t > 0 && count_p > 0) {
				return true;
			}
		}
		return false;
	}

	public boolean insertQnA(Y_QnaVo qnaVo) {
//		System.out.println("qnaVo dao: " + qnaVo);
		int count = sqlSession.insert(NAMESPACE_Q + "insert", qnaVo);
		if (count > 0) {
			return true;
		}

		return false;
	}

	public boolean updateQna(Y_QnaVo qnaVo) {
		int count = sqlSession.update(NAMESPACE_Q + "update", qnaVo);
//		System.out.println("qna update count: " + count);
		if (count > 0) {
			return true;
		}
		return false;
	}

	public boolean delQna(int qno, String clientId) {
		Map<String, Object> map = new HashMap<>();
		map.put("qno", qno);
		map.put("clientId", clientId);
		int count = sqlSession.delete(NAMESPACE_Q + "delQna", map);
//		System.out.println("delQna count: " + count);
		if (count > 0) {
			return true;
		}
		return false;
	}

	public Y_HomeVo searchHome(String clientId) {
		Y_HomeVo homeVo = sqlSession.selectOne(NAMESPACE_H + "search", clientId);
//		System.out.println("dao homeVo: " + homeVo);
		return homeVo;
	}

	public Y_StoryVo searchStory(String clientId) {
		Y_StoryVo storyVo = sqlSession.selectOne(NAMESPACE_S + "search", clientId);
//		System.out.println("dao storyVo: " + storyVo);
		return storyVo;
	}

	public List<Y_QnaVo> searchQna(String clientId) {

		List<Y_QnaVo> qnaVo = sqlSession.selectList(NAMESPACE_Q + "search", clientId);
//		System.out.println("dao QnaVo: " + qnaVo);
		return qnaVo;
	}

	public Y_TravelVo searchTravel(String clientId) {
		Y_TravelVo travelVo = sqlSession.selectOne(NAMESPACE_T + "search", clientId);
//		System.out.println("dao TravelVo: " + travelVo);
		return travelVo;
	}

	public Y_PhotoVo searchPhoto(String clientId) {
		Y_PhotoVo photoVo = sqlSession.selectOne(NAMESPACE_P + "search", clientId);
//		System.out.println("dao photoVo: " + photoVo);
		return photoVo;
	}

	public int countQna(String clientId) {
		int count = sqlSession.selectOne(NAMESPACE_Q + "count", clientId);
//		System.out.println("dao count :" + count);
		return count;
	}

	// 하객 쪽지입력
	public boolean insertMes(Y_MessageVo mesVo) {
		int count = sqlSession.insert(NAMESPACE_M + "insert", mesVo);
//		System.out.println("dao insertMes" + count);
		if (count > 0) {
			return true;
		}
		return false;
	}

	public List<Y_MessageVo> getMes(String clientId) {
		return sqlSession.selectList(NAMESPACE_M + "search", clientId);
	}

	// 하객 질문입력
	public boolean insertQues(Y_AskVo quesVo) {
		int count = sqlSession.insert(NAMESPACE_A + "insert", quesVo);
		if (count > 0) {
			return true;
		}
		return false;
	}

	// 하트카운트
	public void updateLikecnt(int qno, int count) {
//		System.out.println("updateLikecnt qno: " + String.valueOf(qno));
//		System.out.println("updateLikecnt count: " + String.valueOf(count));
		Map<String, Integer> map = new HashMap<>();
		map.put("qno", qno);
		map.put("count", count);
		int result = sqlSession.update(NAMESPACE_Q + "updateLikeCnt", map);
//		System.out.println("result: " + result);
	}

	public boolean delete(String clientId) {
		int count_q = sqlSession.delete(NAMESPACE_Q + "delete", clientId);
		int count_h = sqlSession.delete(NAMESPACE_H + "delete", clientId);
		int count_s = sqlSession.delete(NAMESPACE_S + "delete", clientId);
		int count_t = sqlSession.delete(NAMESPACE_T + "delete", clientId);
		int count_p = sqlSession.delete(NAMESPACE_P + "delete", clientId);
//		System.out.println("count_h: " + count_h);
//		System.out.println("count_s: " + count_s);
//		System.out.println("count_t: " + count_t);
//		System.out.println("count_p: " + count_p);
//		System.out.println("count_q: " + count_q);
		if (count_h > 0 && count_s > 0 && count_t > 0 && count_p > 0 && count_q > 0) {
			return true;
		}
		return false;
	}
}
