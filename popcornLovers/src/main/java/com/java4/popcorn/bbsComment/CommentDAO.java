package com.java4.popcorn.bbsComment;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java4.popcorn.bbs.BbsVO;

@Component
public class CommentDAO {

	@Autowired
	SqlSessionTemplate my;

	// 해당 카테고리 댓글 불러오기
	public List<CommentVO> getCommentList(int bbs_no) {
	    try {
	        List<CommentVO> result = my.selectList("CommentDAO.comment_list", bbs_no);
	        if (result != null && !result.isEmpty()) {
	            return result;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    // Return custom message when the result is null or empty
	    List<CommentVO> emptyList = new ArrayList<>();
	    CommentVO emptyComment = new CommentVO();
	    emptyComment.setB_comment_empty("아직 댓글이 없습니다. 댓글을 남겨주세요.");
	    System.out.println("빈댓글확인: " + emptyComment);
	    emptyList.add(emptyComment);
	    return emptyList;
	}
	// 코멘트 댓글 개수 세기
	public int comment_count(int bbs_no) {
		return my.selectOne("CommentDAO.comment_count", bbs_no);
	}

	// 코멘트 댓글 입력하기
	public int getCommentInsert(CommentVO vo) {
		int result = my.insert("CommentDAO.comment_insert", vo);
		return result;
	}
	
	// 코멘트 입력한 멤버 정보 가져옴.
	public List<CommentVO> getMemberProfile(int bbs_no) {
		List<CommentVO> result = my.selectList("CommentDAO.get_member_profile", bbs_no);
		return result;
	}
	
	// 댓글 삭제
	public int comment_delete(CommentVO vo) {
		int result = my.update("CommentDAO.comment_delete", vo);
		return result;
	}
	
	// 댓글 삭제
	public int comment_update(CommentVO vo) {
		int result = my.update("CommentDAO.comment_update", vo);
		return result;
	}
}
