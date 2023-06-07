package com.java4.popcorn.movieReview;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MovieReviewController {
    @Autowired
    MovieReviewDAO dao;

    @RequestMapping("movie/movieReview")
    public void movieReview(Model model) {
        List<MovieReviewVO> list = dao.reviewList();
        model.addAttribute("list", list);
    }
    
    @RequestMapping(value = "/movieReview/submitReview", method = RequestMethod.POST)
    public String submitReview(@RequestParam("memberId") String memberId,
                               @RequestParam("movieId") String movieId,
                               @RequestParam("review") String review) {
        MovieReviewVO reviewVO = new MovieReviewVO();
        reviewVO.setMovieId(movieId);
        reviewVO.setMemberId(memberId);
        reviewVO.setReviewContent(review);

        dao.insertMovieReview(reviewVO);

        return "redirect:/movie/movieReview";
    }
}
