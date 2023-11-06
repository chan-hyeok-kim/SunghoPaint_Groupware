package com.ham.len.commons;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter
@ToString
public class Pager{

	// 시작 인덱스 번호
	private Long startRow;

	// 가져올 갯수
	private Long lastRow;

	// 검색할 컬럼명
	private String kind;

	// 검색어
	private String search;

	private Long page;
	private Long totalPage;
	private Long perBlock;
	private Long totalBlock;

	// 시작번호
	private Long startNum;
	// 끝번호
	private Long lastNum;
	// 이전블럭활성화
	private boolean pre; // false면 1번블럭, true면 1번 아님
	// 다음블럭 활성화
	private boolean next; // false면 마지막블럭, true 마지막 블럭 아님

	private Long perPage;
	
	public void makeRowNum() {
		this.startRow=(this.getPage()-1)*this.getPerPage();
		//this.lastRow=this.page*this.getPerPage();
		//마리아디비는 lastRow 안건드려도됨
	}
	
	public void makePageNum(Long total) {

		// 1. 전체 갯수로 전체 페이지 수 구하기
		this.totalPage = total / this.getLastRow();// 13
		if (total % this.getLastRow() != 0) {
			this.totalPage++;
		}

		// 2. 전체 페이지수로 전체 block 수 구하기
		// 한페이지에 출력할 번호의 갯수
		long perBlock = 10L;

		long totalBlock = this.totalPage / perBlock;
		if (this.totalPage % perBlock != 0) {
			totalBlock++;
		}

		// 3. 현재 page번호로 블럭번호 구하기
		// 현재 블럭 번호
		long curBlock = this.getPage() / perBlock;
		if (this.getPage() % perBlock != 0) {
			curBlock++;
		}

		// 4. 현재 블럭번호의 시작번호와 끝번호 구하기
		// curBlock startNum lastNum
		// 1 1 10
		// 2 11 20
		// 3 21 30
		this.startNum = (curBlock - 1) * perBlock + 1;
		this.lastNum = curBlock * perBlock;

		// 이전 블럭 활성화 여부
		if (curBlock > 1) {
			this.pre = true;
		}

		// 다음 블럭 활성화 여부
		if (curBlock < totalBlock) {
			this.next = true;
		}

		// 현재 블럭이 마지막 블럭일때 lastNum을 totalPage숫자로 대입
//				if(curBlock==totalBlock) {
		if (!this.next) {
			this.lastNum = totalPage;
		}

	}

	public Long getPage() {
		if (this.page == null || this.page < 0) {
			this.page=1L;
		}
		return this.page;
	}
	
	public Long getStartRow() {
		if (this.startRow == null || this.startRow < 0) {
			return 0L;
		}
		return this.startRow;
	}

	public Long getLastRow() {
		if (this.lastRow == null || this.lastRow < 0) {
			return 10L;
		}
		return this.lastRow;
	}

	public String getSearch() {
		if (this.search == null) {
			return "";
		}
		return this.search;
	}

	public Long getPerPage() {
		if (this.perPage == null || this.perPage < 0) {
			return 10L;
		}
		return this.perPage;
	}
}
