package com.java4.popcorn.bbsComment;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class CommentVO {
	private int b_comment_id;
	private int bbs_no;
	private String b_comment_content;
	private String b_comment_writer_id;
	private String b_comment_update;
	private String b_comment_delete;
	private String b_comment_is_deleted;
	private LocalDateTime b_comment_create;

	public LocalDateTime getB_comment_create() {
		return b_comment_create;
	}

	public void setB_comment_create(LocalDateTime b_comment_create) {
		this.b_comment_create = b_comment_create;
	}

	public String getFormattedB_comment_create() {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
		return b_comment_create.format(formatter);
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


	public String getB_comment_update() {
		// 16자리까지 문자열을 잘라냄
		if (b_comment_update != null && b_comment_update.length() > 16) {
			return b_comment_update.substring(0, 16);
		} else {
			return b_comment_update;
		}
	}

	public void setB_comment_update(String b_comment_update) {
		this.b_comment_update = b_comment_update;
	}

	public String getB_comment_delete() {
		return b_comment_delete;
	}

	public void setB_comment_delete(String b_comment_delete) {
		this.b_comment_delete = b_comment_delete;
	}

	public String getB_comment_is_deleted() {
		return b_comment_is_deleted;
	}

	public void setB_comment_is_deleted(String b_comment_is_deleted) {
		this.b_comment_is_deleted = b_comment_is_deleted;
	}

	public int getBbs_no() {
		return bbs_no;
	}

	public void setBbs_no(int bbs_no) {
		this.bbs_no = bbs_no;
	}
}
