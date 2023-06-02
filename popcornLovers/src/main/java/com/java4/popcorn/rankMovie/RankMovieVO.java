package com.java4.popcorn.rankMovie;

import lombok.Data;

@Data
public class RankMovieVO {
	private int rank_no;	// 영화 순위
	private double moviePopularity;	// 영화 인기도
	private String movieId;	// 영화 아이디
	private String movieTitle;	// 영화 제목
	private String movieGenre;	// 영화 장르
	private String movieGrade;	// 영화 평점
	private String movieOpen;	// 영화 개봉일
	private String movieLast;	// 영화 마지막 상영일
	private String movieStory;	// 영화 줄거리
	private int movieTime;	// 영화 상영 시간
	private String movieImg;	// 영화 이미지
	private String movieActor;	// 영화 출연 배우
	private String movieDirector;	// 영화 감독
	private int movieLike;	// 영화 좋아요 수
	private int movieHits;	// 영화 조회수
	private int movieReviews;	// 영화 리뷰수
}