package com.java4.popcorn.bbs;

import lombok.Data;

import java.sql.Date;

public class BbsVO {
	private int bbs_row_no;
	private long bbs_no;
	private String user_id;
	private String user_nickname;
	private String bbs_title;
	private String bbs_content;
	private int bbs_hit;
	private int bbs_comment_avail;
	private int bbs_report;
	private String bbs_date;
	private int bbs_like;
	private int bbs_cate_num;
	public int getBbs_row_no() {
		return bbs_row_no;
	}
	public void setBbs_row_no(int bbs_row_no) {
		this.bbs_row_no = bbs_row_no;
	}
	public long getBbs_no() {
		return bbs_no;
	}
	public void setBbs_no(long bbs_no) {
		this.bbs_no = bbs_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_nickname() {
		return user_nickname;
	}
	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
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
	public int getBbs_comment_avail() {
		return bbs_comment_avail;
	}
	public void setBbs_comment_avail(int bbs_comment_avail) {
		this.bbs_comment_avail = bbs_comment_avail;
	}
	public int getBbs_report() {
		return bbs_report;
	}
	public void setBbs_report(int bbs_report) {
		this.bbs_report = bbs_report;
	}
	public String getBbs_date() {
		return bbs_date;
	}
	public void setBbs_date(String bbs_date) {
		this.bbs_date = bbs_date;
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
	
}
