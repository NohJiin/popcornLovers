package com.java4.popcorn.mypage;

import java.util.Date;


public class MypageVO {
	
	 //?šŒ?›?´ ?“´ ê²Œì‹œê¸? ëª©ë¡	
	  private int bbs_id;
	  private String member_id;
	  private String bbs_title;
	  private Date bbs_create;
	  
	  //?šŒ?›?´ ?“´ ë¦¬ë·° ëª©ë¡
	  private String movieTitle;
	  private String reviewContent;
	  private String movieId;
	  private String memberId;
	  
	  //?šŒ?›?˜ ?˜?™” ì°? ëª©ë¡
	  private Integer movie_like;
	  
	  //getter setter
	  public Integer getMovie_like() {
		return movie_like;
	}
	  public void setMovie_like(Integer movie_like) {
		this.movie_like = movie_like;
	}

	public String getMovieTitle() {
		return movieTitle;
	}  
	  
	public void setMovieTitle(String movieTitle) {
		this.movieTitle = movieTitle;
	}
	
	public String getReviewContent() {
		return reviewContent;
	}
	
	public String getMovieId() {
		return movieId;
	}
	
	public void setMovieId(String movieId) {
		this.movieId = movieId;
	}
	
	public String getMemberId() {
		return memberId;
	}
	
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	
	public int getBbs_id() {
		return bbs_id;
	}
	public void setBbs_id(int bbs_id) {
		this.bbs_id = bbs_id;
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
	public Date getBbs_create() {
		return bbs_create;
	}
	public void setBbs_create(Date bbs_create) {
		this.bbs_create = bbs_create;
	}
	   
	   
}
