package com.java4.popcorn.bbsReply;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component
public class ReplyDAO {

	@Autowired
	SqlSessionTemplate my;
	
	
	//해당 카테고리 게시물 불러오기
	public List<ReplyVO> getReplyList(int b_comment_id) {
		return my.selectList("Reply.reply_list", b_comment_id);
	}
	
	public int getReplyInsert(ReplyVO vo) {
		int result = my.insert("Reply.reply_insert", vo);
		return result;
	}
}
