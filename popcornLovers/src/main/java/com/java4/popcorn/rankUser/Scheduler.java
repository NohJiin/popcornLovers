package com.java4.popcorn.rankUser;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component("schedulerMember")	// scheduler 싱글톤 객체 생성
public class Scheduler {
	@Autowired
	RankUserDAO dao;
	
	/* 매일 오전12시 00분 00초에 랭킹 페이지가 업데이트 되도록 설정 - 임시로 10분마다 업데이트 되도록 설정 */ 
	// member_point 항목을 업데이트 + user랭킹 업데이트
	@Scheduled(cron = "0 */5 * * * *")
	public void userRankUpdate() {
		System.out.println("==============================");
		System.out.println("유저 랭킹 업데이트를 시작합니다.");
		/* member_point 컬럼 값을 업데이트 시작 */
		// 게시물 개수 업데이트
		List<RankUserVO> bbsidList = dao.bbsIdList();
		for (int i = 0; i < bbsidList.size(); i++) {
			dao.bbsUpdate(bbsidList.get(i));
		}
		System.out.println("bbs_count 업데이트 성공");
		
		// 댓글 개수 업데이트
		List<RankUserVO> commentidList = dao.commentIdList();
		for (int i = 0; i < commentidList.size(); i++) {
			System.out.println(commentidList.get(i));
			dao.commentUpdate(commentidList.get(i));
		}
		System.out.println("b_comment_count 업데이트 성공");
		
		// 리뷰 개수 업데이트
		List<RankUserVO> reviewidList = dao.reviewIdList();
		for (int i = 0; i < reviewidList.size(); i++) {
			dao.reviewUpdate(reviewidList.get(i));
		}
		System.out.println("review_count 업데이트 성공");
		
		// 별점 개수 업데이트
		List<RankUserVO> gradeidList = dao.gradeIdList();
		for (int i = 0; i < gradeidList.size(); i++) {
			dao.gradeUpdate(gradeidList.get(i));
		}
		System.out.println("grade_count 업데이트 성공");
		
		// 조회수 개수 업데이트
		List<RankUserVO> hitsidList = dao.hitsIdList();
		for (int i = 0; i < hitsidList.size(); i++) {
			dao.hitsUpdate(hitsidList.get(i));
		}
		System.out.println("hits_count 업데이트 성공");
		/* member_point 컬럼 값을 업데이트 끝 */
		
		// rankuser 테이블의 memberPopularity값 업데이트
		List<RankUserVO> idList = dao.memberIdList();
		for (int i = 0; i < idList.size(); i++) {
			dao.rankUpdate(idList.get(i));
		}
		System.out.println("memberPopularity 업데이트 성공");
	}
	
	// 매일 3시간에 한번 씩 추천 되도록 설정(임시로 10분마다 한번씩 추천 리스트가 변경되도록 함)
	@Scheduled(cron = "0 */10 * * * *")
	public void autoReco() {
		System.out.println("==============================");
		System.out.println("reco_member 테이블을 업데이트합니다");
		// reco_member 테이블 항목 모두 삭제
		dao.recoMemberDel();
		
		// reco_member 테이블에 랜덤 3개 항목 추가
		dao.recoMemberAdd();
	}
}