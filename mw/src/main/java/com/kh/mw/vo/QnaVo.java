package com.kh.mw.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class QnaVo {
	private Integer c_no;
	private String c_title;
	private String c_content;
	private Date c_date;
	private String c_id;
	private int re_group;
	private int re_seq;
	private int re_level;
	private int viewcnt;
	private boolean c_secret;
	private String c_password;
}
