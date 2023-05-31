package com.java4.popcorn.bbs;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component
public class NewslistDAO { //CRUD

		@Autowired
		SqlSessionTemplate my;
		
		//controller에서 리스트에 있는 vo 값을 하나씩 커내서 dao에 insert 함.
		 public int insertMovieNewsCroll(NewslistVO NewslistVO) {
			 int result = my.insert("NewslistDAO.create", NewslistVO);
			 //System.out.println("완료!!!");
			 return result;
		    }

		 public List<NewslistVO> getNewsList() {
			 List<NewslistVO> result = my.selectList("NewslistDAO.getNewsList");
			 //System.out.println("완료!!!");
			 return result;
		    }
		 
		 public List<NewslistVO> getNewsAllList() {
			 List<NewslistVO> result = my.selectList("NewslistDAO.getNewsAllList");
			 //System.out.println("완료!!!");
			 return result;
		    }
		 
}