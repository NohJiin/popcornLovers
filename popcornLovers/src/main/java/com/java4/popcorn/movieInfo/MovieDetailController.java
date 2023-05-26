package com.java4.popcorn.movieInfo;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/movie") // 컨트롤러의 기본 경로 설정
public class MovieDetailController {

    @RequestMapping("/movieDetails") // 수정된 경로 설정
    public String movieDetail(@RequestParam("movieCd") String movieCd, Model model) {
        // movieCd를 사용하여 필요한 작업 수행
        // 예를 들어, movieCd로 영화 정보를 조회하거나 다른 데이터를 가져오는 등의 작업 수행 가능

        // 필요한 데이터를 모델에 추가
        model.addAttribute("movieCd", movieCd);
        // 추가적인 데이터를 모델에 추가하고 필요한 작업 수행 가능

        // "movie/movie-details" 페이지로 이동
        return "movie/movie-details";
    }
}