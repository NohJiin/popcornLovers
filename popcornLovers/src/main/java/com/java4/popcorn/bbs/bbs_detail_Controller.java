package com.java4.popcorn.bbs;

import java.time.LocalDate;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class bbs_detail_Controller {

	@Autowired
	newsDAO dao;
	
	@Autowired
	NewslistDAO dao2;

	// private Logger logger = LoggerFactory.getLogger(this.getClass());

	@RequestMapping("news_cont")
	public void list(Model model) {

		System.out.println("list 요청됨.");
		System.out.println(dao2);
		List<NewslistVO> list = dao2.getNewsList();
		System.out.println(list.size());
		System.out.println(list.get(0));
		model.addAttribute("list", list);
	}

	@RequestMapping("bbs_all_List")
	public void list2(BbspageVO vo, Model model) {
		vo.setStartEnd(vo.getPage());
		List<BbsVO> list = dao.all_list(vo);
		System.out.println(list.size());
		model.addAttribute("list", list);
	}

	@RequestMapping("bbs_All")
	public void all2(BbspageVO vo, Model model) {
		vo.setStartEnd(vo.getPage());
		List<BbsVO> list = dao.all(vo);
		int count = dao.count();
		System.out.println("all count>> " + count);
		int pages = 0;
		if (count % 10 == 0) {
			pages = count / 10; // 전체 페이지 개수 구하기
		} else {
			pages = count / 10 + 1; // 전체 페이지 개수 구하기
		}
		model.addAttribute("list", list);
		model.addAttribute("count", count);
		model.addAttribute("pages", pages);
	}
	
	@RequestMapping("bbs_info_category")
	public void category_info(int bbs_cate_num, Model model) {
		List<CategoryVO> list = dao.category_info(bbs_cate_num);
		model.addAttribute("list", list);
	}

	/*
	 * @RequestMapping("bbs_list_allcategory") public void category_all(CategoryVO
	 * vo, Model model) { vo.setStartEnd(vo.getPage()); List<CategorypageVO> list =
	 * dao.bbs_list_category(vo); int count =
	 * dao.count_category(vo.getBbs_cate_name());
	 * System.out.println("category count>> " + count); int pages = 0; if (count %
	 * 10 == 0) { pages = count / 10; // 전체 페이지 개수 구하기 } else { pages = count / 10 +
	 * 1; // 전체 페이지 개수 구하기 } model.addAttribute("list2", list);
	 * model.addAttribute("count2", count); model.addAttribute("pages2", pages); }
	 */
	
	/*
	 * @RequestMapping("bbs_all_notice") public void bbs_all_notice(CategoryVO vo,
	 * Model model) { vo.setStartEnd(vo.getPage()); List<CategorypageVO> list =
	 * dao.bbs_list_category(vo); int count =
	 * dao.count_category(vo.getBbs_cate_name());
	 * System.out.println("category count>> " + count); int pages = 0; if (count %
	 * 10 == 0) { pages = count / 10; // 전체 페이지 개수 구하기 } else { pages = count / 10 +
	 * 1; // 전체 페이지 개수 구하기 } model.addAttribute("list2", list);
	 * model.addAttribute("count2", count); model.addAttribute("pages2", pages); }
	 */
	
	@RequestMapping("category_paging")
	public void list2(CategoryVO vo, Model model) {
		int page = vo.getPage();
		int count = dao.count_category(vo.getBbs_cate_num());
		int end = count - ((page-1)*10);
		int start = end - 9;
		if (start >= 0) {
			start = end - 9;
		} else {
			start = 1;
		}
		vo.setStart(start);
		vo.setEnd(end);
		List<CategorypageVO> list = dao.category_paging(vo);
		System.out.println(list.size());
		model.addAttribute("list2", list);
	}
	
	@RequestMapping("notice")
	public void notice(CategoryVO vo, Model model) {
		int page = vo.getPage();
		int count = dao.count_category(vo.getBbs_cate_num());
		int pages = 0;
		if (count % 10 == 0) {
			pages = count / 10; // 전체 페이지 개수 구하기
		} else {
			pages = count / 10 + 1; // 전체 페이지 개수 구하기
		}
		int end = count - ((page-1)*10);
		int start = end - 9;
		if (start >= 0) {
			start = end - 9;
		} else {
			start = 1;
		}
		vo.setStart(start);
		vo.setEnd(end);
		List<CategorypageVO> list = dao.bbs_list_category(vo);
		List<CategoryVO> info = dao.category_info(vo.getBbs_cate_num());
		System.out.println("category count>> " + count);
		model.addAttribute("list2", list);
		model.addAttribute("count2", count);
		model.addAttribute("pages2", pages);
		model.addAttribute("info2", info);
	}
	
	@RequestMapping("free")
	public void free(CategoryVO vo, Model model) {
		int page = vo.getPage();
		int count = dao.count_category(vo.getBbs_cate_num());
		int pages = 0;
		if (count % 10 == 0) {
			pages = count / 10; // 전체 페이지 개수 구하기
		} else {
			pages = count / 10 + 1; // 전체 페이지 개수 구하기
		}
		int end = count - ((page-1)*10);
		int start = end - 9;
		if (start >= 0) {
			start = end - 9;
		} else {
			start = 1;
		}
		vo.setStart(start);
		vo.setEnd(end);
		List<CategorypageVO> list = dao.bbs_list_category(vo);
		List<CategoryVO> info = dao.category_info(vo.getBbs_cate_num());
		System.out.println("category count>> " + count);
		model.addAttribute("list2", list);
		model.addAttribute("count2", count);
		model.addAttribute("pages2", pages);
		model.addAttribute("info2", info);
	}
	
	@RequestMapping("movietalk")
	public void movietalk(CategoryVO vo, Model model) {
		int page = vo.getPage();
		int count = dao.count_category(vo.getBbs_cate_num());
		int pages = 0;
		if (count % 10 == 0) {
			pages = count / 10; // 전체 페이지 개수 구하기
		} else {
			pages = count / 10 + 1; // 전체 페이지 개수 구하기
		}
		int end = count - ((page-1)*10);
		int start = end - 9;
		if (start >= 0) {
			start = end - 9;
		} else {
			start = 1;
		}
		vo.setStart(start);
		vo.setEnd(end);
		List<CategorypageVO> list = dao.bbs_list_category(vo);
		List<CategoryVO> info = dao.category_info(vo.getBbs_cate_num());
		System.out.println("category count>> " + count);
		model.addAttribute("list2", list);
		model.addAttribute("count2", count);
		model.addAttribute("pages2", pages);
		model.addAttribute("info2", info);
	}
	
	@RequestMapping("find")
	public void find(CategoryVO vo, Model model) {
		int page = vo.getPage();
		int count = dao.count_category(vo.getBbs_cate_num());
		int pages = 0;
		if (count % 10 == 0) {
			pages = count / 10; // 전체 페이지 개수 구하기
		} else {
			pages = count / 10 + 1; // 전체 페이지 개수 구하기
		}
		int end = count - ((page-1)*10);
		int start = end - 9;
		if (start >= 0) {
			start = end - 9;
		} else {
			start = 1;
		}
		vo.setStart(start);
		vo.setEnd(end);
		List<CategorypageVO> list = dao.bbs_list_category(vo);
		List<CategoryVO> info = dao.category_info(vo.getBbs_cate_num());
		System.out.println("category count>> " + count);
		model.addAttribute("list2", list);
		model.addAttribute("count2", count);
		model.addAttribute("pages2", pages);
		model.addAttribute("info2", info);
	}
	
	@RequestMapping("bungae")
	public void bungae(CategoryVO vo, Model model) {
		int page = vo.getPage();
		int count = dao.count_category(vo.getBbs_cate_num());
		int pages = 0;
		if (count % 10 == 0) {
			pages = count / 10; // 전체 페이지 개수 구하기
		} else {
			pages = count / 10 + 1; // 전체 페이지 개수 구하기
		}
		int end = count - ((page-1)*10);
		int start = end - 9;
		if (start >= 0) {
			start = end - 9;
		} else {
			start = 1;
		}
		vo.setStart(start);
		vo.setEnd(end);
		List<CategorypageVO> list = dao.bbs_list_category(vo);
		List<CategoryVO> info = dao.category_info(vo.getBbs_cate_num());
		System.out.println("category count>> " + count);
		model.addAttribute("list2", list);
		model.addAttribute("count2", count);
		model.addAttribute("pages2", pages);
		model.addAttribute("info2", info);
	}
	
	@RequestMapping("detail_post")
	public void detail_post(BbsVO vo, Model model) {
	    System.out.println(vo.getBbs_no());
	    List<BbsVO> list = dao.detail_post(vo.getBbs_no());
	    model.addAttribute("list2", list);
	}
	
	@RequestMapping("detail_cate_post")
	public void detail_cate_post(BbsVO vo, Model model) {
	    System.out.println(vo.getBbs_row_no());
	    List<BbsVO> list = dao.detail_cate_post(vo);
	    model.addAttribute("list2", list);
	}
	

//			@RequestMapping("bbs_list_category")
//			public void category_list(BbspageVO vo, String bbs_cate_name, Model model) {
//				vo.setStartEnd(vo.getPage());
//				List<TalkDTO> list = dao.bbs_list_category(vo);
//				model.addAttribute("list", list);
//				model.addAttribute("count", count);
//				model.addAttribute("pages", pages);
//			}
//			category_list

//			@RequestMapping("bbs_list_category")
//			public void category_list(int bbs_cate_num, Model model) {
//			List<TalkDTO> list = dao.category(bbs_cate_name);
//			int count = dao.count();
//			System.out.println("all count>> " + count);
//			int pages = 0;
//			if (count%10 == 0) {
//				pages = count / 10; //전체 페이지 개수 구하기 
//			} else {
//				pages = count / 10 + 1; //전체 페이지 개수 구하기 
//			}
//			model.addAttribute("list", list);
//			model.addAttribute("count", count);
//			model.addAttribute("pages", pages);
//		}

}
