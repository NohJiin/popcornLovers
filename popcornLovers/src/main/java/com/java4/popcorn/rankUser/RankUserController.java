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
	RankUserDAO dao;
	
	// 영화 전체 랭크 리스트 : 순위별
	@RequestMapping("rankUser/userRankAll")
	public void userRankAll(PageVO vo, Model model) {
		// member테블에 항목이 추가될 때마다 rankuser 테이블에도 추가
		int result = dao.userInsert();
		System.out.println(result + "개 추가됨");
		
//		// 변경된 사항 update하기
//		List<RankUserVO> idList = dao.memberIdList();
//		System.out.println("member rank update 실행");
//		for (int i = 0; i < idList.size(); i++) {
//			dao.memberUpdate2(idList.get(i));
//		}
		
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
		List<RankUserVO> list = dao.recoList();
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
	
//	// rankuser에서 삭제가 되는지 확인
//	@RequestMapping("rankUser/rankDel")
//	public void rankDel(String member_id, Model model) {
//		dao.rankDel(member_id);
//		model.addAttribute("member_id", member_id);
//	}
}