package com.java4.popcorn.mypage;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class MypageDAO {

	@Autowired
	SqlSessionTemplate my;


	
	//?��?��?�� ?��?��?�� 모든 게시�?
	public List<MypageVO> bbsAllList(PageVO vo) { //member_id�? ?��?��?���?
		List<MypageVO> bbsAllList = my.selectList("MypageDAO.myBbsAll", vo); //pageVO?�� ?��?��?��?�� vo?��?�� 꺼내�?
		System.out.println("?��?���??�� 보이?�� bbs �??�� : " + bbsAllList.size()); //bbs �??��
		return  bbsAllList;
	}

	//?��?��?�� ?��?��?�� 모든 리뷰
	public List<MypageVO> reviewAllList(PageVO vo) { //member_id�? ?��?��?���?
		List<MypageVO> reviewAllList = my.selectList("MypageDAO.myReviewAll", vo); //pageVO?�� ?��?��?��?�� vo?��?�� 꺼내�?
		System.out.println("?��?���??�� 보이?�� review �??�� : " + reviewAllList.size()); //bbs �??��
		return  reviewAllList;
	}
	
	//?��?��?�� ?��?��?�� 게시�? �??��
	public int bbsCount(PageVO vo) {
		return my.selectOne("MypageDAO.myBbsCount",vo);
	}

	//?��?��?�� ?��?��?�� 리뷰 �??��
	public int reviewCount(PageVO vo) {
		return my.selectOne("MypageDAO.myReviewCount",vo);
	}
	
}
