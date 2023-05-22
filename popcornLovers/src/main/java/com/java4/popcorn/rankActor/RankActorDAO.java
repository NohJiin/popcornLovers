package com.java4.popcorn.rankActor;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class RankActorDAO {
    
    @Autowired
    SqlSessionTemplate my;

    /* 페이징 */
	// 전체 목록 : 순위별
    public List<RankActorVO> all(PageVO vo) {
    	List<RankActorVO> list = my.selectList("RankActorDAO.all", vo);
		return list;
	}
    
    public List<RankActorVO> list(PageVO vo) {
    	List<RankActorVO> list = my.selectList("RankActorDAO.list", vo);
    	return list;
    }
    
    // actor 전체 수
    public int count() {
		return my.selectOne("RankActorDAO.count");
	}
    
    /* 페이징 끝 */
    
    
    // 하나만 검색 : rank_no = #{rank_no} 인 항목 찾아 가져옴
    public RankActorVO selectTop(int rank_no) {
    	RankActorVO bag = my.selectOne("RankActorDAO.selectTop", rank_no);
    	return bag;
    }
}