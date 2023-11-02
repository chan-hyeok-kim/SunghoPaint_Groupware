package com.ham.len.transfer;

public class TransferPager {
	private String kind;
	private String keyword;
	
	private Long startRow;
	private Long lastRow;
	private Long page;
	private Long perPage; // 페이지당 게시글 개수
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
		startRow = (getPage() - 1) * getPerPage() + 1;
		lastRow = getPage() * getPerPage();
	}
	
	
	public String getKind() {
		return kind;
	}
	
	public String getKeyword() {
		if(keyword == null) {
			keyword = "";
		}
		
		return keyword;
	}
	
	public Long getStartRow() {
		return startRow;
	}
	
	public Long getLastRow() {
		return lastRow;
	}
	
	public Long getPage() {
		if(page == null) {
			page = 1L;
		}
		
		return page;
	}
	
	public Long getPerPage() {
		if(perPage == null) {
			perPage = 10L;
		}
		
		return perPage;
	}
	
	public Long getTotalPage() {
		return totalPage;
	}
	
	public Long getStartNum() {
		return startNum;
	}

	public Long getLastNum() {
		return lastNum;
	}

	public boolean isPre() {
		return isPre;
	}

	public boolean isNext() {
		return isNext;
	}
	
	public void setKind(String kind) {
		this.kind = kind;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public void setStartRow(Long startRow) {
		this.startRow = startRow;
	}
	
	public void setLastRow(Long lastRow) {
		this.lastRow = lastRow;
	}
	
	public void setPage(Long page) {
		this.page = page;
	}
	
	public void setPerPage(Long perPage) {
		this.perPage = perPage;
	}
	
	public void setTotalPage(Long totalPage) {
		this.totalPage = totalPage;
	}
	
	public void setStartNum(Long startNum) {
		this.startNum = startNum;
	}

	public void setLastNum(Long lastNum) {
		this.lastNum = lastNum;
	}
	
	public void setPre(boolean isPre) {
		this.isPre = isPre;
	}
	
	public void setNext(boolean isNext) {
		this.isNext = isNext;
	}
}