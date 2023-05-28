package com.green.airline.utils;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class PagingObj {
	
	// 현재 페이지
	private Integer nowPage;
	// 시작 페이지
	private Integer startPage;
	// 끝 페이지
	private Integer endPage;
	// 총 게시글 수
	private Integer total;
	// 페이지당 글의 개수
	private Integer cntPerPage;
	// 마지막 페이지
	private Integer lastPage;
	// 쿼리문에 들어갈 start
	private Integer start;
	// 쿼리문에 들어갈 end
	private Integer end;
	// 한번에 출력할 페이지 수
	private Integer cntPage = 5;
	
	public PagingObj(int total, int nowPage, int cntPerPage) {
		this.total = total;
		this.nowPage = nowPage;
		this.cntPerPage = cntPerPage;
		calcLastPage(this.total, this.cntPerPage);
		calcStartEndPage(this.nowPage, this.cntPage);
		calcStartEnd(this.nowPage, this.cntPerPage);
	}
	
	// 제일 마지막 페이지 계산하는 메서드
	public void calcLastPage(int total, int cntPerPage) {
		this.lastPage = (int)Math.ceil((double)total / (double)cntPerPage);
	}
	
	// 시작, 끝 페이지 계산
	public void calcStartEndPage(int nowPage, int cntPage) {
		this.endPage = (int)Math.ceil(((double)nowPage / (double)cntPage) * cntPage);
		if(this.endPage < cntPage) {
			this.endPage = cntPage;
		}
		if(this.lastPage < this.endPage) {
			this.endPage = this.lastPage;
		}
		this.startPage = (this.endPage - cntPage + 1);
		if(this.startPage < 1) {
			this.startPage = 1;
		}
	}
	
	// 쿼리에서 사용할 start, end 계산하기
	public void calcStartEnd(int nowPage, int cntPerPage) {
		this.end = nowPage * cntPerPage;
		this.start = this.end - cntPerPage + 1;
	}
	

}
