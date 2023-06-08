package com.java4.popcorn.member;

import java.util.List;

public interface MemberInterface {

	//회원가입
	int insert(MemberVO vo);

	//로그인
	String login(MemberVO vo);

	// 로그인하면 login_count +1 
	void loginCount(String member_id);

	//아이디와 비밀번호  db에 있는지 확인 체크용(int)
	MemberVO memberCheck(MemberVO vo);

	//아이디 중복 확인
	MemberVO idCheck(String member_id);

	//닉네임 중복 확인
	MemberVO knicknameCheck(String member_knickname);

	//회원정보 수정
	int update(MemberVO vo);

	//회원 탈퇴 
	int remove(String member_id);

	//회원전체 리스트
	List<MemberVO> list();

	//회원하나 리스트
	MemberVO selectOne(String member_id);

	//회원 프로필 사진 수정
	int profileUp(MemberVO vo);

	// member 테이블에서 삭제된 id와 동일한 아이디를 rankuser 테이블에서도 삭제
	void rankDel(String member_id);

}