package com.java4.popcorn.bbs;

import java.io.File;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.java4.popcorn.bbsComment.CommentDAO;
import com.java4.popcorn.bbsComment.CommentVO;
import com.java4.popcorn.member.MemberVO;

@Controller
public class BbsController {

	@Autowired
	BbsDAO dao;

	@Autowired
	NewslistDAO dao2;

	@Autowired
	CommentDAO dao3;
	
	private final Logger logger = LoggerFactory.getLogger(BbsController.class);

	@Autowired
	private ServletContext servletContext;

	@RequestMapping("news_cont")
	public void list(Model model) {

		System.out.println("list 요청됨.");
		System.out.println(dao2);
		List<NewslistVO> list = dao2.getNewsList();
		System.out.println(list.size());
		System.out.println(list.get(0));
		model.addAttribute("list", list);
	}

	// (전체-커뮤니티) 페이지 버튼 클릭시 그 페이지 해당 게시물 보여줌.
		@RequestMapping("bbs/bbs_all_List")
		public void list2(BbspageVO vo,int bbsCateNum, Model model) {
			int page = vo.getPage();
			if(vo.getSearchContent() == null) {
				vo.setSearchContent("");
			}
			int count = dao.searchAllBBS(vo).size();
			List<BbsVO> list = null;
			
			int pages = 0;
			if (count % 10 == 0) {
				pages = count / 10; // 전체 페이지 개수 구하기
			} else {
				pages = count / 10 + 1; // 전체 페이지 개수 구하기
			}
			int end = count - ((page - 1) * 10);
			int start = end - 9;
			if (start >= 0) {
				start = end - 9;
			} else {
				start = 1;
			}
			vo.setStart(start);
			vo.setEnd(end);
			list = dao.searchBBS(vo);
			System.out.println("all count>> " + bbsCateNum);
			model.addAttribute("searchContent", vo.getSearchContent());
			model.addAttribute("bbsCateNums", bbsCateNum);
			model.addAttribute("list", list);
			model.addAttribute("count", count);
			model.addAttribute("pages", pages);
		}

		// (전체-커뮤니티) 클릭시 1페이지에 해당하는 전체 게시물 보여줌.
		@RequestMapping("bbs/bbs_All")
		public void all2(BbspageVO vo, int bbsCateNums, Model model) {
			int page = vo.getPage();
			if(vo.getSearchContent() == null) {
				vo.setSearchContent("");
			}
			int count = dao.searchAllBBS(vo).size();
			List<BbsVO> list = null;
			
			int pages = 0;
			if (count % 10 == 0) {
				pages = count / 10; // 전체 페이지 개수 구하기
			} else {
				pages = count / 10 + 1; // 전체 페이지 개수 구하기
			}
			int end = count - ((page - 1) * 10);
			int start = end - 9;
			if (start >= 0) {
				start = end - 9;
			} else {
				start = 1;
			}
			vo.setStart(start);
			vo.setEnd(end);
			list = dao.searchBBS(vo);
			System.out.println("detail all count>> " + bbsCateNums);
			model.addAttribute("bbsCateNums", bbsCateNums);
			model.addAttribute("searchContent", vo.getSearchContent());
			model.addAttribute("list", list);
			model.addAttribute("count", count);
			model.addAttribute("pages", pages);
		}

	// 카테고리에 타이틀과 카테고리 설명 불러옴
	@RequestMapping("bbs/bbs_info_category")
	public void category_info(int bbs_cate_num, Model model) {
		List<CategoryVO> list = dao.category_info(bbs_cate_num);
		model.addAttribute("list", list);
	}

	// 카테고리별 페이지 버튼 눌렀을 때, 그 페이지에 해당하는 게시물 리스트 조회함
	@RequestMapping("bbs/category_paging")
	public void list2(CategoryVO vo, Model model) {
		int page = vo.getPage();
		int count = dao.count_category(vo.getBbs_cate_num());
		int end = count - ((page - 1) * 10);
		int start = end - 9;
		if (start >= 0) {
			start = end - 9;
		} else {
			start = 1;
		}
		vo.setStart(start);
		vo.setEnd(end);
		List<BbsVO> list = dao.category_paging(vo);
		System.out.println(list.size());
		model.addAttribute("list2", list);
	}

