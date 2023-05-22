package com.java4.popcorn.rankUser;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RankUserController {
	@Autowired
	RankUserDAO dao;
	
//	@RequestMapping("rankUser/userInsert")
//	public void userInsert() {
//		System.out.println("userInsert 실행");
//		int result = dao.userInsert();
//		System.out.println(result + "개 추가됨");
//	}
	
	// 전체목록 : 순위별
	@RequestMapping("rankUser/userRankAll")
	public void userRankAll(PageVO vo, Model model) {
		// member에 회원이 추가되면 rankuser 테이블에도 추가되도록 함
		int result = dao.userInsert();
		System.out.println(result + "개 추가됨");
		
		vo.setStartEnd(vo.getPage());
		System.out.println("userRank list실행");
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
	
	
	// 추천 사용자 리스트 : 전체 목록
	@RequestMapping("rankUser/recoUser")
	public void userReco(Model model) {
		System.out.println("userReco list실행");
		List<RankUserVO> list = dao.recoList();
		model.addAttribute("list", list);
	}
	
	@RequestMapping("rankUser/userTop3")
	public void selectTop(Model model) {
		RankUserVO top1 = dao.selectTop(1);	// 1위
		RankUserVO top2= dao.selectTop(2);	// 2위
		RankUserVO top3 = dao.selectTop(3);	// 3위
		model.addAttribute("top1", top1);
		model.addAttribute("top2", top2);
		model.addAttribute("top3", top3);
	}
}