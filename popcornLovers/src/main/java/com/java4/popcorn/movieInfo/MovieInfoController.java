package com.java4.popcorn.movieInfo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller

public class MovieInfoController {
	@RequestMapping("movie/movie")
	public String movie() {
		return "movie/movie";
	
	}
}

