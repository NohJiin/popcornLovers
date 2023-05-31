package com.java4.popcorn.bbsReply;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.javassist.expr.NewArray;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java4.popcorn.bbsComment.CommentVO;



@Component
public class ReplyDAO {

	@Autowired
	SqlSessionTemplate my;
	
	
	//해당 카테고리 게시물 불러오기
	public List<ReplyVO> getReplyList(ReplyVO vo) {
	    try {
	        List<ReplyVO> result = my.selectList("ReplyDAO.reply_list", vo);
	        if (result != null && !result.isEmpty()) {
	            return result;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    
	    // 널인 경우 또는 빈 리스트인 경우에 대한 처리
	    List<ReplyVO> list = new ArrayList<>();
	    ReplyVO emptyReply = new ReplyVO();
	    emptyReply.setB_comment_id(vo.getB_comment_id());
	    System.out.println(vo.getB_comment_id());
	    System.out.println(vo.getBbs_no());
	    emptyReply.setBbs_no(vo.getBbs_no());
	    list.add(emptyReply);
	    return list;
		}
	
	//대댓글 개수
	public int getReplyCount(int b_comment_id) {
		int result = my.selectOne("ReplyDAO.reply_count", b_comment_id);
		return result;
	}
	
	// 대댓글 입력
	public int getReplyInsert(ReplyVO vo) {
		int result = my.insert("ReplyDAO.reply_insert", vo);
		return result;
	}
	
	// 대댓글 삭제
	public int reply_delete(ReplyVO vo) {
		int result = my.update("ReplyDAO.reply_delete", vo);
		return result;
	}
	
	// 대댓글 수정
	public int reply_update(ReplyVO vo) {
		int result = my.update("ReplyDAO.reply_update", vo);
		return result;
	}
	
}
