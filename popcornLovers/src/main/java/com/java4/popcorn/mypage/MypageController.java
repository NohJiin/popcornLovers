package com.java4.popcorn.mypage;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.java4.popcorn.member.MemberDAO;
import com.java4.popcorn.member.MemberVO;
import com.java4.popcorn.movieInfo.MovieInfoVO;

@Controller
public class MypageController {

	@Autowired
	MypageDAO dao;

	//회원 활동 내역 레벨 값 가져오기
	//@RequestMapping("")
	public void memberLevel(PageVO vo, Model model, HttpSession session) {
		String member_id = (String) session.getAttribute("member_id");
		vo.setMember_id(member_id);
		int bbsCount = dao.bbsCount(vo);
		int reviewCount = dao.reviewCount(vo);
		int replyCount = dao.replyCount(vo);
		int replyCount2 = dao.replyCount2(vo);
		
		model.addAttribute("bbsCount", bbsCount);
		model.addAttribute("reviewCount", reviewCount);
		model.addAttribute("replyCount", replyCount);
		model.addAttribute("replyCount2", replyCount2);
		
		System.out.println(bbsCount);
	}
	
	
	// 회원이 작성한 게시글(첫 페이지) + 리뷰(첫 페이지)
	// mypage 버튼 클릭시 바로 출력되는 controller
	@RequestMapping("mypage/mypage")
	public void bbsListFirst(PageVO vo, Model model, HttpSession session) {
		String member_id = (String) session.getAttribute("member_id"); // member_id 세션 값 잡아두기 - String으로 id 잡기!
		vo.setStartEnd(vo.getPage());
		vo.setMember_id(member_id);

		// bbs
		int bbsCount = dao.bbsCount(vo);// 작성한 bbs 몇개인지 알기
		int bbsPages = bbsCount / 10 + 1; // bbs 10개씩 넣은 페이지 갯수

		List<MypageVO> bbsAllList = dao.bbsAllList(vo);// member_id로 해당 list들 들고오기

		// review
		int reviewCount = dao.reviewCount(vo);// 작성한 review 몇개인지 알기
		int reviewPages = reviewCount / 10 + 1; // bbs 10개씩 넣은 페이지 갯수
		List<MypageVO> reviewAllList = dao.reviewAllList(vo);// member_id로 해당 list들 들고오기

		// jjim
		int jjimCount = dao.jjimCount(vo);
		int jjimPages = jjimCount / 10 + 1;
		List<MypageVO> jjumAllList = dao.jjimAllList(vo);
		
		
		dao.viewCount(member_id); //프로필 조회수
		
		// model에 넣어주자
		model.addAttribute("bbsAllList", bbsAllList);
		model.addAttribute("bbsCount", bbsCount);
		model.addAttribute("bbsPages", bbsPages);

		model.addAttribute("reviewAllList", reviewAllList);
		model.addAttribute("reviewCount", reviewCount);
		model.addAttribute("reviewPages", reviewPages);
		
		model.addAttribute("jjimCount", jjimCount);
		model.addAttribute("jjimPages",  jjimPages);
		model.addAttribute("jjimAllList", jjumAllList);
		
		MemberVO memberVO  = dao.selectOne(member_id);
		model.addAttribute("memberVO", memberVO);
	}


