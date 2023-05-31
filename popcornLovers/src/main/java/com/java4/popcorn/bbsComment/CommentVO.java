package com.java4.popcorn.bbsComment;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class CommentVO {
	private int b_comment_id;
	private int bbs_no;
	private String b_comment_content;
	private String b_comment_empty;
	private String b_comment_writer_id;
	private LocalDateTime b_comment_update;
	private LocalDateTime b_comment_delete;
	private LocalDateTime b_comment_create;
	
	//작성자 정보 가져오기 위함
	private String member_id;
	private String member_knickname;
	private String member_img;

	public LocalDateTime getB_comment_create() {
		return b_comment_create;
	}

	public void setB_comment_create(LocalDateTime b_comment_create) {
		this.b_comment_create = b_comment_create;
	}

	public String getFormattedB_comment_create() {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
		String formattedDate = b_comment_create.format(formatter).toString().replace("T", " ");
		return formattedDate;
	}

	public void setFormattedB_comment_create(String formattedB_comment_create) {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
		this.b_comment_create = LocalDateTime.parse(formattedB_comment_create, formatter);
	}

	public int getB_comment_id() {
		return b_comment_id;
	}

	public void setB_comment_id(int b_comment_id) {
		this.b_comment_id = b_comment_id;
	}

	public String getB_comment_content() {
		return b_comment_content;
	}

	public void setB_comment_content(String b_comment_content) {
		this.b_comment_content = b_comment_content;
	}

	public String getB_comment_writer_id() {
		return b_comment_writer_id;
	}

	public void setB_comment_writer_id(String b_comment_writer_id) {
		this.b_comment_writer_id = b_comment_writer_id;
	}


	public LocalDateTime getB_comment_update() {
		return b_comment_update;
	}

	public void setB_comment_update(LocalDateTime b_comment_update) {
		this.b_comment_update = b_comment_update;
	}

	public String getFormattedB_comment_update() {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
		String formattedDate = b_comment_create.format(formatter).toString().replace("T", " ");
		return formattedDate;
	}

	public void setFormattedB_comment_update(String formattedB_comment_update) {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
		this.b_comment_update = LocalDateTime.parse(formattedB_comment_update, formatter);
	}
	
	public LocalDateTime getB_comment_delete() {
		return b_comment_delete;
	}

	public void setB_comment_delete(LocalDateTime b_comment_delete) {
		this.b_comment_delete = b_comment_delete;
	}

	public String getFormattedB_comment_delete() {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
		String formattedDate = b_comment_delete.format(formatter).toString().replace("T", " ");
		return formattedDate;
	}

	public void setFormattedB_comment_delete(String formattedB_comment_delete) {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
		this.b_comment_delete = LocalDateTime.parse(formattedB_comment_delete, formatter);
	}
	
	
	public int getBbs_no() {
		return bbs_no;
	}

	public void setBbs_no(int bbs_no) {
		this.bbs_no = bbs_no;
	}

	public String getB_comment_empty() {
		return b_comment_empty;
	}

	public void setB_comment_empty(String b_comment_empty) {
		this.b_comment_empty = b_comment_empty;
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