	// 명당자리 메뉴 클릭했을 때 1페이지에 해당하는 게시물 리스트 보여줌
	@RequestMapping("bbs/notice")
	public void notice(CategoryVO vo, Model model) {
		int page = vo.getPage();
		int count = dao.count_category(vo.getBbs_cate_num());
		int pages = 0;
		if (count % 10 == 0) {
			pages = count / 10; // 전체 페이지 개수 구하기
		} else {
			pages = count / 10 + 1; // 전체 페이지 개수 구하기
		}
		int end = count - ((page - 1) * 10);
		int start = end - 9;
		if (start >= 0) {
			start = end - 9;
		} else {
			start = 1;
		}
		vo.setStart(start);
		vo.setEnd(end);
		List<BbsVO> list = dao.bbs_list_category(vo);
		List<CategoryVO> info = dao.category_info(vo.getBbs_cate_num());
		System.out.println("category count>> " + count);
		model.addAttribute("list2", list);
		model.addAttribute("count2", count);
		model.addAttribute("pages2", pages);
		model.addAttribute("info2", info);
	}

	// 자유게시판 메뉴 클릭했을 때 1페이지에 해당하는 게시물 리스트 보여줌
	@RequestMapping("bbs/free")
	public void free(CategoryVO vo, Model model) {
		int page = vo.getPage();
		int count = dao.count_category(vo.getBbs_cate_num());
		int pages = 0;
		if (count % 10 == 0) {
			pages = count / 10; // 전체 페이지 개수 구하기
		} else {
			pages = count / 10 + 1; // 전체 페이지 개수 구하기
		}
		int end = count - ((page - 1) * 10);
		int start = end - 9;
		if (start >= 0) {
			start = end - 9;
		} else {
			start = 1;
		}
		vo.setStart(start);
		vo.setEnd(end);
		List<BbsVO> list = dao.bbs_list_category(vo);
		List<CategoryVO> info = dao.category_info(vo.getBbs_cate_num());
		System.out.println("category count>> " + count);
		model.addAttribute("list2", list);
		model.addAttribute("count2", count);
		model.addAttribute("pages2", pages);
		model.addAttribute("info2", info);
	}

	// 영화수다 메뉴 클릭했을 때 1페이지에 해당하는 게시물 리스트 보여줌
	@RequestMapping("bbs/movietalk")
	public void movietalk(CategoryVO vo, Model model) {
		int page = vo.getPage();
		int count = dao.count_category(vo.getBbs_cate_num());
		int pages = 0;
		if (count % 10 == 0) {
			pages = count / 10; // 전체 페이지 개수 구하기
		} else {
			pages = count / 10 + 1; // 전체 페이지 개수 구하기
		}
		int end = count - ((page - 1) * 10);
		int start = end - 9;
		if (start >= 0) {
			start = end - 9;
		} else {
			start = 1;
		}
		vo.setStart(start);
		vo.setEnd(end);
		List<BbsVO> list = dao.bbs_list_category(vo);
		List<CategoryVO> info = dao.category_info(vo.getBbs_cate_num());
		System.out.println("category count>> " + count);
		model.addAttribute("list2", list);
		model.addAttribute("count2", count);
		model.addAttribute("pages2", pages);
		model.addAttribute("info2", info);
	}

	// 찾아주세요 메뉴 클릭했을 때 1페이지에 해당하는 게시물 리스트 보여줌
	@RequestMapping("bbs/find")
	public void find(CategoryVO vo, Model model) {
		int page = vo.getPage();
		int count = dao.count_category(vo.getBbs_cate_num());
		int pages = 0;
		if (count % 10 == 0) {
			pages = count / 10; // 전체 페이지 개수 구하기
		} else {
			pages = count / 10 + 1; // 전체 페이지 개수 구하기
		}
		int end = count - ((page - 1) * 10);
		int start = end - 9;
		if (start >= 0) {
			start = end - 9;
		} else {
			start = 1;
		}
		vo.setStart(start);
		vo.setEnd(end);
		List<BbsVO> list = dao.bbs_list_category(vo);
		List<CategoryVO> info = dao.category_info(vo.getBbs_cate_num());
		System.out.println("category count>> " + count);
		model.addAttribute("list2", list);
		model.addAttribute("count2", count);
		model.addAttribute("pages2", pages);
		model.addAttribute("info2", info);
	}

