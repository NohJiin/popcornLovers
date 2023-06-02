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

    // rankUser ���̺� ���� �� member ���̺��� ������ insert
    public int userInsert() {
		int result = my.insert("RankUserDAO.userInsert");
		return result;
	}
    
    // ���ϴ� ������ ���� �������� (top 1, 2, 3)
    public RankUserVO selectTop(int rank_no) {
		RankUserVO bag = my.selectOne("RankUserDAO.selectTop", rank_no);
		return bag;
	}
    
    
    /* 스케줄러 시작 */
    // memeber_id를 담은 리스트 가져오기
    public List<RankUserVO> memberIdList() {
    	List<RankUserVO> list = my.selectList("RankUserDAO.memberIdList");
    	return list;
    }
    
    // memeber_id가 담긴 리스트를 전달받아 update시키기
    public void memberUpdate(List<RankUserVO> list) {
  		my.update("RankUserDAO.rankUpdate2", list);
  	}
    
    // for문 사용해서 update 테스트
    public void memberUpdate2(RankUserVO bag) {
    	my.update("RankUserDAO.rankUpdate3", bag);
    }
    
    // update된 항목을 랭킹 정해진대로 가져오는지 확인
    public List<RankUserVO> testAll() {
		List<RankUserVO> list = my.selectList("RankUserDAO.testAll");
		return list;
	}
    /* 스케줄러 끝 */
    
    
    /* ����¡ */
    // ��ü ��� : ������
    public List<RankUserVO> all(PageVO vo) {
		List<RankUserVO> list = my.selectList("RankUserDAO.all", vo);
		return list;
	}
    
    public List<RankUserVO> list(PageVO vo) {
    	List<RankUserVO> list = my.selectList("RankUserDAO.list", vo);
    	return list;
    }
    
    // member ��ü ��
    public int count() {
		return my.selectOne("RankUserDAO.count");
	}
    
    /* ����¡ �� */
    
    // ���� ��� ���� ��õ �׸� �� �� 
    public List<RankUserVO> recoList() {
    	List<RankUserVO> list = my.selectList("RankUserDAO.recoAll");
    	return list;
    }

}