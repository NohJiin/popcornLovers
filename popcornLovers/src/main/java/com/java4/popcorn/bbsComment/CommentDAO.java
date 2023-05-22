package com.java4.popcorn.bbsComment;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component
public class CommentDAO {

	@Autowired
	SqlSessionTemplate my;
	
	
	//해당 카테고리 게시물 불러오기
	public List<CommentVO> getCommentList(int bbs_no) {
		return my.selectList("Comment.comment_list", bbs_no);
	}
	
	public int getCommentInsert(CommentVO vo) {
		int result = my.insert("Comment.comment_insert", vo);
		return result;
	}
}