	// 회원이 작성한 게시글(나머지 페이지를 처리)
	@RequestMapping("mypage/mybbs2")
	public void bbsListOther(PageVO vo, Model model, HttpSession session) {
		String member_id = (String) session.getAttribute("member_id"); // member_id 세션 값 잡아두기 - String으로 id 잡기!
		vo.setStartEnd(vo.getPage());
		vo.setMember_id(member_id);

		List<MypageVO> bbsAllList = dao.bbsAllList(vo);// member_id로 해당 list들 들고오기

		model.addAttribute("bbsAllList", bbsAllList);// model에 넣어주자
	}

	
	// 회원이 작성한 리뷰(나머지 페이지를 처리)
	@RequestMapping("mypage/myreview2")
	public void reviewListOther(PageVO vo, Model model, HttpSession session) {
		String member_id = (String) session.getAttribute("member_id"); // member_id 세션 값 잡아두기 - String으로 id 잡기!
		vo.setStartEnd(vo.getPage());
		vo.setMember_id(member_id);

		List<MypageVO> reviewAllList = dao.reviewAllList(vo);// member_id로 해당 list들 들고오기

		model.addAttribute("reviewAllList", reviewAllList);// model에 넣어주자
	}

	
	//mypage 각자 프로필+++++++++++++++++++++++++++++++++++++++++++++++++++++++
	@RequestMapping("mypage/mypageOne")
	public void mypageOne(PageVO vo, Model model, String member_id) {
		vo.setStartEnd(vo.getPage());
		MemberVO bag = dao.selectOne(member_id);

		// bbs
		int bbsCount = dao.bbsCount(vo);// 작성한 bbs 몇개인지 알기
		int bbsPages = bbsCount / 10 + 1; // bbs 10개씩 넣은 페이지 갯수

		List<MypageVO> bbsAllList = dao.bbsAllList(vo);// member_id로 해당 list들 들고오기

		// review
		int reviewCount = dao.reviewCount(vo);// 작성한 review 몇개인지 알기
		int reviewPages = reviewCount / 10 + 1; // bbs 10개씩 넣은 페이지 갯수
		List<MypageVO> reviewAllList = dao.reviewAllList(vo);// member_id로 해당 list들 들고오기

		// jjim
				int jjimCount = dao.jjimCount(vo);
				int jjimPages = jjimCount / 10 + 1;
				List<MypageVO> jjumAllList = dao.jjimAllList(vo);
		
		dao.viewCount(member_id); //프로필 조회수
		
		// model에 넣어주자
		model.addAttribute("bbsAllList", bbsAllList);
		model.addAttribute("bbsCount", bbsCount);
		model.addAttribute("bbsPages", bbsPages);

		model.addAttribute("reviewAllList", reviewAllList);
		model.addAttribute("reviewCount", reviewCount);
		model.addAttribute("reviewPages", reviewPages);
		
		model.addAttribute("jjimCount", jjimCount);
		model.addAttribute("jjimPages",  jjimPages);
		model.addAttribute("jjimAllList", jjumAllList);
		
		model.addAttribute("bag", bag);
		System.out.println("작성한 bbs 수 " + bbsAllList.size());
		System.out.println("작성한 reivew 수 " + reviewAllList.size());
		System.out.println("작성한 jjim 수 " + jjumAllList.size());
		
		//회원 이미지 뿌려주기 위해서 memberVO 모델로 지정해서 가지고 오기
		MemberVO memberVO  = dao.selectOne(member_id);
		model.addAttribute("memberVO", memberVO);
	}

	// 회원이 작성한 게시글(나머지 페이지를 처리) + 다른 사람이 보는 회원 프로필 
	@RequestMapping("mypage/mybbs3")
	public void bbsListOtherOne(PageVO vo, Model model, String member_id) {
		vo.setStartEnd(vo.getPage());
		vo.setMember_id(member_id);

		List<MypageVO> bbsAllList = dao.bbsAllList(vo);// member_id로 해당 list들 들고오기

		model.addAttribute("bbsAllList", bbsAllList);// model에 넣어주자
	}

	// 회원이 작성한 리뷰(나머지 페이지를 처리) + 다른 사람이 보는 회원 프로필 
	@RequestMapping("mypage/myreview3")
	public void reviewListOtherOne(PageVO vo, Model model, String member_id) {
		vo.setStartEnd(vo.getPage());
		vo.setMember_id(member_id);

		List<MypageVO> reviewAllList = dao.reviewAllList(vo);// member_id로 해당 list들 들고오기

		model.addAttribute("reviewAllList", reviewAllList);// model에 넣어주자
	}
	
	
	
	
	// 찜 추가 하기(빈 하트 >> 꽉찬 하트)
//	@RequestMapping("mypage/addmoviejjim")
//	public void addMovieJjim(MypageVO vo, HttpSession session) {
//	    String member_id = (String) session.getAttribute("member_id"); // 로그인한 회원 세션
//	    String movieId = vo.getMovieId(); // 선택한 movieId 값
//
//	    MypageVO movieInfo = dao.movieSelectOne(movieId); // dao에서 movie id값 읽어오기
//
//	    if (member_id != null) { // 로그인이 되었을 때
//	        int result = dao.addMovieJjim(movieInfo.getMovieId(), member_id); // 찜 추가 실행
//	        if (result > 0) { // 찜 추가가 성공되면
//	            session.setAttribute("jjimStatus_" + movieId, "liked"); // 세션에 찜한 영화 상태 정보 저장
//	            System.out.println("추가 성공" + result);
//	        } else { // 찜 추가가 실패
//	            System.out.println("추가 실패" + result);
//	        }
//	    } else {
//	        // 로그인이 되지 않았을 때
//	        System.out.println("로그인 여부 확인");
//	    }
//	}

	
	// 찜 삭제하기(꽉찬 하트 >> 빈 하트)
	@RequestMapping("mypage/removemoviejjim")
	public void removeMovieJjim(MypageVO vo, HttpSession session) {
		String member_id = (String) session.getAttribute("member_id");//로그인한 회원 세션
	    String movieId = vo.getMovieId(); // 선택한 movieId 값
	    
	    vo.setMember_id(member_id);
	    dao.removeMovieJjim(vo);
	    session.removeAttribute("jjimStatus_" + movieId);
	}

	//마이페이지로 이동하기
//	@RequestMapping("mypage/mypageGO")
//	public String mypage(Model model) {
//		System.out.println("dd");
//		model.addAttribute("page",1);
//		return "mypage/mypage";
//	}

}
