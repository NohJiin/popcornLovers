package com.java4.popcorn.movieReview;

import lombok.Data;

@Data
public class MovieReviewVO {
	private String reviewId;
	private String movieId;
	private String memberId;
	private String reviewContent;
}
