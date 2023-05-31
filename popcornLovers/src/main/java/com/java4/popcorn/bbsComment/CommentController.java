package com.java4.popcorn.bbsComment;

import java.time.LocalDateTime;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java4.popcorn.bbsReply.ReplyDAO;

@Controller
public class CommentController {

	@Autowired
	CommentDAO dao;
	
	@Autowired
	ReplyDAO dao2;
	
	
	/*
	 * //게시물 상세 페이지 들어갔을 때, 해당 게시물에 작성된 코멘트 가져옴. (작성자 프로필까지)
	 * 
	 * @RequestMapping("bbs/comment_select") public void list(int bbs_no, Model
	 * model) { System.out.println("실제 게시판 번호 >>" + bbs_no);
	 * System.out.println("list 요청됨."); System.out.println(dao); List<CommentVO>
	 * list2 = dao.getCommentList(bbs_no); System.out.println(list2.size());
	 * System.out.println(list2.get(0)); System.out.println(list2.toString());
	 * model.addAttribute("list2", list2); // model.addAttribute("list3", list3); }
	 */
	
	
	@RequestMapping("bbs/comment_insert")
    public void insertComment(@RequestParam("content") String content, @RequestParam("bbs_no") int bbs_no, HttpServletRequest request, CommentVO vo, Model model) {
		 // 사용자 아이디 가져오기
        String id = (String) request.getSession().getAttribute("member_id");

        // 현재 시간 생성
        LocalDateTime currentTime = LocalDateTime.now();

        vo.setB_comment_writer_id(id);
        vo.setBbs_no(bbs_no);
        vo.setB_comment_content(content);
        vo.setB_comment_create(currentTime);

        // 처리 결과를 클라이언트에게 응답
        //System.out.println(content);
        //System.out.println(id);
        //System.out.println(currentTime);
        int result = dao.getCommentInsert(vo);
		//System.out.println(result);
		List<CommentVO> list2 = dao.getCommentList(vo.getBbs_no());
		//System.out.println(list2.size());
		model.addAttribute("list2", list2);
	}
	
	//댓글 삭제 기능
	@RequestMapping("bbs/comment_delete")
	@ResponseBody
	public String comment_delete(CommentVO vo) {
		// 현재 시간 생성
		LocalDateTime deleteTime = LocalDateTime.now();
		vo.setB_comment_delete(deleteTime);
		dao.comment_delete(vo);
		System.out.println("삭제되었습니다.");
		return "success";
		}
	
	//댓글 수정 기능
	@RequestMapping("bbs/comment_update")
	@ResponseBody
	public String comment_update(CommentVO vo) {
					
		String b_comment_content = "";				
		// 현재 시간 생성
		LocalDateTime deleteTime = LocalDateTime.now();
		vo.setB_comment_content(b_comment_content);
		vo.setB_comment_update(deleteTime);
		dao.comment_update(vo);
		System.out.println("수정되었습니다.");
		return "";
	}
}
