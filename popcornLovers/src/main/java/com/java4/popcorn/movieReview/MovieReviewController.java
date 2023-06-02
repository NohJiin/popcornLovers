package com.java4.popcorn.movieReview;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


public class MovieReviewController {
	@Autowired
	MovieReviewDAO dao;
	
	@RequestMapping("movie/movieReview")
	public void movieReview(Model model) {
		List<MovieReviewVO> list = dao.reviewList();
		model.addAttribute("list", list);
	}
}
