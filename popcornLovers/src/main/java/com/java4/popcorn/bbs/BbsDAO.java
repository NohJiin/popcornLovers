package com.java4.popcorn.bbs;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.java4.popcorn.member.MemberVO;
import com.java4.popcorn.movieReview.MovieReviewVO;

@Component
public class BbsDAO {

	@Autowired
	SqlSessionTemplate my;

	/*
	 * public List<BbsVO> getList() { System.out.println("dao까지는 왔고~~"); List<BbsVO>
	 * list = my.selectList("Bbs.all"); return list; }
	 */

	// 게시물 페이징
	public List<BbsVO> all(BbspageVO vo) {
		return my.selectList("BbsDAO.paging", vo);
	}

	public List<BbsVO> all_list(BbspageVO vo) {
		return my.selectList("BbsDAO.all_list", vo);
	}

	// 페이지에 따른 해당 카테고리 게시물 불러오기
	public List<BbsVO> category_paging(CategoryVO vo) {
		return my.selectList("BbsDAO.category_paging", vo);
	}

	// 카테고리별 제목과 설명을 불러옴
	public List<CategoryVO> category_info(int bbs_cate_num) {
		return my.selectList("CategoryDAO.category_info", bbs_cate_num);
	}

	// l에 해당하는 게시물 번호를 가진 게시물의 상세 페이지를 보여줌
	public List<BbsVO> detail_post(HashMap<String, Integer> map) {
		return my.selectList("BbsDAO.detail_post", map);
	}

	// 게시물 개수 세기
	public int count() {
		return my.selectOne("BbsDAO.count");
	}

	// 해당 카테고리 게시물 개수 세기
	public int count_category(int bbs_cate_num) {
		return my.selectOne("BbsDAO.count_category", bbs_cate_num);
	}

	// 카테고리에서 페이지 1번 눌렀을 때의 게시물 목록을 보여줌
	public List<BbsVO> bbs_list_category(CategoryVO vo) {
		return my.selectList("BbsDAO.category_list", vo);
	}

	// 카테고리에서 게시물 상세 페이지 불러오기
	public List<BbsVO> detail_cate_post(BbsVO vo) {
		return my.selectList("BbsDAO.detail_cate_post", vo);
	}

	// 좋아요 클릭 여부 체크
	public int member_like_yesno(BbsVO vo) {
		try {
			Integer result = my.selectOne("BbsDAO.member_like_yesno", vo);
			if (result != null) {
				return result;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	// 게시물 삭제
	public int bbs_delete(BbsVO vo) {
		int result = my.update("BbsDAO.bbs_delete", vo);
		return result;
	}

	// 좋아요 누르기
	public int bbs_like_check(BbslikesVO vo) {
		int result = my.update("BbsDAO.like_check", vo);
		return result;
	}
	
	// 게시물 좋아요 증가
	public int bbs_like_plus(int bbs_no) {
		int result = my.update("BbsDAO.bbs_like_plus", bbs_no);
		return result;
	}

	// 좋아요 취소하기
	public int bbs_like_check_cancel(BbslikesVO vo) {
		int result = my.update("BbsDAO.like_check_cancel", vo);
		return result;
	}
	
	// 게시물 좋아요 감소
	public int bbs_like_minus(int bbs_no) {
		int result = my.update("BbsDAO.bbs_like_minus", bbs_no);
		return result;
	}
	
	// 게시물에 좋아요 db있는지 확인
	public int like_db_check(BbslikesVO vo) {
		int result = my.selectOne("BbsDAO.like_db_check", vo);
		return result;
	}
	
	// 게시물에 좋아요 db있는지 확인
	public int create_like_db(BbslikesVO vo) {
		int result = my.insert("BbsDAO.create_like_db", vo);
		return result;
	}
	
	//상세 게시물 클릭시 접속 유저 프로필 가져오기
	public List<MemberVO> getMemberProfile(String member_id) {
		List<MemberVO> result = my.selectList("BbsDAO.get_member_profile", member_id);
		return result;
	}
	
	// 게시물에 좋아요 db있는지 확인
	public int bbs_like_sum(int bbs_no) {
		int result = my.selectOne("BbsDAO.bbs_like_sum", bbs_no);
		return result;
	}

	public List<BbsVO> searchBBS(BbspageVO vo) {
		return my.selectList("BbsDAO.search", vo);
	}
	
	public List<BbsVO> searchAllBBS(BbspageVO vo) {
		return my.selectList("BbsDAO.searchAll", vo);
	}

	public void writeBbs(BbsVO bbsVO) {
		System.out.println("글입력 전 dto : " + bbsVO);
		my.insert("BbsDAO.writeArticle", bbsVO);
		System.out.println("글입력 후 dto : " + bbsVO);
		List<BbsfileVO> fileInfos = bbsVO.getFileInfos();
		if (fileInfos != null && !fileInfos.isEmpty()) {
			my.insert("BbsDAO.registerFile", bbsVO);
		}
	} 
	
	public int delete(int file_id) {
		return my.delete("BbsDAO.deleteFile", file_id);
	}

	@Transactional
	public void modifyBbs(BbsVO bbsVO, int[] deleteFiles) {
		my.update("BbsDAO.modifyBbs", bbsVO);
		System.out.println("글입력 후 dto : " + bbsVO);
		List<BbsfileVO> fileInfos = bbsVO.getFileInfos();
		if (fileInfos != null && !fileInfos.isEmpty()) {
			my.insert("BbsDAO.registerFile", bbsVO);
		}
		if(deleteFiles != null) {
			List<Integer> list = new ArrayList<>();
			for (int value : deleteFiles) {
			    list.add(value);
			}
			my.delete("BbsDAO.deleteFiles", deleteFiles);
		}
	}
	
	//게시물 조회수 카운트
	public int bbsview_cnt(int bbs_no) {
		return my.update("BbsDAO.bbsview_cnt", bbs_no);
	}
	
		//인기 좋아요 게시물 가져오기
		public List<BbsVO> best_bbslike() {
			List<BbsVO> result = my.selectList("BbsDAO.best_bbslike");
			return result;
		}	
	
		//인기 조회수 게시물 가져오기
		public List<BbsVO> best_bbsview_cnt() {
			List<BbsVO> result = my.selectList("BbsDAO.best_bbsview_cnt");
			return result;
		}
		
		//최신 게시물 가져오기
		public List<BbsVO> newest_bbs() {
			List<BbsVO> result = my.selectList("BbsDAO.newest_bbs");
			return result;
		}
		
		//최신 리뷰 가져오기
		public List<MovieReviewVO> newest_review() {
			List<MovieReviewVO> result = my.selectList("BbsDAO.newest_review");
			return result;
		}
}
