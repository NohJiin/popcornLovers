package com.java4.popcorn.movieGrade;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component
public class MovieGradeDAO {
	@Autowired
	SqlSessionTemplate my;
	
	  public void movieGrade(MovieGradeVO movieGradeVO) {
		    my.insert("movieGrade", movieGradeVO);
		  }
}
