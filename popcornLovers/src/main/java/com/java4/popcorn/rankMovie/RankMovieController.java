package com.java4.popcorn.rankMovie;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RankMovieController {
	@Autowired
	RankMovieDAO dao;
	
	@Autowired
	Scheduler sd;
	
	// 영화 전체 랭크 리스트 : 순위별
	@RequestMapping("rankMovie/movieRankAll")
	public void movieRank(PageVO vo, Model model) {
		// movie테블에 항목이 추가될 때마다 rankmovie 테이블에도 추가
		int result = dao.movieInsert();
		System.out.println(result + "개 추가됨");
		
		vo.setStartEnd(vo.getPage());
		System.out.println("movieRank list 실행");
		List<RankMovieVO> list = dao.all(vo);
		int count = dao.count();
		System.out.println("all count>> " + count);
		int pages = count / 10 + 1; //전체 페이지 개수 구하기
		model.addAttribute("list", list);
		model.addAttribute("count", count);
		model.addAttribute("pages", pages);
	}
	
	@RequestMapping("rankMovie/movieRankList")
	public void userRankList(PageVO vo, Model model) {
		vo.setStartEnd(vo.getPage());
		List<RankMovieVO> list = dao.list(vo);
		model.addAttribute("list", list);
	}
	
	/* mapper에서 update문이 실행되는지 확인 */
	// movieId 리스트를 가져오는지 테스트
	@RequestMapping("rankMovie/movieIdTest")
	public void movieIdList(Model model) {
		List<RankMovieVO> list = dao.movieIdList();
		model.addAttribute("list", list);
	}
	
	// 새로고침
	@RequestMapping("rankMovie/movieUpdate")
	public String movieUpdate(Model model) {
		return "../../rank/rankMovieMain";
	}
	/* mapper에서 update문이 실행되는지 테스트 끝 */
	
	
	// 추천 영화 리스트 : 전체 목록 => 이것도 스케줄링해서 2-3시간?마다 한번씩 업데이트 되도록하기
	@RequestMapping("rankMovie/recoMovie")
	public void movieReco(RankMovieVO bag, Model model) {
		System.out.println("movieReco list 실행");
		List<RankMovieVO> list = dao.recoMovieList();
		// reco_movie 테이블에 항목이 없을 경우 스케줄러와 상관 없이 추가해줌
		if (list.size() == 0) {
			dao.recoMovieAdd();	// 값을 랜덤으로 가져오기
			list = dao.recoMovieList();	// 추가된 값을 리스트로 불러오기
			System.out.println("Controller단계에서 reco_movie테이블에 항목 추가됨");
		}
		model.addAttribute("list", list);
	}
	
	
	// top3 항목 가져오기
	@RequestMapping("rankMovie/movieTop3")
	public void actorSelectOne(Model model) {
		RankMovieVO top1 = dao.selectTop(1);
		RankMovieVO top2 = dao.selectTop(2);
		RankMovieVO top3 = dao.selectTop(3);
		model.addAttribute("top1", top1);
		model.addAttribute("top2", top2);
		model.addAttribute("top3", top3);
	}
}