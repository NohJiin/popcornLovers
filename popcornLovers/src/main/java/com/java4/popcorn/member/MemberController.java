package com.java4.popcorn.member;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


@Controller
public class MemberController {

	@Autowired
	MemberInterface dao;
	
	
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
			dao.loginCount(vo.getMember_id());
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
	@RequestMapping("member/logout")
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
		
		return result;
	}
	
	// 닉네임 중복 확인
	@RequestMapping("member/knicknameCheck")
	@ResponseBody
	public int knicknameCheck(String member_knickname) {
		System.out.println(member_knickname);
		MemberVO vo2 = dao.knicknameCheck(member_knickname);
		System.out.println(vo2);

		int result = 1;
		if (vo2 == null) { // 같은 아이디가 없다면
			result = 0; // 사용 가능 아이디
		}
	
		System.out.println("result : "+result);
		return result;
	}
	
	
	// 아이디 비번 체크 
	@RequestMapping("member/memberCheck")
	public int memberCheck(MemberVO vo) {
		MemberVO vo2 = dao.memberCheck(vo);
		
		int result = 0; //
		if(vo2 != null) {
			
		}
		return result;
	}
	

	// 회원정보 수정
	@RequestMapping("member/update")
	public void update(MemberVO vo, HttpSession session) {
		System.out.println("update요청");
		dao.update(vo);
		session.invalidate(); //삭제를 하면서 세션 끊어주기
	}
	


	//회원 탈퇴하기
	@RequestMapping("member/remove")
	public void remove(@RequestParam("member_pw")String pw,
			//>> jsp에서 작성한 member_pw(name)값을 parameter로 받아와서 pw에 넣어오기
			Model model, HttpSession session) {
		
		int result = 0; //우선적으로 결과값을 회원의 정보 값이 있을 때로 염두 (아이디와 비밀번호가 일치하는 기본 값)
		
		//vo를 세션으로 잡았던 bag을 가지고 와서 로그인 한 대상의 정보 들고오기 
		// login 할 때 memberVO를 bag의 이름으로 세션 잡아서 넣어줬음 (참고*)
		MemberVO vo = (MemberVO)session.getAttribute("bag");
		//세션으로 잡은 vo에서 회원의 아이디와 패스워드 정보 String 값으로 들고오기'
		
		String id = vo.getMember_id();
		String pw2 = vo.getMember_pw();
		
		if(pw.equals(pw2)) { //input에 들어간 pw와 vo에 있는 pw가 동일하다면
			result = dao.remove(id); //해당 일치하는 id 삭제
			session.invalidate(); //삭제를 하면서 세션 끊어주기
		} 
		
		model.addAttribute("result",result); //결과값을 result 이름의 모델값에 넣어준다. 
	}

	
	
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
	
	//회원 프로필 이미지 설정
		@RequestMapping("member/profileUp")
		public String profileUp(MemberVO vo, HttpSession session,
				HttpServletRequest request, //경로 자동으로 구하기
				MultipartFile file,//이미지 받는 것
				Model model) throws Exception {
			String member_id = (String) session.getAttribute("member_id"); //id 값 들고오기
			String savedName = file.getOriginalFilename(); //파일의 이름을 가져다 줌 = savedname 에 집어넣음
			String uploadPath
						= request.getSession().getServletContext().getRealPath("resources/profile_img"); //경로를 자동으로 구해주기
			System.out.println(uploadPath);
			
			File target = new File(uploadPath + "/" + savedName); //파일 객체로 만들어주기
			file.transferTo(target); //파일을 해당 위치에 넣어라
			
			System.out.println("이미지 업로드 요청 :" + target);
			
			model.addAttribute("savedName", savedName);
			vo.setMember_img(savedName);
			vo.setMember_id(member_id); //아이디 값도 읽어서 넘겨줘야함
			
			System.out.println("img넣은 후>> " + vo);
			model.addAttribute("vo",vo);
			dao.profileUp(vo);
			
			return "redirect:../mypage/mypage?page=1";
		}
	
	
	
}
