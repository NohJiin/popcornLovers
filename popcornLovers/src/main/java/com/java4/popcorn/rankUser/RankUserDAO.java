package com.java4.popcorn.rankUser;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class RankUserDAO {
//    @Autowired
//    GeneralDAO<RankUserVO> dao;
    
    @Autowired
    SqlSessionTemplate my;

    // rankUser 테이블에 없는 값 member 테이블에서 가져와 insert
    public int userInsert() {
		int result = my.insert("RankUserDAO.userInsert");
		return result;
	}
    
    // 원하는 순위의 정보 가져오기 (top 1, 2, 3)
    public RankUserVO selectTop(int rank_no) {
		RankUserVO bag = my.selectOne("RankUserDAO.selectTop", rank_no);
		return bag;
	}
    
    /* 페이징 */
    // 전체 목록 : 순위별
    public List<RankUserVO> all(PageVO vo) {
		List<RankUserVO> list = my.selectList("RankUserDAO.all", vo);
		return list;
	}
    
    public List<RankUserVO> list(PageVO vo) {
    	List<RankUserVO> list = my.selectList("RankUserDAO.list", vo);
    	return list;
    }
    
    // member 전체 수
    public int count() {
		return my.selectOne("RankUserDAO.count");
	}
    
    /* 페이징 끝 */
    
    // 순위 상관 없이 추천 항목 몇 개 
    public List<RankUserVO> recoList() {
    	List<RankUserVO> list = my.selectList("RankUserDAO.recoAll");
    	return list;
    }

}