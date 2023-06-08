package com.java4.popcorn.movieInfo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


@Controller


public class MovieInfoController {
	@Autowired
	MovieInfoDAO dao;
	
	@RequestMapping("movie/movie")
	public String movie() {
		return "movie/movie";
	
	}
	
	@RequestMapping("movie/movieTop5")
	public String actorSelectOne(Model model) {
	    List<MovieInfoVO> topMovies = dao.selectRandomTop(5);
	    model.addAttribute("topMovies", topMovies);
	    return "movie/movieTop5";
	}
	
	@RequestMapping("movie/movieDetails2")
	public String movieDetails(String movieId, Model model) {
		// 영화 정보를 조회하여 MovieInfoVO에 담기
		MovieInfoVO  bag = dao.selectOne(movieId);
		
		// 영화 상세페이지를 방문할 때마다 조회수 증가
		dao.viewCount(movieId);
		System.out.println(bag);
		// 모델에 영화 정보 추가
		model.addAttribute("bag", bag);
		return "movie/movieDetails2";
	}
	
}

