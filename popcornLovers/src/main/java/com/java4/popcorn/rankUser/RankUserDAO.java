package com.java4.popcorn.rankUser;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java4.popcorn.rankMovie.RankMovieVO;

@Component
public class RankUserDAO {
//    @Autowired
//    GeneralDAO<RankUserVO> dao;
    
    @Autowired
    SqlSessionTemplate my;

    // rankUser 테이블에 없는 항목을 member 테이블에서 가져와 insert
    public int userInsert() {
		int result = my.insert("RankUserDAO.userInsert");
		return result;
	}
    
    // 하나만 검색 : rank_no = #{rank_no} 인 항목 찾아 가져옴
    public RankUserVO selectTop(int rank_no) {
		RankUserVO bag = my.selectOne("RankUserDAO.selectTop", rank_no);
		return bag;
	}
    
    
//    /* 스케줄러 시작 */
//    
//    // memeber_id가 담긴 리스트를 전달받아 update시키기
//    public void memberUpdate(List<RankUserVO> list) {
//  		my.update("RankUserDAO.rankUpdate2", list);
//  	}
//    
//    // for문 사용해서 update 테스트
//    public void memberUpdate2(RankUserVO bag) {
//    	my.update("RankUserDAO.rankUpdate3", bag);
//    }
//    
//    // update된 항목을 랭킹 정해진대로 가져오는지 확인
//    public List<RankUserVO> testAll() {
//		List<RankUserVO> list = my.selectList("RankUserDAO.testAll");
//		return list;
//	}
//    /* 스케줄러 끝 */
    
    
    /* 페이징 시작 */
    // 전체 목록 : 순위별
    public List<RankUserVO> all(PageVO vo) {
		List<RankUserVO> list = my.selectList("RankUserDAO.all", vo);
		return list;
	}
    
    public List<RankUserVO> list(PageVO vo) {
    	List<RankUserVO> list = my.selectList("RankUserDAO.list", vo);
    	return list;
    }
    
    // member 개수 count
    public int count() {
		return my.selectOne("RankUserDAO.count");
	}
    /* 페이징 끝 */
    
    
    // 상위 20개 중에서 랜덤으로 3개 가져오기
    public List<RankUserVO> recoList() {
    	List<RankUserVO> list = my.selectList("RankUserDAO.recoList");
    	return list;
    }
    
    // member 테이블에서 삭제된 id와 동일한 아이디를 rankuser 테이블에서도 삭제
    public void rankDel(String member_id) {
		my.delete("RankUserDAO.rankDel", member_id);
	}

    // 전체 memeber_id를 담은 리스트 가져오기
    public List<RankUserVO> memberIdList() {
    	List<RankUserVO> list = my.selectList("RankUserDAO.memberIdList");
    	return list;
    }
    
	/* rankuser 랭킹 값 업데이트 */
    // member에 있는 member_id 값을 member_point 테이블에 insert into
    public int pointMemberInsert() {
		return my.insert("RankUserDAO.pointMemberInsert");
	}
    
    // 게시글, 댓글, 리뷰, 별점을 등록한 사람의 아이디 리스트 가져오기
    // 게시글
    public List<RankUserVO> bbsIdList() {
		return my.selectList("RankUserDAO.bbsIdList");
	}
    // 댓글
    public List<RankUserVO> commentIdList() {
    	return my.selectList("RankUserDAO.commentIdList");
    }
    // 리뷰
    public List<RankUserVO> reviewIdList() {
    	return my.selectList("RankUserDAO.reviewIdList");
    }
    // 별점
    public List<RankUserVO> gradeIdList() {
    	return my.selectList("RankUserDAO.gradeIdList");
    }
    // 조회수
    public List<RankUserVO> hitsIdList() {
    	return my.selectList("RankUserDAO.hitsIdList");
    }
    
//    // member_point 컬럼 값 업데이트 => for문 사용해야함
//    public void pointMemberUpdate(RankUserVO bag) {
//		my.update("RankUserDAO.pointMemberUpdate", bag);
//	}
    
    // member_point 컬럼 값 업데이트
    // bbs
    public void bbsUpdate(RankUserVO bag) {
		my.update("RankUserDAO.bbsUpdate", bag);
	}
    // comment
    public void commentUpdate(RankUserVO bag) {
    	my.update("RankUserDAO.commentUpdate", bag);
    }
    // review
    public void reviewUpdate(RankUserVO bag) {
    	my.update("RankUserDAO.reviewUpdate", bag);
    }
    // grade
    public void gradeUpdate(RankUserVO bag) {
    	my.update("RankUserDAO.gradeUpdate", bag);
    }
    // hits
    public void hitsUpdate(RankUserVO bag) {
    	my.update("RankUserDAO.hitsUpdate", bag);
    }
    
    // rankuser에 memberPopularity값 업데이트 => for문 사용해야함
    public void rankUpdate(RankUserVO bag) {
		my.update("RankUserDAO.rankUpdate", bag);
	}
    
    
    // reco_member 테이블에 랜덤 3가지 추가하기
    public void recoMemberAdd() {
		my.insert("RankUserDAO.recoMemberAdd");
	}
    
 	// reco_member 테이블에 있는 항목 가져오기
    public List<RankUserVO> recoMemberList() {
		 return my.selectList("RankUserDAO.recoMemberList");
	}
    
 	// reco_member 테이블 모두 삭제
    public void recoMemberDel() {
		my.delete("RankUserDAO.recoMemberDel");
	}
}