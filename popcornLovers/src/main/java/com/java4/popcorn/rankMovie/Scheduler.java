package com.java4.popcorn.rankMovie;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component("scheduler")	// scheduler 싱글톤 객체 생성
public class Scheduler {
	@Autowired
	RankMovieDAO dao;
	
	// 매일 오전12시 00분 00초에 자동으로 업데이트하는 스케줄러
	@Scheduled(cron = "0 0 0 * * *")
	public void autoUpdate() {
		System.out.println("오전 12시 00분 00초가 되어 영화 랭킹을 업데이트합니다.");
		List<String> list = dao.movieIdList();
		dao.movieUpdate(list);
	}
}