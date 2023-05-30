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
	
	// �ϳ��� �˻� : rank_no = #{rank_no} �� �׸� ã�� ������
	public RankMovieVO selectTop(int rank_no) {
		RankMovieVO bag = my.selectOne("RankMovieDAO.selectTop", rank_no);
		return bag;
	}
}