	// 번개모임 메뉴 클릭했을 때 1페이지에 해당하는 게시물 리스트 보여줌
	@RequestMapping("bbs/bungae")
	public void bungae(CategoryVO vo, Model model) {
		int page = vo.getPage();
		int count = dao.count_category(vo.getBbs_cate_num());
		int pages = 0;
		if (count % 10 == 0) {
			pages = count / 10; // 전체 페이지 개수 구하기
		} else {
			pages = count / 10 + 1; // 전체 페이지 개수 구하기
		}
		int end = count - ((page - 1) * 10);
		int start = end - 9;
		if (start >= 0) {
			start = end - 9;
		} else {
			start = 1;
		}
		vo.setStart(start);
		vo.setEnd(end);
		List<BbsVO> list = dao.bbs_list_category(vo);
		List<CategoryVO> info = dao.category_info(vo.getBbs_cate_num());
		System.out.println("category count>> " + count);
		model.addAttribute("list2", list);
		model.addAttribute("count2", count);
		model.addAttribute("pages2", pages);
		model.addAttribute("info2", info);
	}

	// (전체-커뮤니티 메뉴 눌러서 게시물 클릭했을 때)게시물 상세 페이지 보여줌
	// 로그인 되어 있는 아이디가 좋아요를 눌렀으면 채워져있는 하트, 안 눌렀으면 빈 하트를 보여줌
	@GetMapping("bbs/detail_post")
	public String detail_post(BbsVO vo, @RequestParam(name = "bbs_no") int bbs_no,
			@RequestParam(name = "bbs_cate_num") int bbs_cate_num,
			HttpServletRequest request, HttpServletResponse response, Model model) {
		HttpSession session = request.getSession();
		vo.setBbs_no(bbs_no);
		String member_id = (String) session.getAttribute("member_id");
		// 접속 유저에 해당하는 프로필 가져옴
		List<MemberVO> list3 = dao.getMemberProfile(member_id);
		vo.setMember_id(member_id);
		System.out.println(member_id);
		HashMap<String, Integer> map = new HashMap<>();
		map.put("bbs_no", vo.getBbs_no());
		map.put("bbs_cate_num", bbs_cate_num);
		List<BbsVO> list = dao.detail_post(map);
		int yesno = dao.member_like_yesno(vo);
		model.addAttribute("bbsCateNum", vo.getBbs_cate_num());
		model.addAttribute("list2", list);
		model.addAttribute("list3", list3);
		int count = dao3.comment_count(vo.getBbs_no());
		model.addAttribute("count", count);
		model.addAttribute("yesno", yesno);
		//2023-05-30-04-26 댓글 추가
		//System.out.println("실제 게시판 번호 >>" + vo.getBbs_no());
		List<CommentVO> list5 = dao3.getCommentList(vo.getBbs_no());
		//System.out.println(list5.size());
		model.addAttribute("list5", list5);
		List<CategoryVO> info = dao.category_info(vo.getBbs_cate_num()); // 게시판 소개
		model.addAttribute("info2", info);
		//2023-05-30-14-42 쿠키 추가
		Cookie viewCookie=null; // 1.쿠키값을 정의해준다.
        Cookie[] cookies = request.getCookies(); // 2. 클라이언트가 보낸 데이터에서 쿠키값을 가져온다.
        //System.out.println("cookie : "+cookies); // 3.쿠키이름 확인하기 위해서 출력 한다.
        if(cookies !=null) {  // 4. 쿠키의 값이 있을경우에

        for (int i = 0; i < cookies.length; i++) {  // 5.쿠키가 돌아가는동안에
        //만들어진 쿠키들을 확인하며, 만약 들어온 적 있다면 생성되었을 쿠키가 		있는지 확인
        if(cookies[i].getName().equals("|"+vo.getBbs_no()+"|")) {
        //System.out.println("if문 쿠키 이름 : "+cookies[i].getName());  // 6.내가 밑에서 만들어놓은 쿠키가 있는지 확인좀..
        //찾은 쿠키를 변수에 저장
        viewCookie = cookies[i]; 
		// 7. 쿠키값을 찾으면 그거를 viewCookkie 에다가 저장을 해봅시다.
        //System.out.println("viewCookie =" +viewCookie); 
	    // 8. 위치확인
        }
        }
        }else {  // 9.쿠키가 없으면 실행
        //System.out.println("cookies 확인 로직 : 쿠키가 없습니다.");
        }
	    //만들어진 쿠키가 없음을 확인
        if(viewCookie==null) {  // 10. 쿠키가 없을때 실행대는 로직이고 쿠기가 있으	    면 실행이 안되고 위에서 멈춘다.
        //System.out.println("viewCookie 확인 로직 : 쿠키 없당"); 
	    // 11. 쿠키가 없다는걸 알려줘야함.,
        try { // 12. 예외출력을 이용해서 씀 try catch 
        //이 페이지에 왔다는 증거용(?) 쿠키 생성
        Cookie newCookie=new Cookie("|"+vo.getBbs_no()+"|","OK"); 
	    // 13.새로운 쿠키를 생성해서 (key,value) 값을 넣어줌 
        response.addCookie(newCookie); 
	    // 14. 13번에서 쿠기 값을 넣어준거를 다시 클라이언트에다가 보내줌 
        //쿠키가 없으니 증가 로직 진행
	    // 15. 쿠키 클라이언트에 보내주고 조회수 증가 로직을 실행시켜줌
        dao.bbsview_cnt(vo.getBbs_no()); // 16. 게시물번호에 대한 조회수 카운트
        //System.out.println("쿠키 dao" + dao);
        } catch (Exception e) {
        //System.out.println("쿠키 넣을때 오류 나나? : "+e.getMessage());  
	    // 17. 입력오류 나올때는 입력 오류인지 확인하는 예외부분
        e.getStackTrace();
	    }
        //만들어진 쿠키가 있으면 증가 로직 진행하지 않음
        }else { // 18. 만들어진 쿠기가 있으면 
        //System.out.println("viewCookie 확인  : 쿠키 있당");  
        //String value=viewCookie.getValue();                  
		// 19.쿠키의 값을 반환  13번 "Engilsh" 부분을반환
        //System.out.println("viewCookie 확인 : 쿠키 value : "+value); 
		// 20. 콘솔로 알아보기 쉽게 출력
        }
        //System.out.println("-------------------조회수 쿠키ㅏ------------------------------------");
        return "bbs/detail_post";
	}

