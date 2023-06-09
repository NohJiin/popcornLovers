package com.java4.popcorn.mypage;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;


public class MypageVO {
	
	 //회원이 쓴 게시글 목록	
	  private int bbs_no;
	  private String member_id;
	  private String member_knickname;
	  private String bbs_title;
	  private LocalDateTime bbs_date;
	  private int bbs_cate_num;
	  
	//회원이 쓴 리뷰 목록
	  private String movieTitle;
	  private String reviewContent;
	  private String movieId;
	  private String memberId;
	  
	//회원의 영화 찜 목록
	  private Integer movie_like;
	  private String movieImg;
	  private String movieGrade;
	  
	  //회원 프로필의 조회수와 좋아요
	  private Integer memberHits;
	  private Integer memberLike;
	  
	  
	//회원의 영화 평가 목록
	  private Integer grade;
	  
	  //getter setter	  
	 
	 public void setBbs_cate_num(int bbs_cate_num) {
		this.bbs_cate_num = bbs_cate_num;
	} 
	  
	  public int getBbs_cate_num() {
		return bbs_cate_num;
	}
	  
	 public Integer getGrade() {
		return grade;
	}
	 
	 public void setGrade(Integer grade) {
		this.grade = grade;
	}
	  
	 public String getMovieGrade() {
		return movieGrade;
	}
	 public void setMovieGrade(String movieGrade) {
		this.movieGrade = movieGrade;
	}
	 public String getMovieImg() {
		return movieImg;
	}
	 public void setMovieImg(String movieImg) {
		this.movieImg = movieImg;
	}
	 public Integer getMemberHits() {
		return memberHits;
	}
	 public void setMemberHits(Integer memberHits) {
		this.memberHits = memberHits;
	}
	 public Integer getMemberLike() {
		return memberLike;
	}
	 public void setMemberLike(Integer memberLike) {
		this.memberLike = memberLike;
	}
	  public String getMember_knickname() {
		return member_knickname;
	}
	 public void setMember_knickname(String member_knickname) {
		this.member_knickname = member_knickname;
	}
	  
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
		return bbs_no;
	}
	public void setBbs_no(int bbs_no) {
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
	public String getBbs_date() {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
		String formattedDate = bbs_date.format(formatter).toString().replace("T", " ");
		return formattedDate;
	}
	public void setBbs_date(LocalDateTime bbs_date) {
		this.bbs_date = bbs_date;
	}
	   
	   
}
