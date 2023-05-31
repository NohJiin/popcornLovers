package com.java4.popcorn.bbs;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

public class BbsVO {
	private int bbs_row_no;
	private int bbs_no;
	private String member_id;
	private String member_knickname;
	private String bbs_title;
	private String bbs_content;
	private int bbs_hit;
	private LocalDateTime bbs_date;
	private LocalDateTime  bbs_delete;
	private String bbs_update;
	private int bbs_like;
	private int bbs_cate_num;
	private List<BbsfileVO> fileInfos;
	
	public int getBbs_row_no() {
		return bbs_row_no;
	}
	public void setBbs_row_no(int bbs_row_no) {
		System.out.println("=====bbs_row");
		this.bbs_row_no = bbs_row_no;
	}
	public int getBbs_no() {
		return bbs_no;
	}
	public void setBbs_no(int bbs_no) {
		System.out.println("=====bbs_no");
		this.bbs_no = bbs_no;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getBbs_title() {
		return bbs_title;
	}
	public void setBbs_title(String bbs_title) {
		this.bbs_title = bbs_title;
	}
	public String getBbs_content() {
		return bbs_content;
	}
	public void setBbs_content(String bbs_content) {
		this.bbs_content = bbs_content;
	}
	public int getBbs_hit() {
		return bbs_hit;
	}
	public void setBbs_hit(int bbs_hit) {
		this.bbs_hit = bbs_hit;
	}
	
	public String getBbs_date() {
		String formattedDate = bbs_date.toString().replace("T", " ");
		return formattedDate;
	}
	public void setBbs_date(LocalDateTime bbs_date) {
		this.bbs_date = bbs_date;
	}
	
	public String getFormattedBbs_date() {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		return bbs_date.format(formatter);
	}

	public void setFormattedBbs_date(String formattedBbs_date) {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		this.bbs_date = LocalDateTime.parse(formattedBbs_date, formatter);
	}
	
	public int getBbs_like() {
		return bbs_like;
	}
	public void setBbs_like(int bbs_like) {
		this.bbs_like = bbs_like;
	}
	public int getBbs_cate_num() {
		return bbs_cate_num;
	}
	public void setBbs_cate_num(int bbs_cate_num) {
		this.bbs_cate_num = bbs_cate_num;
	}
	public String getMember_knickname() {
		return member_knickname;
	}
	public void setMember_knickname(String member_knickname) {
		this.member_knickname = member_knickname;
	}
	public LocalDateTime getBbs_delete() {
		return bbs_delete;
	}
	public void setBbs_delete(LocalDateTime bbs_delete) {
		this.bbs_delete = bbs_delete;
	}
	public String getBbs_update() {
		return bbs_update;
	}
	public void setBbs_update(String bbs_update) {
		this.bbs_update = bbs_update;
	}
	public List<BbsfileVO> getFileInfos() {
		return fileInfos;
	}
	public void setFileInfos(List<BbsfileVO> fileInfos) {
		this.fileInfos = fileInfos;
	}
	
}
