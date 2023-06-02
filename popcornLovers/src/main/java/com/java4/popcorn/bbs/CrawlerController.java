package com.java4.popcorn.bbs;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;
import java.util.List;


@Controller
public class CrawlerController {

	        @Autowired
	    	movienewscrawling movienewscrawling;
	        
	        @Autowired
	    	NewslistDAO dao;
	        
	        @Autowired
	    	BbsDAO dao2;
	    	
	    	@Autowired
	    	SqlSessionTemplate my;

	    	@RequestMapping("/movie_news2")
	        public void movie_news() throws IOException {
	        	//System.out.println("완료!@");
	    		List<NewslistVO> sl = movienewscrawling.getnewscrawling();
	        	for (int i = 0; i < sl.size(); i++) {
	        		dao.insertMovieNewsCroll(sl.get(i));
	        		//System.out.println("완료!@@");
				}
	        }
	    	
	    	@RequestMapping("bbs/main")
	        public void getNewsList(Model model) {
	    		List<NewslistVO> news = dao.getNewsList();
	    		System.out.println(news.size());
	    		model.addAttribute("news", news);
	    		List<BbsVO> likes = dao2.best_bbslike();
	    		List<BbsVO> hits = dao2.best_bbsview_cnt();
	    		List<BbsVO> newest_bbs = dao2.newest_bbs();
	    		model.addAttribute("likes", likes);
	    		model.addAttribute("hits", hits);
	    		model.addAttribute("newest_bbs",newest_bbs);
	        }
	    	
	    	
	    	@RequestMapping("bbs/getNewsAllList")
	        public void getNewsAllList(Model model) {
	    		List<NewslistVO> list = dao.getNewsAllList();
	    		System.out.println(list.size());
	    		model.addAttribute("list", list);
	        }
	    	
	    }
