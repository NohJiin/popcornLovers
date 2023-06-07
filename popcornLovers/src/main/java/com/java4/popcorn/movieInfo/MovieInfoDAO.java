package com.java4.popcorn.movieInfo;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	 
	 public void viewCount(String movieId) {
		my.update("MovieInfoDAO.viewCount", movieId);
	}
	 
	 public List<MovieInfoVO> selectRandomTop(int count) {
		    Map<String, Object> params = new HashMap<>();
		    params.put("count", count);
		    List<MovieInfoVO> topMovies = my.selectList("MovieInfoDAO.selectRandomTop", params);
		    return topMovies;
		}
}
