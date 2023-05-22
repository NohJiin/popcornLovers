package com.java4.popcorn.bbs;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component
public class newsDAO {

	@Autowired
	SqlSessionTemplate my;
	
	
	public List<BbsVO> getList() {
		System.out.println("dao까지는 왔고~~");
		List<BbsVO> list = my.selectList("Bbs.all");
		return list;
	}

	//게시물 패이징
	public List<BbsVO> all(BbspageVO vo) {
		return my.selectList("Bbs.paging", vo);
	}
	
	public List<BbsVO> all_list(BbspageVO vo) {
		return my.selectList("Bbs.all_list", vo);
	}
	
	public List<CategorypageVO> category_paging(CategoryVO vo) {
		return my.selectList("Bbs.category_paging", vo);
	}
	
	public List<CategoryVO> category_info(int bbs_cate_num) {
		return my.selectList("bbs_category.category_info", bbs_cate_num);
	}
	
	public List<BbsVO> detail_post(long l) {
		return my.selectList("Bbs.detail_post", l);
	}
	
	/*
	 * public List<TalkDTO> category_list(int bbs_cate_num) { return
	 * my.selectList("bbs_category.list_category", bbs_cate_num); }
	 */
	
	//게시물 개수 세기
	public int count() {
		return my.selectOne("Bbs.count");
	}
	
	//해당 카테고리 게시물 개수 세기
	public int count_category(int bbs_cate_num) {
		return my.selectOne("Bbs.count_category", bbs_cate_num);
	}
	
	//해당 카테고리 게시물 불러오기
	public List<CategorypageVO> bbs_list_category(CategoryVO vo) {
		return my.selectList("Bbs.category_list", vo);
	} 
	 
	 public List<BbsVO> detail_cate_post(BbsVO vo) {
			return my.selectList("Bbs.detail_cate_post", vo);
	}
	 
}
