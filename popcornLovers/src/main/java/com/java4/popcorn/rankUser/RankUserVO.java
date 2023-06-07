package com.java4.popcorn.rankUser;

import lombok.Data;

@Data
public class RankUserVO {
	private int rank_no;	// User ����
	private double memberPopularity;
	private String member_id;
	private String member_pw;
	private String member_name;
    private String member_knickname;
    private String member_tel;
    private String member_email;
    private int member_level;
    private int member_fav;
    private int member_view;
    private String member_img;
    private int member_age;
    private String member_gender;
    private int bbs_count;			// 게시글 작성 수
    private int b_comment_count;	// 댓글 작성 수
    private int review_count;		// 리뷰 작성 수
    private int grade_count;		// 별점 평가 수
    private int hits_count;			// 조회수
    private int login_count;		// 로그인 횟수
}