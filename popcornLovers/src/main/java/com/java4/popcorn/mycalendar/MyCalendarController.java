package com.java4.popcorn.mycalendar;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MyCalendarController {
	@Autowired
	MyCalendarDAO dao;

	@RequestMapping("mycalendar/mycalendarmain") //연도와 월, 멤버id를 넣고, 연도와 월, 일, 영화제목을 리스트로 가져오기
	public String list1(@RequestParam("year") int year, @RequestParam("month") int month, @RequestParam("day") int day,
			 HttpSession session, Model model) {

		String member_id = (String) session.getAttribute("member_id");

		MyCalendarVO vo = new MyCalendarVO();
		
		vo.setYear(year);
		System.out.println(year + "연도 불러오기 완료");
		vo.setMonth(month);
		System.out.println(month + "월 불러오기 완료");
		vo.setDay(day);
		System.out.println(day + "일 불러오기 완료");
		vo.setMember_id(member_id);
		System.out.println(member_id + "memberid 불러오기 완료");
		System.out.println(vo);

		List<MyCalendarVO> list1 = dao.list1(vo);
		model.addAttribute("list1", list1);
		System.out.println(list1+"리스트 내용");
        return "mycalendarview/mycalendarlist";
	}
	
	@RequestMapping("mycalendar") //전체 영화의 아이디와 영화제목을 리스트로 가져오기
	public String list2(Model model) {
		
		MyCalendarVO vo = new MyCalendarVO();
		
		List<MyCalendarVO> list2 = dao.list2(vo);
		model.addAttribute("list2", list2);
		System.out.println(list2+"리스트내용");
        return "mycalendarview/movielist";
	}

	@RequestMapping("mycalendar/mycalendarcrud") //날짜정보를 받아서, 멤버id와 영화id를 insert함
	public String insert(@RequestParam("year") int year, @RequestParam("month") int month, @RequestParam("day") int day,
			@RequestParam("movieId") String movieId, HttpSession session, Model model) {

		String member_id = (String) session.getAttribute("member_id");

		MyCalendarVO vo = new MyCalendarVO();

		vo.setYear(year);
		System.out.println(year + "연도 불러오기 완료");
		vo.setMonth(month);
		System.out.println(month + "월 불러오기 완료");
		vo.setDay(day);
		System.out.println(day + "일 불러오기 완료");
		vo.setMovieId(movieId);
		System.out.println(movieId + "영화id 불러오기 완료");
		vo.setMember_id(member_id);
		System.out.println(member_id + "멤버id 불러오기 완료");

		System.out.println(vo);
		int result = dao.insert(vo);
		if (result == 1) {
			System.out.println("등록 성공 : " + vo);
			return "redirect:mycalendarmain.jsp?yy=" + year + "&mm=" + month; //해당달력으로 이동
		} else {
			;
			System.out.println("등록 실패 : " + vo);
			return "redirect:mycalendarcrud.jsp";
		}
	}

	@RequestMapping("mycalendar/mycalendardelete") //날짜정보와 멤버id를 받아서 해당 날짜의 데이터를 delete함
	public String delete(@RequestParam("year") int year, @RequestParam("month") int month, @RequestParam("day") int day,
			HttpSession session, Model model) {
		String member_id = (String) session.getAttribute("member_id");

		MyCalendarVO vo = new MyCalendarVO();

		vo.setYear(year);
		System.out.println(year + "연도 불러오기 완료");
		vo.setMonth(month);
		System.out.println(month + "월 불러오기 완료");
		vo.setDay(day);
		System.out.println(day + "일 불러오기 완료");
		vo.setMember_id(member_id);
		System.out.println(member_id + "멤버ID 불러오기 완료");

		System.out.println(vo);
		int result = dao.delete(vo);
		if (result == 1) {
			System.out.println("삭제 성공 : " + vo);
			return "redirect:mycalendarmain.jsp?yy=" + year + "&mm=" + month; // 해당 달력으로 이동
		} else {
			;
			System.out.println("삭제 실패 : " + vo);
			return "redirect:mycalendardelete.jsp";
		}
	}

}
