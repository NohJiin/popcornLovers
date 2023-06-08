package com.java4.popcorn.rankMovie;

import java.util.List;

public interface RankMovieInter {

	// rankmovie 테이블에 없는 항목을 movie 테이블에서 가져와 insert
	int movieInsert();

	/* 영화 랭킹 업데이트 스케줄러 시작 */
	// movieId를 담은 리스트 가져오기
	List<RankMovieVO> movieIdList();

	// update된 항목을 랭킹 정해진대로 가져오는지 확인
	List<RankMovieVO> testAll();

	// moviejiim 테이블에 있는 movieId항목만 가져오기
	List<RankMovieVO> likeMovieId();

	// movieLike 수 업데이트
	void likeUpdate(RankMovieVO bag);

	// movie review 수가 0이 아닌 리스트 가져오기
	List<RankMovieVO> reviewMovieId();

	// movieReviews 업데이트
	void reviewsUpdate(RankMovieVO bag);

	// movieGrade 정보가 있는 리스트를 가져옴
	List<RankMovieVO> gradeMovieId();

	// movieGrade 업데이트
	void gradeUpdate(RankMovieVO bag);

	// rankmovie 테이블의 moviePopularity 컬럼 업데이트
	void rankUpdate(RankMovieVO bag);
	/* 스케줄러 끝 */

	// reco_movie 테이블에 랜덤 3가지 추가하기
	void recoMovieAdd();

	// reco_movie 테이블에 있는 항목 가져오기
	List<RankMovieVO> recoMovieList();

	// reco_movie 테이블 모두 삭제
	void recoMovieDel();

	/* 페이징 시작 */
	// 전체 목록 : 순위별
	List<RankMovieVO> all(PageVO vo);

	List<RankMovieVO> list(PageVO vo);

	// movie 개수 count
	int count();
	/* 페이징 끝 */

	// 하나만 검색 : rank_no = #{rank_no} 인 항목 찾아 가져옴
	RankMovieVO selectTop(int rank_no);

}