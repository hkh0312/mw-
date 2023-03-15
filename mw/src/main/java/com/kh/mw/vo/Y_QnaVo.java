package com.kh.mw.vo;

import lombok.Data;

@Data
public class Y_QnaVo {
	private String clientId= "lee";
	private int qno;
	private String[] arr_ques;
	private String[] arr_answers;
	private String[] update_ques;
	private String[] update_answers;
	private String ques;
	private String answer;
	private int likecount;
}
