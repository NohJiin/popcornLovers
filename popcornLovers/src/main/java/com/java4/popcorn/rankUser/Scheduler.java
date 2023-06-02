package com.java4.popcorn.rankUser;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component("schedulerMember")	// scheduler 싱글톤 객체 생성
public class Scheduler {
	@Autowired
	RankUserDAO dao;
	
	// 매일 오전12시 00분 00초에 랭킹 페이지가 업데이트 되도록 설정
	@Scheduled(cron = "0 40 18 * * *")
	public void autoUpdate() {
		System.out.println("오전 12시 00분 00초가 되었으므로 랭킹 업데이트를 시작합니다.");
		List<RankUserVO> idList = dao.memberIdList();
		System.out.println("movie rank update 실행");
		for (int i = 0; i < idList.size(); i++) {
			dao.memberUpdate2(idList.get(i));
		}
	}
}