package com.java4.popcorn.rankMovie;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component // 싱글톤 선언
public class RankMovieDAO {
	@Autowired
	SqlSessionTemplate my;

	// rankmovie 테이블에 없는 항목을 movie 테이블에서 가져와 insert
	public int movieInsert() {
		return my.insert("RankMovieDAO.movieInsert");
	}

	/* 영화 랭킹 업데이트 스케줄러 시작 */
	// movieId를 담은 리스트 가져오기
	public List<RankMovieVO> movieIdList() {
		return my.selectList("RankMovieDAO.movieIdList");
	}

	// update된 항목을 랭킹 정해진대로 가져오는지 확인
	public List<RankMovieVO> testAll() {
		return my.selectList("RankMovieDAO.testAll");
	}

	// moviejiim 테이블에 있는 movieId항목만 가져오기
	public List<RankMovieVO> likeMovieId() {
		return my.selectList("RankMovieDAO.likeMovieId");
	}

	// movieLike 수 업데이트
	public void likeUpdate(RankMovieVO bag) {
		my.update("RankMovieDAO.likeUpdate", bag);
	}

	// movie review 수가 0이 아닌 리스트 가져오기
	public List<RankMovieVO> reviewMovieId() {
		return my.selectList("RankMovieDAO.reviewMovieId");
	}

	// movieReviews 업데이트
	public void reviewsUpdate(RankMovieVO bag) {
		my.update("RankMovieDAO.reviewsUpdate", bag);
	}

	// movieGrade 정보가 있는 리스트를 가져옴
	public List<RankMovieVO> gradeMovieId() {
		return my.selectList("RankMovieDAO.gradeMovieId");
	}

	// movieGrade 업데이트
	public void gradeUpdate(RankMovieVO bag) {
		my.update("RankMovieDAO.gradeUpdate", bag);
	}
	
	// rankmovie 테이블의 moviePopularity 컬럼 업데이트
	public void rankUpdate(RankMovieVO bag) {
		my.update("RankMovieDAO.rankUpdate", bag);
	}
	/* 스케줄러 끝 */

	
	// reco_movie 테이블에 랜덤 3가지 추가하기
	public void recoMovieAdd() {
		my.insert("RankMovieDAO.recoMovieAdd");
	}

	// reco_movie 테이블에 있는 항목 가져오기
	public List<RankMovieVO> recoMovieList() {
		return my.selectList("RankMovieDAO.recoMovieList");
	}

	// reco_movie 테이블 모두 삭제
	public void recoMovieDel() {
		my.delete("RankMovieDAO.recoMovieDel");
	}
	

	/* 페이징 시작 */
	// 전체 목록 : 순위별
	public List<RankMovieVO> all(PageVO vo) {
		List<RankMovieVO> list = my.selectList("RankMovieDAO.all", vo);
		System.out.println(list.size());
		return list;
	}

	public List<RankMovieVO> list(PageVO vo) {
		return my.selectList("RankMovieDAO.list", vo);
	}

	// movie 개수 count
	public int count() {
		return my.selectOne("RankMovieDAO.count");
	}
	/* 페이징 끝 */


	// 하나만 검색 : rank_no = #{rank_no} 인 항목 찾아 가져옴
	public RankMovieVO selectTop(int rank_no) {
		return my.selectOne("RankMovieDAO.selectTop", rank_no);
	}

}