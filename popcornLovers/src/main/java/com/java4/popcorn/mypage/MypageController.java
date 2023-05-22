package com.java4.popcorn.mypage;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MypageController {

	@Autowired
	MypageDAO dao;
	
	//?��?��?�� ?��?��?�� 게시�?
	@RequestMapping("mypage/mybbsAll")
	public void bbsList2(PageVO vo,Model model, HttpSession session) { 
		String member_id = (String)session.getAttribute("member_id"); //member_id ?��?�� �? ?��?��?���? - String?���? id ?���?!
		vo.setStartEnd(vo.getPage());
		vo.setMember_id(member_id);
		
		List<MypageVO> bbsAllList = dao.bbsAllList(vo);//member_id�? ?��?�� list?�� ?��고오�?
		System.out.println("bbsList: "+bbsAllList);
		model.addAttribute("bbsAllList",bbsAllList);
	}
	
	//?��?��?�� ?��?��?�� 게시�?(�? ?��?���?) + 리뷰(�? ?��?���?)
	//mypage 버튼 ?���??�� 바로 출력?��?�� controller
	@RequestMapping("mypage/mypage")
	public void bbsListFirst(PageVO vo,Model model, HttpSession session) {  
		String member_id = (String)session.getAttribute("member_id"); //member_id ?��?�� �? ?��?��?���? - String?���? id ?���?!
		vo.setStartEnd(vo.getPage()); 
		vo.setMember_id(member_id);
		System.out.println(vo);
		
		//bbs
		int bbsCount = dao.bbsCount(vo);//?��?��?�� bbs 몇개?���? ?���?
		System.out.println("bbs all count: " + bbsCount);
		
		int bbsPages = bbsCount / 10 + 1; // bbs 10개씩 ?��?? ?��?���? �??��
		System.out.println("bbs all pages: " + bbsPages);
		
		List<MypageVO> bbsAllList = dao.bbsAllList(vo);//member_id�? ?��?�� list?�� ?��고오�?
		System.out.println("bbsList: "+bbsAllList);
		
		//review
		int reviewCount = dao.reviewCount(vo);//?��?��?�� review 몇개?���? ?���?
		System.out.println("review all count: " + reviewCount);
		
		int reviewPages = reviewCount / 10 + 1; // bbs 10개씩 ?��?? ?��?���? �??��
		System.out.println("review all pages: " + reviewPages);
		
		List<MypageVO> reviewAllList = dao.reviewAllList(vo);//member_id�? ?��?�� list?�� ?��고오�?
		System.out.println("reviewList: "+ reviewAllList);
		
		//model?�� ?��?��주자
		model.addAttribute("bbsAllList",bbsAllList);
		model.addAttribute("bbsCount",bbsCount);
		model.addAttribute("bbsPages",bbsPages);
		
		model.addAttribute("reviewAllList",reviewAllList);
		model.addAttribute("reviewCount",reviewCount);
		model.addAttribute("reviewPages",reviewPages);
	}
	
	
	//?��?��?�� ?��?��?�� 게시�?(?��머�? ?��?���?�? 처리)
	@RequestMapping("mypage/mybbs2")
	public void bbsListOther(PageVO vo,Model model, HttpSession session) {  
		String member_id = (String)session.getAttribute("member_id"); //member_id ?��?�� �? ?��?��?���? - String?���? id ?���?!
		vo.setStartEnd(vo.getPage()); 
		vo.setMember_id(member_id);
		System.out.println(vo);
		
		List<MypageVO> bbsAllList = dao.bbsAllList(vo);//member_id�? ?��?�� list?�� ?��고오�?
		System.out.println("bbsList: "+bbsAllList);
		
		model.addAttribute("bbsAllList",bbsAllList);//model?�� ?��?��주자
	}
	
	
	//?��?��?�� ?��?��?�� 리뷰(?��머�? ?��?���?�? 처리)
	@RequestMapping("mypage/myreview2")
	public void reviewListOther(PageVO vo,Model model, HttpSession session) {  
		String member_id = (String)session.getAttribute("member_id"); //member_id ?��?�� �? ?��?��?���? - String?���? id ?���?!
		vo.setStartEnd(vo.getPage()); 
		vo.setMember_id(member_id);
		System.out.println(vo);
		
		List<MypageVO> reviewAllList = dao.reviewAllList(vo);//member_id�? ?��?�� list?�� ?��고오�?
		System.out.println("reviewList: "+reviewAllList);
		
		model.addAttribute("reviewAllList",reviewAllList);//model?�� ?��?��주자
	}
	
	//?��?��?�� ?��?�� 찜목�?
	public void movieJjim() {
		
	}
	
//	//마이?��?���?�? ?��?��?���?
//	@RequestMapping("mypage/mypageGO")
//	public String mypage() {
//		return "mypage/mypage";
//	}
	
}
