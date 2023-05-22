package com.java4.popcorn.rankUser;

import lombok.Data;

@Data
public class RankUserVO {
	private int rank_no;	// User ¼øÀ§
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
}