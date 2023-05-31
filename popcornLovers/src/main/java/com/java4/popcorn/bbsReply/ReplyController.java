package com.java4.popcorn.bbsReply;

import java.time.LocalDateTime;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java4.popcorn.bbs.BbsDAO;
import com.java4.popcorn.member.MemberVO;


@Controller
public class ReplyController {

	@Autowired
	ReplyDAO dao;
	
	@Autowired
	BbsDAO dao2;

	  //댓글보기 버튼을 눌렀을 때 해당 댓글 번호를 전달받음.
	  //해당 댓글 번호에 자식 요소인 대댓글만 조회해옴.
	  @RequestMapping("bbs/reply_select")
	  public void list(@RequestParam("b_comment_id") int b_comment_id, @RequestParam("bbs_no") int bbs_no, ReplyVO vo, Model model, HttpServletRequest request) {
	  HttpSession session = request.getSession();
	  String member_id = (String) session.getAttribute("member_id");
	  //접속 유저에 해당하는 프로필 가져옴
	  List<MemberVO> list4 = dao2.getMemberProfile(member_id); 
	  System.out.println("전달받은 댓글 id: " + b_comment_id); 
	  vo.setB_comment_id(b_comment_id);
	  vo.setBbs_no(bbs_no);
	  List<ReplyVO> list = dao.getReplyList(vo);
	  System.out.println("대댓글 개수: " + list.size()); 
	  model.addAttribute("list", list);
	  model.addAttribute("list4", list4);
	  }

	//대댓글 입력하기
	@RequestMapping("bbs/reply_insert")
	@ResponseBody
    public String insertComment(@RequestParam("content") String content, @RequestParam("b_comment_id") int b_comment_id, @RequestParam("bbs_no") int bbs_no, HttpServletRequest request, ReplyVO vo, Model model) {
		 // 사용자 아이디 가져오기
        String id = (String) request.getSession().getAttribute("member_id");
        
        //System.out.println(content);
        //System.out.println(b_comment_id);
        //System.out.println(bbs_no);
        //System.out.println(id);
        // 현재 시간 생성
        LocalDateTime currentTime = LocalDateTime.now();
        //System.out.println(currentTime);

        vo.setB_reply_writer_id(id);
        vo.setBbs_no(bbs_no);
        vo.setB_reply_content(content);
        vo.setB_comment_id(b_comment_id);
        vo.setB_reply_create(currentTime);
        // 여기서부터는 필요한 처리를 수행하면 됩니다.
        // 예를 들어, 데이터베이스에 코멘트를 저장하거나 다른 로직을 수행할 수 있습니다.

        // 처리 결과를 클라이언트에게 응답
        //System.out.println(content);
        //System.out.println(id);
        //System.out.println(currentTime);
        int result = dao.getReplyInsert(vo);
		List<ReplyVO> list2 = dao.getReplyList(vo);
		//System.out.println(list2.size());
		model.addAttribute("list2", list2);
		return "success";
		
	}
	
	//대댓글 삭제 기능
		@RequestMapping("bbs/reply_delete")
		@ResponseBody
		public String reply_delete(ReplyVO vo) {
					
		// 현재 시간 생성
		LocalDateTime deleteTime = LocalDateTime.now();
		vo.setB_reply_delete(deleteTime);
		dao.reply_delete(vo);
		System.out.println("삭제되었습니다.");
		return "success";
		}
		
	//대댓글 수정 기능
	@RequestMapping("bbs/reply_update")
	@ResponseBody
	public String comment_update(ReplyVO vo) {
		String b_reply_content = "";				
		// 현재 시간 생성
		LocalDateTime deleteTime = LocalDateTime.now();
		vo.setB_reply_content(b_reply_content);
		vo.setB_reply_update(deleteTime);
		dao.reply_update(vo);
		System.out.println("수정되었습니다.");
		return "";
	}	
}
