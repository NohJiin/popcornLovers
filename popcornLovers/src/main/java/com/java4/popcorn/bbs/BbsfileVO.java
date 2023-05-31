package com.java4.popcorn.bbs;

public class BbsfileVO {
	private int file_id;
	private String save_folder;
	private String original_file;
	private String save_file;
	
	public int getFile_id() {
		return file_id;
	}
	public void setFile_id(int file_id) {
		this.file_id = file_id;
	}
	public String getSave_folder() {
		return save_folder;
	}
	public void setSave_folder(String save_folder) {
		this.save_folder = save_folder;
	}
	public String getOriginal_file() {
		return original_file;
	}
	public void setOriginal_file(String original_file) {
		this.original_file = original_file;
	}
	public String getSave_file() {
		return save_file;
	}
	public void setSave_file(String save_file) {
		this.save_file = save_file;
	}
}
