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
   
    
    //아이디 중복 확인
    public MemberVO idCheck(String member_id) {
		System.out.println(member_id);
		MemberVO vo2 = my.selectOne("MemberDAO.idCheck", member_id);
		return vo2;
	}
    
    
    //회원정보 수정
    public int update(MemberVO vo) {
		int result = my.update("MemberDAO.update",vo);
		return result;
	}
    
    //회원 탈퇴 
    public int remove(MemberVO vo) {
    	 int result = my.delete("MemberDAO.remove",vo);
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
    
    //회원 조회수
    public int viewCount(String member_id) {
		int result = my.update("MemberDAO.viewCount", member_id);
		return result;
	}
    
	}


