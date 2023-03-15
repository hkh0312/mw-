package com.kh.mw.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.mw.dao.Y_CreateDao;
import com.kh.mw.dao.Y_LikeDao;
import com.kh.mw.vo.Y_LikeVo;

@Service
public class Y_LikeService {
	@Autowired
	Y_LikeDao y_likeDao;
	@Autowired
	Y_CreateDao y_createDao;

	@Transactional
	public boolean sendLike(Y_LikeVo likeVo) {
		y_createDao.updateLikecnt(likeVo.getQno(), 1);
//		System.out.println("like service:" + likeVo);
		return y_likeDao.sendLike(likeVo);
	}

	public int getLikeCount(int qno) {
		return y_likeDao.getLikeCount(qno);
	}

	public int isLike(Y_LikeVo likeVo) {
		return y_likeDao.isLike(likeVo);
	}
	
	public boolean delLike(Y_LikeVo likeVo) {
		return y_likeDao.delLike(likeVo);		
	}
	public int likecheck(String clientId) {
		return y_likeDao.likecheck(clientId);
	}
	
	public boolean delete(String clientId) {
		return y_likeDao.delete(clientId);		
	}


}
