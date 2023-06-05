package com.java4.popcorn.movieGrade;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("/movieInfo")
public class MovieGradeController {

  @Autowired
  private MovieGradeDAO movieGradeDAO;

  @RequestMapping(value = "/submitRating", method = RequestMethod.POST)
  @ResponseBody
  public String submitRating(@RequestParam("rating") int rating,
                             @RequestParam("memberId") String memberId,
                             @RequestParam("movieId") String movieId) {
    MovieGradeVO movieGradeVO = new MovieGradeVO();
    movieGradeVO.setGrade(rating);
    movieGradeVO.setMember_id(memberId);
    movieGradeVO.setMovieId(movieId);

    movieGradeDAO.movieGrade(movieGradeVO);

    return "success";
  }
}
