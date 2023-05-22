package com.java4.popcorn.bbsReply;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

public class ReplyVO {
	private int b_reply_id;
	private int b_comment_id;
	private int bbs_no;
	private String b_reply_content;
	private String b_reply_writer_id;
	private String b_reply_update;
	private String b_reply_delete;
	private String b_reply_is_deleted;
	private LocalDateTime b_reply_create;

	public LocalDateTime getB_reply_create() {
		return b_reply_create;
	}

	public void setB_reply_create(LocalDateTime b_reply_create) {
		this.b_reply_create = b_reply_create;
	}

	public String getFormattedB_reply_create() {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
		return b_reply_create.format(formatter);
	}

	public void setFormattedB_reply_create(String formattedB_reply_create) {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
		this.b_reply_create = LocalDateTime.parse(formattedB_reply_create, formatter);
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


	public String getB_reply_update() {
		// 16자리까지 문자열을 잘라냄
		if (b_reply_update != null && b_reply_update.length() > 16) {
			return b_reply_update.substring(0, 16);
		} else {
			return b_reply_update;
		}
	}

	public void setB_reply_update(String b_reply_update) {
		this.b_reply_update = b_reply_update;
	}

	public String getB_reply_delete() {
		return b_reply_delete;
	}

	public void setB_reply_delete(String b_reply_delete) {
		this.b_reply_delete = b_reply_delete;
	}

	public String getB_reply_is_deleted() {
		return b_reply_is_deleted;
	}

	public void setB_reply_is_deleted(String b_reply_is_deleted) {
		this.b_reply_is_deleted = b_reply_is_deleted;
	}

	public int getBbs_no() {
		return bbs_no;
	}

	public void setBbs_no(int bbs_no) {
		this.bbs_no = bbs_no;
	}
}