	// (카테고리별-카테고리 메뉴 눌러서 게시물 클릭했을 때)게시물 상세 페이지 보여줌
	/*
	 * @RequestMapping("bbs/detail_cate_post") public void detail_cate_post(BbsVO
	 * vo, Model model, HttpServletRequest request) { HttpSession session =
	 * request.getSession(); String member_id = (String)
	 * session.getAttribute("member_id"); // 접속 유저에 해당하는 프로필 가져옴 List<MemberVO>
	 * list3 = dao.getMemberProfile(member_id); vo.setMember_id(member_id);
	 * System.out.println(vo.getBbs_row_no() + " " + vo.getBbs_no()); List<BbsVO>
	 * list = dao.detail_cate_post(vo); List<CategoryVO> info =
	 * dao.category_info(vo.getBbs_cate_num()); // 게시판 소개 int yesno =
	 * dao.member_like_yesno(vo); System.out.println(yesno);
	 * model.addAttribute("list2", list); model.addAttribute("list3", list3); int
	 * count = dao3.comment_count(vo.getBbs_no()); model.addAttribute("count",
	 * count); model.addAttribute("yesno", yesno); model.addAttribute("info2",
	 * info); //2023-05-30-22-43 댓글 추가 System.out.println("실제 게시판 번호 >>" +
	 * vo.getBbs_no()); System.out.println("list 요청됨."); System.out.println(dao);
	 * List<CommentVO> list5 = dao3.getCommentList(vo.getBbs_no());
	 * System.out.println(list5.size()); System.out.println(list5.get(0));
	 * System.out.println(list5.toString()); model.addAttribute("list5", list5); }
	 */

	// 게시물 삭제 기능
	@RequestMapping("bbs/bbs_delete")
	@ResponseBody
	public String bbs_delete(BbsVO vo) {

		// 현재 시간 생성
		LocalDateTime deleteTime = LocalDateTime.now();
		vo.setBbs_delete(deleteTime);
		dao.bbs_delete(vo);
		System.out.println("삭제되었습니다.");
		return "success";
	}

	// 좋아요 클릭 기능
	@RequestMapping("bbs/bbs_like_check")
	@ResponseBody
	public String bbs_like_check(BbslikesVO vo, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("member_id");
		vo.setMember_id(member_id);
		if (dao.like_db_check(vo) == 1) {
			dao.bbs_like_check(vo);
			dao.bbs_like_plus(vo.getBbs_no());
			//System.out.println("좋아요를 눌렀습니다.");
			return "success";
		} else {
			dao.create_like_db(vo);
			dao.bbs_like_plus(vo.getBbs_no());
			//System.out.println("좋아요를 생성하고 눌렀습니다.");
			return "success";
		}
	}

