package com.company.pjh.VOs;

public class Pagination {
	private int listSize=6;
	private int rangeSize=3;
	private int page;
	private int range;
	private int startList;
	private int listCnt;
	private int pageCnt;
	private int startPage;	
	private int endPage;
	private boolean prev;
	private boolean next;
	
	public int getListSize() {
		return listSize;
	}
	public void setListSize(int listSize) {
		this.listSize = listSize;
	}
	public int getRangeSize() {
		return rangeSize;
	}
	public void setRangeSize(int rangeSize) {
		this.rangeSize = rangeSize;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getRange() {
		return range;
	}
	public void setRange(int range) {
		this.range = range;
	}
	public int getListCnt() {
		return listCnt;
	}
	public void setListCnt(int listCnt) {
		this.listCnt = listCnt;
	}
	public int getPageCnt() {
		return pageCnt;
	}
	public void setPageCnt(int pageCnt) {
		this.pageCnt = pageCnt;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}	
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public int getStartList() {
		return startList;
	}	
	public void setStartList(int startList) {
		this.startList = startList;
	}
	
	public void pageInfo(int page, int range, int listCnt) {
		this.page=page;
		this.range=range;
		this.listCnt=listCnt;
		this.startList=(page-1) * listSize;
		
		//전체 페이지 수		
		this.pageCnt=(int) Math.ceil(listCnt/(double)listSize);
		
		//시작 페이지
		this.startPage=(range-1)*rangeSize+1;
		
		//끝 페이지
		this.endPage=range*rangeSize;
		
		//이전 버튼 상태
		this.prev= range==1 ? false : true;
		
		//다음 버튼 상태
		this.next= endPage>=pageCnt ? false: true;
		
		if(this.endPage >= this.pageCnt) {
			this.endPage = this.pageCnt;
			this.next=false;
		}
		
	}
	
	
	
}
