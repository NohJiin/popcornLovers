package com.java4.popcorn.member;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class MemberController {

	@Autowired
	MemberDAO dao;
	
	
	// �쉶�썝媛��엯
	@RequestMapping("member/join")
	public String insert(MemberVO vo) {
		System.out.println(vo);
		int result = dao.insert(vo);
		if (result == 1) { // �쉶�썝媛��엯 �꽦怨�
			return "redirect:login.jsp";
		} else { // �쉶�썝媛��엯 �떎�뙣
			return "redirect:join.jsp";
		}
	}


	// 濡쒓렇�씤
	@RequestMapping("member/login")
	public String login(MemberVO vo, HttpSession session, Model model) {
		String result = dao.login(vo);
		if (result != null) {
			// 濡쒓렇�씤 �꽦怨�
			session.setAttribute("member_id", vo.getMember_id());// �쁾�꽭�뀡�옟�븘�몦寃�
			session.setAttribute("member_knickname", result);// list瑜� 遺덈윭�삤�젮硫� view �븘�옒�뿉 �뙆�씪�씠 �엳�뼱�빞�븿�쑝濡� �땳�꽕�엫 媛믪쓣 �꽔�뼱二쇨린	
			session.setAttribute("bag", vo);
			return "redirect:main.jsp"; // views �븘�옒 �뙆�씪 �씠由�.jsp
		} else {
			// 濡쒓렇�씤 �떎�뙣
			return "redirect:login.jsp"; // redirect : 諛⑺뼢�쓣 �떎�떆 諛붽씀�떎
		}
	}

	// 濡쒓렇�븘�썐
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:login.jsp";
	}

	// �븘�씠�뵒 以묐났 �솗�씤
	@RequestMapping("member/idCheck")
	@ResponseBody
	public int idCheck(String member_id) {
		System.out.println(member_id);
		MemberVO vo2 = dao.idCheck(member_id);
		System.out.println(vo2);

		int result = 1;
		if (vo2 == null) { // 媛숈� �븘�씠�뵒媛� �뾾�떎硫�
			result = 0; // �궗�슜 媛��뒫 �븘�씠�뵒
		}
	
		System.out.println("result : "+result);
		return result;
	}

	// �쉶�썝�젙蹂� �닔�젙
	@RequestMapping("member/update")
	public void update(MemberVO vo) {
		System.out.println("update�슂泥�");
		System.out.println(vo);
		dao.update(vo);
	}
//
//	// �쉶�썝 �깉�눜
//	@RequestMapping("member/remove")
//	public String name(MemberVO vo, HttpSession session) {
//		System.out.println("delete �슂泥��맖");
//		String result = dao.remove(vo);
//		if (result) {
//
//		}
//	}

	// �쉶�썝�쟾泥� 由ъ뒪�듃
	@RequestMapping("member/list")
	public void list(Model model) {
		List<MemberVO> list = dao.list();
		System.out.println("list�슂泥�");
		model.addAttribute("list", list);
	}
	
	//�쉶�썝 �븳紐� 由ъ뒪�듃
	@RequestMapping("member/one")
	public void selectOne(String member_id, Model model) {
		int result = dao.viewCount(member_id);
		System.out.println("議고쉶�닔 +" + result + "�쉶 利앷�");
		MemberVO bag = dao.selectOne(member_id);
		model.addAttribute("bag", bag);
	}

}
