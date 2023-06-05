package com.java4.popcorn.movieInfo;

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
	public void actorSelectOne(Model model) {
		MovieInfoVO top1 = dao.selectTop(1);
		MovieInfoVO top2 = dao.selectTop(2);
		MovieInfoVO top3 = dao.selectTop(3);
		MovieInfoVO top4 = dao.selectTop(4);
		MovieInfoVO top5 = dao.selectTop(5);
		model.addAttribute("top1", top1);
		model.addAttribute("top2", top2);
		model.addAttribute("top3", top3);
		model.addAttribute("top4", top4);
		model.addAttribute("top5", top5);
	}
	
	@RequestMapping("movie/movieDetails2")
	public String movieDetails(String movieId, Model model) {
		// 영화 정보를 조회하여 MovieInfoVO에 담기
		MovieInfoVO  bag = dao.selectOne(movieId);
		
		// 영화 상세페이지를 방문할 때마다 조회수 증가
		dao.viewCount(movieId);
		
		// 모델에 영화 정보 추가
		model.addAttribute("bag", bag);
		return "movie/movieDetails2";
	}
	
}

