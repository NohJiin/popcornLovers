package com.java4.popcorn.member;



import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class MemberDAO {

	@Autowired
	SqlSessionTemplate my;

    
    //회원가입
    public int insert(MemberVO vo) {
		int result = my.insert("MemberDAO.create", vo );
		return result;
	}
    
    //로그인
    public String login(MemberVO vo) {
    	String result = my.selectOne("MemberDAO.login", vo);
    	return result;    	
	}
   
 // 로그인하면 login_count +1 
  	public void loginCount(String member_id) {
  		my.update("MemberDAO.loginCount", member_id);
  	}
    
    //아이디와 비밀번호  db에 있는지 확인 체크용(int)
    public MemberVO memberCheck(MemberVO vo) {
		System.out.println(vo);
		MemberVO vo2 = my.selectOne("MemberDAO.memberCheck",vo);
		return vo2;
	}
    
    //아이디 중복 확인
    public MemberVO idCheck(String member_id) {
		System.out.println(member_id);
		MemberVO vo2 = my.selectOne("MemberDAO.idCheck", member_id);
		return vo2;
	}
    
    //닉네임 중복 확인
    public MemberVO knicknameCheck(String member_knickname) {
		System.out.println(member_knickname);
		MemberVO vo2 = my.selectOne("MemberDAO.knicknameCheck", member_knickname);
		return vo2;
	}
    
    //회원정보 수정
    public int update(MemberVO vo) {
		int result = my.update("MemberDAO.update",vo);
		return result;
	}
    
    //회원 탈퇴 
    public int remove(String member_id) {
    	 int result = my.update("MemberDAO.remove",member_id);
		return result;
	}
    
    //회원전체 리스트
    public List<MemberVO> list() {
		List<MemberVO> list= my.selectList("MemberDAO.all");
		return list;
	}
    
    //회원하나 리스트
    public MemberVO selectOne(String member_id) {
		MemberVO bag = my.selectOne("MemberDAO.selectOne",member_id);
		return bag;
	}
    
	//회원 프로필 사진 수정
	public int profileUp(MemberVO vo) {
		return my.update("MemberDAO.profileUp", vo);
	}
	
	// member 테이블에서 삭제된 id와 동일한 아이디를 rankuser 테이블에서도 삭제
    public void rankDel(String member_id) {
		my.delete("RankUserDAO.rankDel", member_id);
	}
    
	}