	// 좋아요 취소 기능
	@RequestMapping("bbs/bbs_like_check_cancel")
	@ResponseBody
	public String bbs_like_check_cancel(BbslikesVO vo, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("member_id");
		vo.setMember_id(member_id);
		System.out.println(vo);
		dao.bbs_like_check_cancel(vo);
		dao.bbs_like_minus(vo.getBbs_no());
		System.out.println("좋아요를 취소했습니다.");
		return "success";
	}

	// ajax용 총 좋아요 합산 기능
	@RequestMapping("bbs/bbs_like_sum")
	@ResponseBody
	public String bbs_like_sum(int bbs_no) {
		int likes_sum = dao.bbs_like_sum(bbs_no);
		//System.out.println("likes_sum" + likes_sum);
		return "" + likes_sum;
	}

	// 검색어에 일치하는 제목이나 내용을 가진 게시글 목록을 보여준다.
		@GetMapping("bbs/search")
		public String search(BbspageVO vo, Model model, @RequestParam("searchContent") String searchContent) {
			int page = vo.getPage();
			System.out.println("search 요청됨.");
			vo.setStartEnd(vo.getPage());
			List<BbsVO> list = dao.searchBBS(vo);
			int count = dao.searchAllBBS(vo).size();
			int pages = 0;
			if (count % 10 == 0) {
				pages = count / 10; // 전체 페이지 개수 구하기
			} else {
				pages = count / 10 + 1; // 전체 페이지 개수 구하기
			}
			int end = count - ((page - 1) * 10);
			int start = end - 9;
			if (start >= 0) {
				start = end - 9;
			} else {
				start = 1;
			}
			model.addAttribute("searchContent", searchContent);
			model.addAttribute("list", list);
			model.addAttribute("count", count);
			model.addAttribute("pages", pages);

			return "bbs/post";
		}
	
	
	@GetMapping("bbs/post")
    public String movePost() throws Exception {
	return "bbs/post";
    }	
	
	//카테고리별 글작성
	@GetMapping("bbs/write/{bbs_cate_num}")
	public String moveWrite(@PathVariable(name = "bbs_cate_num") int bbsCateNum,
			 Model model) throws Exception {
		
		model.addAttribute("bbsCateNum", bbsCateNum);

		return "bbs/write";
	}
	
	//전체 글작성
	@PostMapping("bbs/write")
	public String postWrite(BbsVO bbsVO, @RequestParam("cur_cate_name") String cur_cate_name,
			@RequestParam("cur_cate_num") int cur_cate_num,
			@RequestParam("upfile") MultipartFile[] files, HttpSession session,
			RedirectAttributes redirectAttributes) throws Exception {
		logger.debug("write boardDto : {}", bbsVO);
		String userId = (String) session.getAttribute("member_id");
		bbsVO.setMember_id(userId);
//		FileUpload 관련 설정.
		logger.debug("MultipartFile.isEmpty : {}", files[0].isEmpty());
		if (!files[0].isEmpty()) {
			String realPath = servletContext.getRealPath("/resources/img");			
			String today = new SimpleDateFormat("yyMMdd").format(new Date());
			String saveFolder = realPath + File.separator + today;
			logger.info("저장 폴더 : {}", saveFolder);
			File folder = new File(saveFolder);
			if (!folder.exists())
				folder.mkdirs();
			List<BbsfileVO> fileInfos = new ArrayList<BbsfileVO>();
			for (MultipartFile mfile : files) {
				BbsfileVO fileInfoDto = new BbsfileVO();
				String originalFileName = mfile.getOriginalFilename();
				if (!originalFileName.isEmpty()) {
					String saveFileName = UUID.randomUUID().toString()
							+ originalFileName.substring(originalFileName.lastIndexOf('.'));
					fileInfoDto.setSave_folder(today);
					fileInfoDto.setOriginal_file(originalFileName);
					fileInfoDto.setSave_file(saveFileName);
					logger.info("원본 파일 이름 : {}, 실제 저장 파일 이름 : {}", mfile.getOriginalFilename(), saveFileName);
					mfile.transferTo(new File(folder, saveFileName));
				}
				fileInfos.add(fileInfoDto);
			}
			bbsVO.setFileInfos(fileInfos);
		}
		dao.writeBbs(bbsVO);
		System.out.println("####" +cur_cate_num + cur_cate_name );
		if(cur_cate_num != 0) {
			redirectAttributes.addAttribute("bbs_cate_num", cur_cate_num);
			redirectAttributes.addAttribute("page", "1");
			return "redirect:./" + cur_cate_name;
		}
		return "redirect:./post";
	}
	
