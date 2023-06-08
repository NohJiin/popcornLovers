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
    public void movieReview(Model model, @RequestParam("movieId")String movieId) {
        List<MovieReviewVO> list = dao.reviewList(movieId);
        System.out.println(list);
        model.addAttribute("list", list);
    }
    
    @RequestMapping(value = "/movieReview/submitReview", method = RequestMethod.GET)
    public String submitReview(@RequestParam("memberId") String memberId,
                               @RequestParam("movieId") String movieId,
                               @RequestParam(required = false) String review) {
    	if (review != null) {
    		 MovieReviewVO reviewVO = new MovieReviewVO();
    	        reviewVO.setMovieId(movieId);
    	        reviewVO.setMemberId(memberId);
    	        reviewVO.setReviewContent(review);

    	        dao.insertMovieReview(reviewVO);

    	        return "redirect:/movie/movieReview" + "?memberId=" + memberId + "&movieId=" + movieId ;
		}

    		return "redirect:/movie/movieReview" + "?memberId=" + memberId + "?movieId=" + movieId;
    }
}
