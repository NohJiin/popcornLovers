package com.java4.popcorn.mypage;

import java.util.List;

import com.java4.popcorn.member.MemberVO;

public interface MypageInterface {

	//회원 프로필 하나씩
	MemberVO selectOne(String member_id);

	//회원이 작성한 모든 게시글
	List<MypageVO> bbsAllList(PageVO vo);

	//회원이 작성한 모든 리뷰
	List<MypageVO> reviewAllList(PageVO vo);

	//회원의 찜 목록
	List<MypageVO> jjimAllList(PageVO vo);

	//회원의 평가 목록
	List<MypageVO> gradeAllList(PageVO vo);

	//회원이 작성한 게시글 갯수
	int bbsCount(PageVO vo);

	//회원이 작성한 리뷰 갯수
	int reviewCount(PageVO vo);

	//회원이 작성한 댓글 갯수
	int replyCount(PageVO vo);

	//회원이 작성한 대댓글 갯수
	int replyCount2(PageVO vo);

	//회원 찜 목록 갯수
	int jjimCount(PageVO vo);

	//찜 추가하기
	int addMovieJjim(MypageVO vo);

	//찜 삭제하기
	int removeMovieJjim(MypageVO vo);

	// 찜 클릭 여부 체크
	int jjim_Check(MypageVO vo);

	//회원 조회수
	int viewCount(String member_id);

	//영화 선택
	MypageVO movieSelectOne(String movieId);

}