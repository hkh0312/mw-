package com.kh.mw.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Y_HomeVo {
	private String clientId= "lee";
	private String brideNm;
	private String groomNm;
	private String wedDate;
	private String wedTime;
	private String wed_addr;
	private String announce;
	private String coverPic;
}
