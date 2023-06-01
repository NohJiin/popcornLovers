package com.java4.popcorn.movieInfo;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java4.popcorn.rankMovie.PageVO;
import com.java4.popcorn.rankMovie.RankMovieVO;

@Component
public class MovieInfoDAO {
	@Autowired
	SqlSessionTemplate my;
	
	public MovieInfoVO selectTop(int rank_no) {
		MovieInfoVO bag = my.selectOne("MovieInfoDAO.selectTop", rank_no);
		return bag;
	}

	 public MovieInfoVO selectOne(String movieId) {
	     MovieInfoVO bag=  my.selectOne("MovieInfoDAO.selectOne", movieId);
	     return bag;
	       
	    }
}
