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
	
	//???΄ ??±? κ²μκΈ?
	@RequestMapping("mypage/mybbsAll")
	public void bbsList2(PageVO vo,Model model, HttpSession session) { 
		String member_id = (String)session.getAttribute("member_id"); //member_id ?Έ? κ°? ?‘??κΈ? - String?Όλ‘? id ?‘κΈ?!
		vo.setStartEnd(vo.getPage());
		vo.setMember_id(member_id);
		
		List<MypageVO> bbsAllList = dao.bbsAllList(vo);//member_idλ‘? ?΄?Ή list?€ ?€κ³ μ€κΈ?
		System.out.println("bbsList: "+bbsAllList);
		model.addAttribute("bbsAllList",bbsAllList);
	}
	
	//???΄ ??±? κ²μκΈ?(μ²? ??΄μ§?) + λ¦¬λ·°(μ²? ??΄μ§?)
	//mypage λ²νΌ ?΄λ¦?? λ°λ‘ μΆλ ₯?? controller
	@RequestMapping("mypage/mypage")
	public void bbsListFirst(PageVO vo,Model model, HttpSession session) {  
		String member_id = (String)session.getAttribute("member_id"); //member_id ?Έ? κ°? ?‘??κΈ? - String?Όλ‘? id ?‘κΈ?!
		vo.setStartEnd(vo.getPage()); 
		vo.setMember_id(member_id);
		System.out.println(vo);
		
		//bbs
		int bbsCount = dao.bbsCount(vo);//??±? bbs λͺκ°?Έμ§? ?κΈ?
		System.out.println("bbs all count: " + bbsCount);
		
		int bbsPages = bbsCount / 10 + 1; // bbs 10κ°μ© ?£?? ??΄μ§? κ°??
		System.out.println("bbs all pages: " + bbsPages);
		
		List<MypageVO> bbsAllList = dao.bbsAllList(vo);//member_idλ‘? ?΄?Ή list?€ ?€κ³ μ€κΈ?
		System.out.println("bbsList: "+bbsAllList);
		
		//review
		int reviewCount = dao.reviewCount(vo);//??±? review λͺκ°?Έμ§? ?κΈ?
		System.out.println("review all count: " + reviewCount);
		
		int reviewPages = reviewCount / 10 + 1; // bbs 10κ°μ© ?£?? ??΄μ§? κ°??
		System.out.println("review all pages: " + reviewPages);
		
		List<MypageVO> reviewAllList = dao.reviewAllList(vo);//member_idλ‘? ?΄?Ή list?€ ?€κ³ μ€κΈ?
		System.out.println("reviewList: "+ reviewAllList);
		
		//model? ?£?΄μ£Όμ
		model.addAttribute("bbsAllList",bbsAllList);
		model.addAttribute("bbsCount",bbsCount);
		model.addAttribute("bbsPages",bbsPages);
		
		model.addAttribute("reviewAllList",reviewAllList);
		model.addAttribute("reviewCount",reviewCount);
		model.addAttribute("reviewPages",reviewPages);
	}
	
	
	//???΄ ??±? κ²μκΈ?(?λ¨Έμ? ??΄μ§?λ₯? μ²λ¦¬)
	@RequestMapping("mypage/mybbs2")
	public void bbsListOther(PageVO vo,Model model, HttpSession session) {  
		String member_id = (String)session.getAttribute("member_id"); //member_id ?Έ? κ°? ?‘??κΈ? - String?Όλ‘? id ?‘κΈ?!
		vo.setStartEnd(vo.getPage()); 
		vo.setMember_id(member_id);
		System.out.println(vo);
		
		List<MypageVO> bbsAllList = dao.bbsAllList(vo);//member_idλ‘? ?΄?Ή list?€ ?€κ³ μ€κΈ?
		System.out.println("bbsList: "+bbsAllList);
		
		model.addAttribute("bbsAllList",bbsAllList);//model? ?£?΄μ£Όμ
	}
	
	
	//???΄ ??±? λ¦¬λ·°(?λ¨Έμ? ??΄μ§?λ₯? μ²λ¦¬)
	@RequestMapping("mypage/myreview2")
	public void reviewListOther(PageVO vo,Model model, HttpSession session) {  
		String member_id = (String)session.getAttribute("member_id"); //member_id ?Έ? κ°? ?‘??κΈ? - String?Όλ‘? id ?‘κΈ?!
		vo.setStartEnd(vo.getPage()); 
		vo.setMember_id(member_id);
		System.out.println(vo);
		
		List<MypageVO> reviewAllList = dao.reviewAllList(vo);//member_idλ‘? ?΄?Ή list?€ ?€κ³ μ€κΈ?
		System.out.println("reviewList: "+reviewAllList);
		
		model.addAttribute("reviewAllList",reviewAllList);//model? ?£?΄μ£Όμ
	}
	
	//??? ?? μ°λͺ©λ‘?
	public void movieJjim() {
		
	}
	
//	//λ§μ΄??΄μ§?λ‘? ?΄??κΈ?
//	@RequestMapping("mypage/mypageGO")
//	public String mypage() {
//		return "mypage/mypage";
//	}
	
}
