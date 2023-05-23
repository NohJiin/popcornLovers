package com.java4.popcorn.rankMovie;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component	// 싱글톤 선언
public class RankMovieDAO {
	@Autowired
	SqlSessionTemplate my;
	
	// rankUser 테이블에 없는 값 member 테이블에서 가져와 insert
    public int movieInsert() {
		int result = my.insert("RankMovieDAO.movieInsert");
		return result;
	}
	
	/* 페이징 */
	// 전체 목록 : 순위별
	public List<RankMovieVO> all(PageVO vo) {
		List<RankMovieVO> list = my.selectList("RankMovieDAO.all", vo);
		System.out.println(list.size());
		return list;
	}
	
	public List<RankMovieVO> list(PageVO vo) {
		List<RankMovieVO> list = my.selectList("RankMovieDAO.list", vo);
		return list;
	}
	
	// movie 전체 수
    public int count() {
		return my.selectOne("RankMovieDAO.count");
	}
    
	/* 페이징 끝 */
	
	// 전체 목록 가져오기
	public List<RankMovieVO> recoList() {
		System.out.println("list DAO실행");
		List<RankMovieVO> list = my.selectList("RankMovieDAO.recoAll");
		
		return list;
	}
	
	// 하나만 검색 : rank_no = #{rank_no} 인 항목 찾아 가져옴
	public RankMovieVO selectTop(int rank_no) {
		RankMovieVO bag = my.selectOne("RankMovieDAO.selectTop", rank_no);
		return bag;
	}
	
}