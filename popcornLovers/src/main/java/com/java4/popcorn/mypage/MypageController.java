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
	
	//?šŒ?›?´ ?‘?„±?•œ ê²Œì‹œê¸?
	@RequestMapping("mypage/mybbsAll")
	public void bbsList2(PageVO vo,Model model, HttpSession session) { 
		String member_id = (String)session.getAttribute("member_id"); //member_id ?„¸?…˜ ê°? ?¡?•„?‘ê¸? - String?œ¼ë¡? id ?¡ê¸?!
		vo.setStartEnd(vo.getPage());
		vo.setMember_id(member_id);
		
		List<MypageVO> bbsAllList = dao.bbsAllList(vo);//member_idë¡? ?•´?‹¹ list?“¤ ?“¤ê³ ì˜¤ê¸?
		System.out.println("bbsList: "+bbsAllList);
		model.addAttribute("bbsAllList",bbsAllList);
	}
	
	//?šŒ?›?´ ?‘?„±?•œ ê²Œì‹œê¸?(ì²? ?˜?´ì§?) + ë¦¬ë·°(ì²? ?˜?´ì§?)
	//mypage ë²„íŠ¼ ?´ë¦??‹œ ë°”ë¡œ ì¶œë ¥?˜?Š” controller
	@RequestMapping("mypage/mypage")
	public void bbsListFirst(PageVO vo,Model model, HttpSession session) {  
		String member_id = (String)session.getAttribute("member_id"); //member_id ?„¸?…˜ ê°? ?¡?•„?‘ê¸? - String?œ¼ë¡? id ?¡ê¸?!
		vo.setStartEnd(vo.getPage()); 
		vo.setMember_id(member_id);
		System.out.println(vo);
		
		//bbs
		int bbsCount = dao.bbsCount(vo);//?‘?„±?•œ bbs ëª‡ê°œ?¸ì§? ?•Œê¸?
		System.out.println("bbs all count: " + bbsCount);
		
		int bbsPages = bbsCount / 10 + 1; // bbs 10ê°œì”© ?„£?? ?˜?´ì§? ê°??ˆ˜
		System.out.println("bbs all pages: " + bbsPages);
		
		List<MypageVO> bbsAllList = dao.bbsAllList(vo);//member_idë¡? ?•´?‹¹ list?“¤ ?“¤ê³ ì˜¤ê¸?
		System.out.println("bbsList: "+bbsAllList);
		
		//review
		int reviewCount = dao.reviewCount(vo);//?‘?„±?•œ review ëª‡ê°œ?¸ì§? ?•Œê¸?
		System.out.println("review all count: " + reviewCount);
		
		int reviewPages = reviewCount / 10 + 1; // bbs 10ê°œì”© ?„£?? ?˜?´ì§? ê°??ˆ˜
		System.out.println("review all pages: " + reviewPages);
		
		List<MypageVO> reviewAllList = dao.reviewAllList(vo);//member_idë¡? ?•´?‹¹ list?“¤ ?“¤ê³ ì˜¤ê¸?
		System.out.println("reviewList: "+ reviewAllList);
		
		//model?— ?„£?–´ì£¼ì
		model.addAttribute("bbsAllList",bbsAllList);
		model.addAttribute("bbsCount",bbsCount);
		model.addAttribute("bbsPages",bbsPages);
		
		model.addAttribute("reviewAllList",reviewAllList);
		model.addAttribute("reviewCount",reviewCount);
		model.addAttribute("reviewPages",reviewPages);
	}
	
	
	//?šŒ?›?´ ?‘?„±?•œ ê²Œì‹œê¸?(?‚˜ë¨¸ì? ?˜?´ì§?ë¥? ì²˜ë¦¬)
	@RequestMapping("mypage/mybbs2")
	public void bbsListOther(PageVO vo,Model model, HttpSession session) {  
		String member_id = (String)session.getAttribute("member_id"); //member_id ?„¸?…˜ ê°? ?¡?•„?‘ê¸? - String?œ¼ë¡? id ?¡ê¸?!
		vo.setStartEnd(vo.getPage()); 
		vo.setMember_id(member_id);
		System.out.println(vo);
		
		List<MypageVO> bbsAllList = dao.bbsAllList(vo);//member_idë¡? ?•´?‹¹ list?“¤ ?“¤ê³ ì˜¤ê¸?
		System.out.println("bbsList: "+bbsAllList);
		
		model.addAttribute("bbsAllList",bbsAllList);//model?— ?„£?–´ì£¼ì
	}
	
	
	//?šŒ?›?´ ?‘?„±?•œ ë¦¬ë·°(?‚˜ë¨¸ì? ?˜?´ì§?ë¥? ì²˜ë¦¬)
	@RequestMapping("mypage/myreview2")
	public void reviewListOther(PageVO vo,Model model, HttpSession session) {  
		String member_id = (String)session.getAttribute("member_id"); //member_id ?„¸?…˜ ê°? ?¡?•„?‘ê¸? - String?œ¼ë¡? id ?¡ê¸?!
		vo.setStartEnd(vo.getPage()); 
		vo.setMember_id(member_id);
		System.out.println(vo);
		
		List<MypageVO> reviewAllList = dao.reviewAllList(vo);//member_idë¡? ?•´?‹¹ list?“¤ ?“¤ê³ ì˜¤ê¸?
		System.out.println("reviewList: "+reviewAllList);
		
		model.addAttribute("reviewAllList",reviewAllList);//model?— ?„£?–´ì£¼ì
	}
	
	//?šŒ?›?˜ ?˜?™” ì°œëª©ë¡?
	public void movieJjim() {
		
	}
	
//	//ë§ˆì´?˜?´ì§?ë¡? ?´?™?•˜ê¸?
//	@RequestMapping("mypage/mypageGO")
//	public String mypage() {
//		return "mypage/mypage";
//	}
	
}
