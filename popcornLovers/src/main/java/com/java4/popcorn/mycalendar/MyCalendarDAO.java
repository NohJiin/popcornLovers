package com.java4.popcorn.mycalendar;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class MyCalendarDAO {

	@Autowired
	SqlSessionTemplate my;
	
	public List<MyCalendarVO> list1(MyCalendarVO vo) {
		List<MyCalendarVO> list1 = my.selectList("MyCalendarDAO.joinmycalendar", vo);
		return list1;
	}
	
	public int insert(MyCalendarVO vo) {
	    int result = my.insert("MyCalendarDAO.insertMyCalendar", vo);
	    return result;
	}
	
	public int delete(MyCalendarVO vo) {
		int result = my.delete("MyCalendarDAO.deletemycalendar", vo);
		return result;
	}
	
	public List<MyCalendarVO> list2(MyCalendarVO vo) {
		List<MyCalendarVO> list2 = my.selectList("MyCalendarDAO.joinmovielist");
		return list2;
		
	}

	
}
