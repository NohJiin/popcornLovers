package com.java4.popcorn.rankActor;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RankActorController {
	@Autowired
	RankActorDAO dao;
	
	// 배우 전체 랭크 리스트 : 순위별
	@RequestMapping("rankActor/actorRankAll")
	public void actorRank(PageVO vo, Model model) {
		vo.setStartEnd(vo.getPage());
		System.out.println("actorRank list실행");
		List<RankActorVO> list = dao.all(vo);
		int count = dao.count();
		System.out.println("all count>> " + count);
		int pages = count / 10 + 1; //전체 페이지 개수 구하기 
		model.addAttribute("list", list);
		model.addAttribute("count", count);
		model.addAttribute("pages", pages);
	}
	
	@RequestMapping("rankActor/actorRankList")
	public void actorRankList(PageVO vo, Model model) {
		vo.setStartEnd(vo.getPage());
		List<RankActorVO> list = dao.list(vo);
		model.addAttribute("list", list);
	}
	
	
	@RequestMapping("rankActor/actorTop3")
	public void actorSelectOne(Model model) {
		RankActorVO top1 = dao.selectTop(1);
		RankActorVO top2 = dao.selectTop(2);
		RankActorVO top3 = dao.selectTop(3);
		model.addAttribute("top1", top1);
		model.addAttribute("top2", top2);
		model.addAttribute("top3", top3);
	}
}