package com.java4.popcorn.movieInfo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.java4.popcorn.rankMovie.RankMovieDAO;
import com.java4.popcorn.rankMovie.RankMovieVO;

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
		RankMovieVO top1 = dao.selectTop(1);
		RankMovieVO top2 = dao.selectTop(2);
		RankMovieVO top3 = dao.selectTop(3);
		RankMovieVO top4 = dao.selectTop(4);
		RankMovieVO top5 = dao.selectTop(5);
		model.addAttribute("top1", top1);
		model.addAttribute("top2", top2);
		model.addAttribute("top3", top3);
		model.addAttribute("top4", top4);
		model.addAttribute("top5", top5);
	}
}

