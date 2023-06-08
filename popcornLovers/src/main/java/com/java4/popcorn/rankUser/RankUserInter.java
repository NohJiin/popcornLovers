package com.java4.popcorn.rankUser;

import java.util.List;

public interface RankUserInter {

	// rankUser 테이블에 없는 항목을 member 테이블에서 가져와 insert
	int userInsert();

	// 하나만 검색 : rank_no = #{rank_no} 인 항목 찾아 가져옴
	RankUserVO selectTop(int rank_no);

	/* 페이징 시작 */
	// 전체 목록 : 순위별
	List<RankUserVO> all(PageVO vo);

	List<RankUserVO> list(PageVO vo);

	// member 개수 count
	int count();
	/* 페이징 끝 */

	// 상위 20개 중에서 랜덤으로 3개 가져오기
	List<RankUserVO> recoList();

	// member 테이블에서 삭제된 id와 동일한 아이디를 rankuser 테이블에서도 삭제
	void rankDel(String member_id);

	// 전체 memeber_id를 담은 리스트 가져오기
	List<RankUserVO> memberIdList();

	/* rankuser 랭킹 값 업데이트 */
	// member에 있는 member_id 값을 member_point 테이블에 insert into
	int pointMemberInsert();

	// 게시글, 댓글, 리뷰, 별점을 등록한 사람의 아이디 리스트 가져오기
	// 게시글
	List<RankUserVO> bbsIdList();

	// 댓글
	List<RankUserVO> commentIdList();

	// 리뷰
	List<RankUserVO> reviewIdList();

	// 별점
	List<RankUserVO> gradeIdList();

	// 조회수
	List<RankUserVO> hitsIdList();

	// member_point 컬럼 값 업데이트
	// bbs
	void bbsUpdate(RankUserVO bag);

	// comment
	void commentUpdate(RankUserVO bag);

	// review
	void reviewUpdate(RankUserVO bag);

	// grade
	void gradeUpdate(RankUserVO bag);

	// hits
	void hitsUpdate(RankUserVO bag);

	// rankuser에 memberPopularity값 업데이트 => for문 사용해야함
	void rankUpdate(RankUserVO bag);
	/* rankuser 랭킹 값 업데이트 끝 */

	// reco_member 테이블에 랜덤 3가지 추가하기
	void recoMemberAdd();

	// reco_member 테이블에 있는 항목 가져오기
	List<RankUserVO> recoMemberList();

	// reco_member 테이블 모두 삭제
	void recoMemberDel();

}