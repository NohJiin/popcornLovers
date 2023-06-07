package com.java4.popcorn.movieReview;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class MovieReviewDAO {
    @Autowired
    SqlSessionTemplate my;

    public List<MovieReviewVO> reviewList() {
        List<MovieReviewVO> list = my.selectList("MovieReviewDAO.reviewList");

        return list;
    }
    public void insertMovieReview(MovieReviewVO reviewVO) {
        my.insert("MovieReviewDAO.insertMovieReview", reviewVO);
    }
}
