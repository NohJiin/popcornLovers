package com.java4.popcorn.member;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


@Controller
public class MemberController {

	@Autowired
	MemberDAO dao;
	
	
	// 회원가입
	@RequestMapping("member/join")
	public String insert(MemberVO vo) {
		System.out.println(vo);
		int result = dao.insert(vo);
		if (result == 1) { // 회원가입 성공
			return "redirect:login.jsp";
		} else { // 회원가입 실패
			return "redirect:join.jsp";
		}
	}

	// 로그인
	@RequestMapping("member/login")
	public String login(String member_id, MemberVO vo, HttpSession session, Model model) {
		String result = dao.login(vo);
		//member_id 값으로 불러온 데이터들 vo2에 넣어주기
		//-> 해당하는 member의 다른 vo값들을 EL로 쓰려고
		MemberVO vo2 = dao.selectOne(member_id); 
		if (result != null) {
			// 로그인 성공
			session.setAttribute("member_id", vo.getMember_id());// ★세션잡아둔것
			session.setAttribute("member_knickname", result);// list를 불러오려면 view 아래에 파일이 있어야함으로 닉네임 값을 넣어주기		
			session.setAttribute("bag", vo2);
			return "redirect:../Main.jsp"; // views 아래 파일 이름.jsp
		} else {
			// 로그인 실패
			return "redirect:login.jsp"; // redirect : 방향을 다시 바꾸다
		}
	}

	// 로그아웃
	@RequestMapping("../member/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:../Main.jsp";
	}

	
	// 아이디 중복 확인
	@RequestMapping("member/idCheck")
	@ResponseBody
	public int idCheck(String member_id) {
		System.out.println(member_id);
		MemberVO vo2 = dao.idCheck(member_id);
		System.out.println(vo2);

		int result = 1;
		if (vo2 == null) { // 같은 아이디가 없다면
			result = 0; // 사용 가능 아이디
		}
	
		System.out.println("result : "+result);
		return result;
	}

	// 회원정보 수정
	@RequestMapping("member/update")
	public void update(MemberVO vo) {
		System.out.println("update요청");
		System.out.println(vo);
		dao.update(vo);
	}
//
//	// 회원 탈퇴
//	@RequestMapping("member/remove")
//	public String name(MemberVO vo, HttpSession session) {
//		System.out.println("delete 요청됨");
//		String result = dao.remove(vo);
//		if (result) {
//
//		}
//	}

	// 회원전체 리스트
	@RequestMapping("member/list")
	public void list(Model model) {
		List<MemberVO> list = dao.list();
		System.out.println("list요청");
		model.addAttribute("list", list);
	}
	
	//회원 한명 리스트
	@RequestMapping("member/one")
	public void selectOne(String member_id, Model model) {
		MemberVO bag = dao.selectOne(member_id);
		model.addAttribute("bag", bag);
	}
	

}
