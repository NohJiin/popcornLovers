package com.java4.popcorn.bbs;

public class CategoryVO {
	private String bbs_cate_name;
	private String bbs_cate_info;
	private int bbs_cate_num;
	private int start;
	private int end;
	private int page;

	public void setStartEnd(int page) {
		//page별로 start, end값만 구해주면 됨.
		start = 1 + (page - 1) * 10; 
		//무조건 1부터 시작
		//1page: 1 + 0 * 10 => start 1
		//2page: 1 + 1 * 10 => start 11  
		end = page * 10;
		//1page: 1 * 10 => end 10
		//2page: 2 * 10 => end 20
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
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
	
	public String getBbs_cate_name() {
		return bbs_cate_name;
	}
	public void setBbs_cate_name(String bbs_cate_name) {
		this.bbs_cate_name = bbs_cate_name;
	}

	public int getBbs_cate_num() {
		return bbs_cate_num;
	}

	public void setBbs_cate_num(int bbs_cate_num) {
		this.bbs_cate_num = bbs_cate_num;
	}

	public String getBbs_cate_info() {
		return bbs_cate_info;
	}

	public void setBbs_cate_info(String bbs_cate_info) {
		this.bbs_cate_info = bbs_cate_info;
	}


}
