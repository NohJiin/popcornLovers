package com.java4.popcorn.bbsReply;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class ReplyVO {
	private int b_reply_id;
	private int b_comment_id;
	private int bbs_no;
	private String b_reply_content;
	private String b_reply_writer_id;
	private LocalDateTime b_reply_update;
	private LocalDateTime b_reply_delete;
	private LocalDateTime b_reply_create;
	
	//작성자 정보 가져오기 위함
	private String member_id;
	private String member_knickname;
	private String member_img;

	public LocalDateTime getB_reply_create() {
		return b_reply_create;
	}

	public void setB_reply_create(LocalDateTime b_reply_create) {
		this.b_reply_create = b_reply_create;
	}

	public String getFormattedB_reply_create() {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
		String formattedDate = b_reply_create.format(formatter).toString().replace("T", " ");
		return formattedDate;
	}

	public void setFormattedB_reply_create(String formattedB_reply_create) {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
		this.b_reply_create = LocalDateTime.parse(formattedB_reply_create, formatter);
	}
	
	public LocalDateTime getB_reply_update() {
		return b_reply_update;
	}

	public void setB_reply_update(LocalDateTime b_reply_update) {
		this.b_reply_update = b_reply_update;
	}

	public String getFormattedB_reply_update() {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
		String formattedDate = b_reply_create.format(formatter).toString().replace("T", " ");
		return formattedDate;
	}

	public void setFormattedB_reply_update(String formattedB_reply_update) {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
		this.b_reply_create = LocalDateTime.parse(formattedB_reply_update, formatter);
	}
	
	
	public LocalDateTime getB_reply_delete() {
		return b_reply_delete;
	}

	public void setB_reply_delete(LocalDateTime b_reply_delete) {
		this.b_reply_delete = b_reply_delete;
	}

	public String getFormattedB_reply_delete() {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
		String formattedDate = b_reply_delete.format(formatter).toString().replace("T", " ");
		return formattedDate;
	}

	public void setFormattedB_reply_delete(String formattedB_reply_delete) {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
		this.b_reply_delete = LocalDateTime.parse(formattedB_reply_delete, formatter);
	}

	public int getB_comment_id() {
		return b_comment_id;
	}

	public void setB_comment_id(int b_comment_id) {
		this.b_comment_id = b_comment_id;
	}

	public String getB_reply_content() {
		return b_reply_content;
	}

	public void setB_reply_content(String b_reply_content) {
		this.b_reply_content = b_reply_content;
	}

	public String getB_reply_writer_id() {
		return b_reply_writer_id;
	}

	public void setB_reply_writer_id(String b_reply_writer_id) {
		this.b_reply_writer_id = b_reply_writer_id;
	}

	public int getBbs_no() {
		return bbs_no;
	}

	public void setBbs_no(int bbs_no) {
		this.bbs_no = bbs_no;
	}

	public int getB_reply_id() {
		return b_reply_id;
	}

	public void setB_reply_id(int b_reply_id) {
		this.b_reply_id = b_reply_id;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_knickname() {
		return member_knickname;
	}

	public void setMember_knickname(String member_knickname) {
		this.member_knickname = member_knickname;
	}

	public String getMember_img() {
		return member_img;
	}

	public void setMember_img(String member_img) {
		this.member_img = member_img;
	}
}
