package com.java4.popcorn.rankMovie;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component("schedulerMovie") // scheduler 싱글톤 객체 생성
public class Scheduler {
	@Autowired
	RankMovieDAO dao;

	// 초 | 분 | 시 | 일 | 월 | 요일 | 연도(생략가능)
	// 매일 5분마다 랭킹이 업데이트 되도록 설정 (임시 설정)
	@Scheduled(cron = "0 */5 * * * *")
	public void autoUpdate() {
		/* movieLike, movieReviews, movieGrade 업데이트 후 movie의 rank_no 정해야함 */
		System.out.println("==============================");
		System.out.println("무비 랭킹 업데이트를 시작합니다.");
		// movieLike 업데이트할 idList를 가져온 후 update
		List<RankMovieVO> likeList = dao.likeMovieId();
		for (int i = 0; i < likeList.size(); i++) {
			dao.likeUpdate(likeList.get(i));
		}
		System.out.println("movieLike를 업데이트 성공");

		// movieReviews 업데이트할 idList를 가져온 후 update
		List<RankMovieVO> reviewList = dao.reviewMovieId();
		for (int i = 0; i < reviewList.size(); i++) {
			dao.reviewsUpdate(reviewList.get(i));
		}
		System.out.println("movieReviews를 업데이트 성공");

		// movieGrade 업데이트할 idList를 가져온 후 update
		List<RankMovieVO> gradeList = dao.gradeMovieId();
		for (int i = 0; i < gradeList.size(); i++) {
			dao.gradeUpdate(gradeList.get(i));
		}
		System.out.println("movieGrade를 업데이트 성공");
		/* movieLike, movieReviews, movieGrade 업데이트 완료 */

		// 랭킹을 업데이트할 idList를 가져옴
		List<RankMovieVO> idList = dao.movieIdList();
		for (int i = 0; i < idList.size(); i++) {
			dao.movieUpdate2(idList.get(i));
		}
		System.out.println("moviePopularity 업데이트 성공");
	}

	// 매일 3시간에 한번 씩 추천 되도록 설정(임시로 10분마다 한번씩 추천 리스트가 변경되도록 함)
	@Scheduled(cron = "0 */10 * * * *")
	public void autoReco() {
		System.out.println("==============================");
		System.out.println("reco_movie 테이블을 업데이트합니다");
		// reco_movie 테이블 항목 모두 삭제
		dao.recoMovieDel();
		
		// reco_movie 테이블에 랜덤 3개 항목 추가
		dao.recoMovieAdd();
	}
}