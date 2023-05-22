package com.java4.popcorn.bbs;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.IOException;
import java.util.List;


@Controller
public class CrawlerController {

	        @Autowired
	    	movienewscrawling movienewscrawling;
	        
	        @Autowired
	    	NewslistDAO dao;
	    	
	    	@Autowired
	    	SqlSessionTemplate my;

	    	@RequestMapping("/movie_news2")
	        public void movie_news() throws IOException {
	        	System.out.println("완료!@");
	    		List<NewslistVO> sl = movienewscrawling.getnewscrawling();
	        	for (int i = 0; i < sl.size(); i++) {
	        		dao.insertMovieNewsCroll(sl.get(i));
	        		System.out.println("완료!@@");
				}
	        }
	    	
	    }
