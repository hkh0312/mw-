
package com.kh.mw.vo;

import lombok.Data;

@Data
public class PagingVo {
	private int page = 1; //현재 페이지
	private int startRow = 1; //출력 시작할 번호
	private int endRow = 10; //출력 끝낼 번호
	private int startPage = 1; //시작페이지 -> 버튼 만들때 필요?
	private int endPage = 10; //마지막페이지 -> 버튼 만들때 필요?
	private int totalPage; // 혹시 리스트수가 커지면 다음 버튼 클릭했을때의 최종 페이지 
	private int count; //총 리스트(데이터) 수
	private int perPage = 12; //한 페이지당 출력할 리스트 수
	private String orderby = "v_no";
	
	private final int BLOCK_COUNT = 12; //상수 지정
	
	private String v_category;
	private String v_local;
	
	public void setPagingInfo(int page, int perPage, int count) {
		this.page = page;
		this.perPage = perPage;
		this.count = count;
		this.endRow = page * perPage;
		this.startRow = this.endRow - (perPage -1);
		this.startPage = ((page - 1) / BLOCK_COUNT) * BLOCK_COUNT +1;
		this.endPage = this.startPage + (BLOCK_COUNT -1);
		
		this.totalPage = (int)Math.ceil((float)count/perPage);
		if(this.endPage > this.totalPage) {
			this.endPage = this.totalPage;
		}
	}
	
}
