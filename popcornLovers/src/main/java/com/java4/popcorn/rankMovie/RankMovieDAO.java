package com.java4.popcorn.rankMovie;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component	// 싱글톤 선언
public class RankMovieDAO {
	@Autowired
	SqlSessionTemplate my;
	
	// rankmovie 테이블에 없는 항목을 movie 테이블에서 가져와 insert
    public int movieInsert() {
		int result = my.insert("RankMovieDAO.movieInsert");
		return result;
	}
    
	/* 스케줄러 시작 */
    // movieId를 담은 리스트 가져오기
    public List<RankMovieVO> movieIdList() {
    	List<RankMovieVO> list = my.selectList("RankMovieDAO.movieIdList");
    	return list;
    }
    
    // movieId가 담긴 리스트를 전달받아 update시키기
    public void movieUpdate(List<RankMovieVO> list) {
  		my.update("RankMovieDAO.rankUpdate2", list);
  	}
    
    // for문 사용해서 update 테스트
    public void movieUpdate2(RankMovieVO bag) {
    	my.update("RankMovieDAO.rankUpdate3", bag);
    }
    
    // update된 항목을 랭킹 정해진대로 가져오는지 확인
    public List<RankMovieVO> testAll() {
		List<RankMovieVO> list = my.selectList("RankMovieDAO.testAll");
		return list;
	}
    /* 스케줄러 끝 */
    
    
	/* 페이징 시작 */
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
	
	
	// movie 개수 count
    public int count() {
		return my.selectOne("RankMovieDAO.count");
	}
	/* 페이징 끝 */
	
    
    // 상위 20개 중에서 랜덤으로 3개 가져오기
	public List<RankMovieVO> recoList() {
		List<RankMovieVO> list = my.selectList("RankMovieDAO.recoList");
		return list;
	}
	
	// 하나만 검색 : rank_no = #{rank_no} 인 항목 찾아 가져옴
	public RankMovieVO selectTop(int rank_no) {
		RankMovieVO bag = my.selectOne("RankMovieDAO.selectTop", rank_no);
		return bag;
	}
	
}