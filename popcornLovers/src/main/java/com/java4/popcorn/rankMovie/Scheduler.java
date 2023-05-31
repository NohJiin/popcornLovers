package com.java4.popcorn.rankMovie;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component("scheduler")	// scheduler �̱��� ��ü ����
public class Scheduler {
	@Autowired
	RankMovieDAO dao;
	
	// ���� ����12�� 00�� 00�ʿ� �ڵ����� ������Ʈ�ϴ� �����ٷ�
	@Scheduled(cron = "0 0 0 * * *")
	public void autoUpdate() {
		System.out.println("���� 12�� 00�� 00�ʰ� �Ǿ� ��ȭ ��ŷ�� ������Ʈ�մϴ�.");
		List<String> list = dao.movieIdList();
		dao.movieUpdate(list);
	}
}