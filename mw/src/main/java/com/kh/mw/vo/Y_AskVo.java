package com.kh.mw.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Y_AskVo {
	private String recipient;
	private String question;
	private String sender;
	private Date writedate;
}
