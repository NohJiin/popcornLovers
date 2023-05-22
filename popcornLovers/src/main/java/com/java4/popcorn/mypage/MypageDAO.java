package com.java4.popcorn.mypage;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class MypageDAO {

	@Autowired
	SqlSessionTemplate my;


	
	//???΄ ??±? λͺ¨λ  κ²μκΈ?
	public List<MypageVO> bbsAllList(PageVO vo) { //member_idλ‘? ?‘??€κΈ?
		List<MypageVO> bbsAllList = my.selectList("MypageDAO.myBbsAll", vo); //pageVO? ?£??Ό? vo?? κΊΌλ΄κΈ?
		System.out.println("??΄μ§?? λ³΄μ΄? bbs κ°?? : " + bbsAllList.size()); //bbs κ°??
		return  bbsAllList;
	}

	//???΄ ??±? λͺ¨λ  λ¦¬λ·°
	public List<MypageVO> reviewAllList(PageVO vo) { //member_idλ‘? ?‘??€κΈ?
		List<MypageVO> reviewAllList = my.selectList("MypageDAO.myReviewAll", vo); //pageVO? ?£??Ό? vo?? κΊΌλ΄κΈ?
		System.out.println("??΄μ§?? λ³΄μ΄? review κ°?? : " + reviewAllList.size()); //bbs κ°??
		return  reviewAllList;
	}
	
	//???΄ ??±? κ²μκΈ? κ°??
	public int bbsCount(PageVO vo) {
		return my.selectOne("MypageDAO.myBbsCount",vo);
	}

	//???΄ ??±? λ¦¬λ·° κ°??
	public int reviewCount(PageVO vo) {
		return my.selectOne("MypageDAO.myReviewCount",vo);
	}
	
}
