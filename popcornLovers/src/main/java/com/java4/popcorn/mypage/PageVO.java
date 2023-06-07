package com.java4.popcorn.mypage;

public class PageVO {
	private int start;
	private int end;
	private int page;
	private String member_id;
	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
	public void setStartEnd(int page) {
		start = 1 + (page - 1) * 5;
		//무조�? 1�??�� ?��?��
		//1page: 1 + 0 * 10 => start 1
		//2page: 1 + 1 * 10 => start 11  
		end = page * 5;
		//1page: 1 * 10 => end 10
		//2page: 2 * 10 => end 20
	}
	
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	@Override
	public String toString() {
		return "PageVO [start=" + start + ", end=" + end + ", page=" + page + ", member_id=" + member_id + "]";
	}
	
	
}
