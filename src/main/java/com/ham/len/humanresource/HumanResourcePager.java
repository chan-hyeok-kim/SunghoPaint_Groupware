package com.ham.len.humanresource;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class HumanResourcePager {
	private String startDate = "";
	private String endDate = "";
	private String department = "";
	private String kind = "";
	private String keyword = "";
	
	private Long startRow;
	// private Long lastRow;
	private Long page = 1L;
	private Long perPage = 10L; // 페이지당 게시글 개수
	private Long totalPage;
	private Long startNum;
	private Long lastNum;
	private boolean isPre;
	private boolean isNext;
	
	public void makePageNum(Long total) {
		totalPage = total / getPerPage();
		if(total % perPage > 0) {
			totalPage += 1;
		}
		
		/*
			1블럭 : 1 | 2 | 3 | 4 | 5
			2블럭 : 6 | 7 | 8 | 9 | 10
			3블럭 : 11 | 12 | 13 | 14 | 15
		*/
		long perBlock = 5; // 블럭당 페이지 번호 개수
		long totalBlock = totalPage / perBlock;
		if(totalPage % perBlock > 0) {
			totalBlock += 1;
		}
		
		long curBlock = getPage() / perBlock;
		if(getPage() % perBlock > 0) {
			curBlock += 1;
		}
		
		startNum = (curBlock - 1) * perBlock + 1;
		lastNum = curBlock * perBlock;
		
		if(curBlock > 1) {
			isPre = true;
		}
		
		if(curBlock < totalBlock) {
			isNext = true;
		}
		
		if(!isNext) {
			lastNum = totalPage;
		}
	}
	
	public void makeRowNum() {
		startRow = (getPage() - 1) * getPerPage();
		// lastRow = getPage() * getPerPage();
	}
}