	//글작성 파일 저장
	@GetMapping("bbs/{folder}/{filename:.+}")
    public void setImageFileById(@PathVariable(name = "folder") String folder, @PathVariable(name = "filename") String filename
    		, HttpServletResponse response) throws Exception {
        // 파일 정보를 찾고
        String realPath = servletContext.getRealPath("\\resources\\img");	
        // 파일이 실제로 저장되어 있는 경로에
        realPath += "\\" + folder + "\\" + filename;
        File file = new File(realPath);
        // file URL을 생성하고 
        
        InputStream inputStream = file.toURL().openStream();
        OutputStream outputStream = response.getOutputStream();
        IOUtils.copy(inputStream, outputStream);
    }
	
	//글수정
	@GetMapping("bbs/modify/{bbsNo}")
    public String getModify(@PathVariable(name = "bbsNo") String bbsNo, @RequestParam Map<String, String> map, Model model) throws Exception {
		logger.debug("modify articleNo : {}", bbsNo);
		HashMap<String, Integer> m = new HashMap<>();
		m.put("bbs_no", Integer.parseInt(bbsNo));
		m.put("bbs_cate_num", Integer.parseInt(map.get("bbs_cate_num")));
		List<BbsVO> list = dao.detail_post(m);
		model.addAttribute("bbs", list.get(0));
		model.addAttribute("bbsCateNum", map.get("bbs_cate_num"));
		model.addAttribute("pgno", map.get("pgno"));
		model.addAttribute("key", map.get("key"));
		model.addAttribute("word", map.get("word"));
		return "bbs/modify";
    }
	
	//글수정-첨부파일 수정
	@PostMapping("bbs/modify")
    public String postModify(BbsVO bbsVO, @RequestParam("upfile") MultipartFile[] files, int[] deleteFiles, Model model, HttpServletRequest request) throws Exception {
		System.out.println(bbsVO.getBbs_content());
		
		if (!files[0].isEmpty()) {
			String realPath = servletContext.getRealPath("/resources/img");			
			String today = new SimpleDateFormat("yyMMdd").format(new Date());
			String saveFolder = realPath + File.separator + today;
			logger.info("저장 폴더 : {}", saveFolder);
			File folder = new File(saveFolder);
			if (!folder.exists())
				folder.mkdirs();
			List<BbsfileVO> fileInfos = new ArrayList<BbsfileVO>();
			for (MultipartFile mfile : files) {
				BbsfileVO fileInfoDto = new BbsfileVO();
				String originalFileName = mfile.getOriginalFilename();
				if (!originalFileName.isEmpty()) {
					String saveFileName = UUID.randomUUID().toString()
							+ originalFileName.substring(originalFileName.lastIndexOf('.'));
					fileInfoDto.setSave_folder(today);
					fileInfoDto.setOriginal_file(originalFileName);
					fileInfoDto.setSave_file(saveFileName);
					logger.info("원본 파일 이름 : {}, 실제 저장 파일 이름 : {}", mfile.getOriginalFilename(), saveFileName);
					mfile.transferTo(new File(folder, saveFileName));
				}
				fileInfos.add(fileInfoDto);
			}
			bbsVO.setFileInfos(fileInfos);
		}
		dao.modifyBbs(bbsVO, deleteFiles);

		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("member_id");
		// 접속 유저에 해당하는 프로필 가져옴
		List<MemberVO> list3 = dao.getMemberProfile(member_id);
		bbsVO.setMember_id(member_id);
		
		HashMap<String, Integer> m = new HashMap<>();
		m.put("bbs_no", bbsVO.getBbs_no());
		m.put("bbs_cate_num", bbsVO.getBbs_cate_num());
		List<BbsVO> list = dao.detail_post(m);
		int yesno = dao.member_like_yesno(bbsVO);
		System.out.println(yesno);
		System.out.println("$$$$bbsCateNum"+ bbsVO.getBbs_cate_num());
		model.addAttribute("bbsCateNum", bbsVO.getBbs_cate_num());
		model.addAttribute("list2", list);
		model.addAttribute("list3", list3);
		int count = dao3.comment_count(bbsVO.getBbs_no());
		model.addAttribute("count", count);
		model.addAttribute("yesno", yesno);
		
		return "bbs/detail_post";
    }
	
	//파일 업로드
	@GetMapping("bbs/upload")
    public void deleteFile(int file_id, Model model) throws Exception {
		dao.delete(file_id);
    }
}
