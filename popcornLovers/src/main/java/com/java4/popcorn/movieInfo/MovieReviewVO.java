package com.java4.popcorn.movieInfo;

import lombok.Data;

@Data
public class MovieReviewVO {
	private String reviewId;
	private String movieId;
	private String memberId;
	private String reviewContent;
}
