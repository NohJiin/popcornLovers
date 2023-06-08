package com.java4.popcorn.rankUser;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.java4.popcorn.rankMovie.RankMovieVO;

@Controller
public class RankUserController {
	@Autowired
	RankUserInter dao;
	
	// 영화 전체 랭크 리스트 : 순위별
	@RequestMapping("rankUser/userRankAll")
	public void userRankAll(PageVO vo, Model model) {
		// member테블에 항목이 추가될 때마다 rankuser 테이블에도 추가
		int result1 = dao.userInsert();
		System.out.println("rankuser 테이블에 memberId " + result1 + "개 추가됨");
		// member테블에 항목이 추가될 때마다 member_point 테이블에도 추가
		int result2 = dao.pointMemberInsert();
		System.out.println("movie_point 테이블에 memberId " + result2 + "개 추가됨");
		
		vo.setStartEnd(vo.getPage());
		System.out.println("userRank list 실행");
		List<RankUserVO> list = dao.all(vo);
		int count = dao.count();
		System.out.println("all count>> " + count);
		int pages = count / 10 + 1; //전체 페이지 개수 구하기 
		model.addAttribute("list", list);
		model.addAttribute("count", count);
		model.addAttribute("pages", pages);
	}
	
	@RequestMapping("rankUser/userRankList")
	public void userRankList(PageVO vo, Model model) {
		vo.setStartEnd(vo.getPage());
		List<RankUserVO> list = dao.list(vo);
		model.addAttribute("list", list);
	}
	
	
	// 추천 멤버 리스트 : 전체 목록 => 이것도 스케줄링해서 2-3시간?마다 한번씩 업데이트 되도록하기
	@RequestMapping("rankUser/recoUser")
	public void userReco(Model model) {
		System.out.println("userReco list 실행");
		List<RankUserVO> list = dao.recoMemberList();
		// reco_member 테이블에 항목이 없을 경우 스케줄러와 상관 없이 추가해줌
		if (list.size() == 0) {
			dao.recoMemberAdd();	// 값을 랜덤으로 가져오기
			list = dao.recoMemberList();	// 추가된 값을 리스트로 불러오기
			System.out.println("Controller단계에서 reco_member테이블에 항목 추가됨");
		}
		model.addAttribute("list", list);
	}
	
	
	// top3 항목 가져오기
	@RequestMapping("rankUser/userTop3")
	public void selectTop(Model model) {
		RankUserVO top1 = dao.selectTop(1);
		RankUserVO top2 = dao.selectTop(2);
		RankUserVO top3 = dao.selectTop(3);
		model.addAttribute("top1", top1);
		model.addAttribute("top2", top2);
		model.addAttribute("top3", top3);
	}
	
}