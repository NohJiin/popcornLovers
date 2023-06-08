package com.java4.popcorn.mypage;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java4.popcorn.bbs.BbsVO;
import com.java4.popcorn.member.MemberVO;
import com.java4.popcorn.movieInfo.MovieInfoVO;

@Component
public class MypageDAO implements MypageInterface {

	@Autowired
	SqlSessionTemplate my;


	
	//회원 프로필 하나씩
    @Override
	public MemberVO selectOne(String member_id) {
		MemberVO bag = my.selectOne("MemberDAO.selectOne",member_id);
		return bag;
	}
	
	//회원이 작성한 모든 게시글
	@Override
	public List<MypageVO> bbsAllList(PageVO vo) {//member_id로 잡아오기
		List<MypageVO> bbsAllList = my.selectList("MypageDAO.myBbsAll", vo); //pageVO에 넣었으니 vo에서 꺼내기
		System.out.println("페이지에 보이는 bbs 갯수 : " + bbsAllList.size()); 
		return  bbsAllList;
	}

	//회원이 작성한 모든 리뷰
	@Override
	public List<MypageVO> reviewAllList(PageVO vo) { //member_id로 잡아오기
		List<MypageVO> reviewAllList = my.selectList("MypageDAO.myReviewAll", vo);//pageVO에 넣었으니 vo에서 꺼내기
		System.out.println("페이지에 보이는 review 갯수 : " + reviewAllList.size()); 
		return  reviewAllList;
	}
	
	//회원의 찜 목록
		@Override
		public List<MypageVO> jjimAllList(PageVO vo) {//member_id로 잡아오기
			List<MypageVO> jjimAllList = my.selectList("MypageDAO.myJjimAll", vo); //pageVO에 넣었으니 vo에서 꺼내기
			System.out.println("페이지에 보이는 jjim 갯수 : " + jjimAllList.size()); 
			return  jjimAllList;
		}
	
	//회원의 평가 목록
		@Override
		public List<MypageVO> gradeAllList(PageVO vo) {//member_id로 잡아오기
			List<MypageVO> gradeAllList = my.selectList("MypageDAO.myGradeAll", vo); //pageVO에 넣었으니 vo에서 꺼내기
			System.out.println("페이지에 보이는 평가 갯수 : " + gradeAllList.size()); 
			return  gradeAllList;
		}
		
		
	//회원이 작성한 게시글 갯수
	@Override
	public int bbsCount(PageVO vo) {
		return my.selectOne("MypageDAO.myBbsCount",vo);
	}

	//회원이 작성한 리뷰 갯수
	@Override
	public int reviewCount(PageVO vo) {
		return my.selectOne("MypageDAO.myReviewCount",vo);
	}
	
	//회원이 작성한 댓글 갯수
	@Override
	public int replyCount(PageVO vo) {
		return my.selectOne("MypageDAO.myReplyCount",vo);
	}

	//회원이 작성한 대댓글 갯수
	@Override
	public int replyCount2(PageVO vo) {
		return my.selectOne("MypageDAO.myReplyCount2",vo);
	}
	
	//회원 찜 목록 갯수
	@Override
	public int jjimCount(PageVO vo) {
		return my.selectOne("MypageDAO.myJjimCount",vo);
	}
	
	//찜 추가하기
	@Override
	public int addMovieJjim(MypageVO vo) {
		return my.insert("MypageDAO.addMovieJjim", vo);
	}
	
	//찜 삭제하기
	@Override
	public int removeMovieJjim(MypageVO vo) {
		return my.delete("MypageDAO.removeMovieJjim",vo);
	}
	
	// 찜 클릭 여부 체크
		@Override
		public int jjim_Check(MypageVO vo) {
			try {
				Integer result = my.selectOne("MypageDAO.JjimCheck", vo);
				if (result != null) {
					return result;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return 0;
		}
		
	
    //회원 조회수
    @Override
	public int viewCount(String member_id) {
		return my.update("MemberDAO.viewCount", member_id);
	}
    
	//영화 선택
	@Override
	public MypageVO movieSelectOne(String movieId) {
		MypageVO bag = my.selectOne("MypageDAO.movieSelectOne", movieId);
		return bag;
	}
	

}
