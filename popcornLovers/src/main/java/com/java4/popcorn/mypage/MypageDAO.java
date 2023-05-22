package com.java4.popcorn.mypage;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class MypageDAO {

	@Autowired
	SqlSessionTemplate my;


	
	//?šŒ?›?´ ?‘?„±?•œ ëª¨ë“  ê²Œì‹œê¸?
	public List<MypageVO> bbsAllList(PageVO vo) { //member_idë¡? ?¡?•„?˜¤ê¸?
		List<MypageVO> bbsAllList = my.selectList("MypageDAO.myBbsAll", vo); //pageVO?— ?„£?—ˆ?œ¼?‹ˆ vo?—?„œ êº¼ë‚´ê¸?
		System.out.println("?˜?´ì§??— ë³´ì´?Š” bbs ê°??ˆ˜ : " + bbsAllList.size()); //bbs ê°??ˆ˜
		return  bbsAllList;
	}

	//?šŒ?›?´ ?‘?„±?•œ ëª¨ë“  ë¦¬ë·°
	public List<MypageVO> reviewAllList(PageVO vo) { //member_idë¡? ?¡?•„?˜¤ê¸?
		List<MypageVO> reviewAllList = my.selectList("MypageDAO.myReviewAll", vo); //pageVO?— ?„£?—ˆ?œ¼?‹ˆ vo?—?„œ êº¼ë‚´ê¸?
		System.out.println("?˜?´ì§??— ë³´ì´?Š” review ê°??ˆ˜ : " + reviewAllList.size()); //bbs ê°??ˆ˜
		return  reviewAllList;
	}
	
	//?šŒ?›?´ ?‘?„±?•œ ê²Œì‹œê¸? ê°??ˆ˜
	public int bbsCount(PageVO vo) {
		return my.selectOne("MypageDAO.myBbsCount",vo);
	}

	//?šŒ?›?´ ?‘?„±?•œ ë¦¬ë·° ê°??ˆ˜
	public int reviewCount(PageVO vo) {
		return my.selectOne("MypageDAO.myReviewCount",vo);
	}
	
}
