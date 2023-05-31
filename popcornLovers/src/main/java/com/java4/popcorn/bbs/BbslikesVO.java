package com.java4.popcorn.bbs;

public class BbslikesVO {

		private int bbs_like_no;
		private String member_id;
		private int bbs_no;
		private int like_check;
		public int getBbs_like_no() {
			return bbs_like_no;
		}
		public void setBbs_like_no(int bbs_like_no) {
			this.bbs_like_no = bbs_like_no;
		}
		public String getMember_id() {
			return member_id;
		}
		public void setMember_id(String member_id) {
			this.member_id = member_id;
		}
		public int getBbs_no() {
			return bbs_no;
		}
		public void setBbs_no(int bbs_no) {
			this.bbs_no = bbs_no;
		}
		public int getLike_check() {
			return like_check;
		}
		public void setLike_check(int like_check) {
			this.like_check = like_check;
		}
		@Override
		public String toString() {
			return "BbslikesVO [bbs_like_no=" + bbs_like_no + ", member_id=" + member_id + ", bbs_no=" + bbs_no
					+ ", like_check=" + like_check + "]";
		}
		
		
	}