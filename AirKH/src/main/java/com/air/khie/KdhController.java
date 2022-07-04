package com.air.khie;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.air.common.AdminDTO;
import com.air.common.HaccDTO;
import com.air.common.HostDTO;
import com.air.common.MemberDTO;
import com.air.common.PageDTO;
import com.air.common.PaymentDTO;
import com.air.common.QaDTO;
import com.air.common.ReviewDTO;
import com.air.jdy.AccDAO;
import com.air.jdy.AccDTO;
import com.air.jdy.OfferDTO;
import com.air.jdy.ThemeDTO;
import com.air.kdh.HaccDAO;
import com.air.kdh.HostDAO;
import com.air.kdh.MemberDAO;
import com.air.kdh.PaymentsDAO;
import com.air.kdh.QaDAO;
import com.air.kdh.ReviewDAO;




@Controller
public class KdhController {

	
	@Autowired
	HostDAO dao;
	@Autowired
	MemberDAO mdao;
	@Autowired
	ReviewDAO rdao;
	
	@Autowired
	HaccDAO hdao;
	
	@Autowired
	AccDAO tdao;
	
	@Autowired
	PaymentsDAO pdao;
	
	@Autowired
	QaDAO qdao;
	
	
	private final int rowsize = 6;
	private int totalRecord=0;
	
	
	  @RequestMapping("admin_login.do") 
	  public void login(AdminDTO dto,HttpServletResponse response) throws IOException {
	  response.setContentType("text/html; charset=UTF-8");
	  
	  PrintWriter out = response.getWriter();
	  
	  if(dto.getAdmin_id().equals("admin")){ if(dto.getAdmin_pwd().equals("1234"))
	  { out.println("<script>"); out.println("alert('관리자 로그인 성공!')");
	  out.println("location.href='admin_loginOk.do'"); out.println("</script>");
	  
	  } else if(dto.getAdmin_pwd()!="1234"){ out.println("<script>");
	  out.println("alert('비밀번호가 틀립니다.확인해 주세요~~~~')");
	  out.println("history.back()"); out.println("</script>"); } else {
	  out.println("<script>"); out.println("alert('없는 아이디입니다 다시한번 아이디를 확인하세요')");
	  out.println("history.back()"); out.println("</script>"); }
	  
	  
	 }
	  
	  }
	  
	 @RequestMapping("admin_loginOk.do") 
	 public String loginOk(HttpServletRequest request,Model model) {
		
		 int page;
			if(request.getParameter("page") != null) {
				page = Integer.parseInt(request.getParameter("page"));
			}else {
				page = 1;    // 처음으로 게시물 전체 목록 태그를 선택한 경우
			}
			
			totalRecord = this.dao.getListCount();
			
			PageDTO dto = new PageDTO(page, rowsize, totalRecord);
			
			List<HostDTO> list= this.dao.getHostList(dto);
			
			int totalRecords=this.mdao.getListCount();
			
			PageDTO dtos = new PageDTO(page, rowsize, totalRecords);
			
			
			List<MemberDTO> lists= this.mdao.getMemberList(dtos);
			
			int totalRecord1=this.rdao.getListCont();
	    	
	    	PageDTO dto1 =new PageDTO(page,rowsize,totalRecord1);
	    	System.out.println(dto1.getEndNo());
	    	
	    	
	    	List<ReviewDTO> list1 = this.rdao.getReviewList(dto1);
	    	System.out.println(dto.getEndNo());
	    	
	    	
	    	List<HaccDTO> list2=this.hdao.getHaccList();
	    	
	    	model.addAttribute("halist",list2);
	    	
	    	
	    	model.addAttribute("Page",dto1);
	    	model.addAttribute("Rlist",list1);
			
			
			model.addAttribute("mlist", lists);
			model.addAttribute("mpage", dtos);
			
			
			
		 
		 model.addAttribute("hlist", list);
		 model.addAttribute("Paging", dto);
		 return "kdh/main";
		 
	 }
	 
	
	@RequestMapping("kdh.do")
	public String main() {
		
		return "kdh/admin_login";
	}
	
	
	@RequestMapping("host_list.do")
	public String hlist(HttpServletRequest request,Model model) {
		int page;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}else {
			page = 1;    // 처음으로 게시물 전체 목록 태그를 선택한 경우
		}
		
		
		
		totalRecord = this.dao.getListCount();
		
		PageDTO dto = new PageDTO(page, rowsize, totalRecord);
		
		List<HostDTO> list= this.dao.getHostList(dto);
		model.addAttribute("hlist", list);
		model.addAttribute("Paging", dto);
		return "kdh/host_list";
		
	}
	
	@RequestMapping("host_insert.do")
	public String insert() {
		return "kdh/host_insert";
	}
	
	@RequestMapping("host_insert_ok.do")
	public void insertOk(MultipartHttpServletRequest hRequest,HostDTO dto, HttpServletResponse response) throws IOException {
		
		
		String uploadPath = "C:\\ncs\\workspace(spring)\\kdh\\AirKH\\src\\main\\webapp\\resources\\host\\";
		
		// 업로드된 파일들의 이름 목록을 제공하는 메서드.
		Iterator<String> iterator = hRequest.getFileNames();
		
		while(iterator.hasNext()) {
			
			String uploadFileName = iterator.next();
			
			MultipartFile mFile = hRequest.getFile(uploadFileName);
			
			// 업로드한 파일의 이름을 구하는 메서드.
			String originaleFileName = mFile.getOriginalFilename();
			
			// 실제 폴더를 만들어 보자.
			// ........\\resources\\upload\\2022-05-30
			
			
			// 실제 파일을 만들어 보자.
			
			String saveFile=uploadPath+originaleFileName;
			
				
				
				
				try {
					//  ........\\resources\\upload\\2022-05-30\\실제 파일
					// File origin = new File(homedir + "/" + saveFileName);
					mFile.transferTo(new File(saveFile));
					
					dto.setHost_pic(originaleFileName);
					
					System.out.println("origin file >>> " + originaleFileName);
					
					// transferTo() : 파일 데이터를 지정한 폴더로 실제 저장시키는 메서드. 
					
					
					//isUpload = true;
				} catch (Exception e) {
					// TODO Auto-generated catch block
					
				}
			
		}  // while문 end
    	
    	
		
		
		int check=this.dao.insertHost(dto);
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(check > 0) {
			out.println("<script>");
			out.println("alert('사업주 등록 성공!!!')");
			out.println("location.href='host_list.do'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('사업주 등록 실패~~~')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		
	}
	
	@RequestMapping("host_content.do")
	public String content(@RequestParam("no")int num,@RequestParam("page") int nowPage,Model model) {
		HostDTO dto=this.dao.getHost(num);
		model.addAttribute("cont",dto);
		model.addAttribute("Page", nowPage);
		
		return "kdh/host_content";
	}
	
	@RequestMapping("host_modify.do")
	public String modify(@RequestParam("num")int num,@RequestParam("page") int nowPage,Model model) {
		HostDTO dto=this.dao.getHost(num);
		model.addAttribute("modify",dto);
		model.addAttribute("Page", nowPage);
		
		return "kdh/host_modify";
	}
	
	@RequestMapping("host_modify_ok.do")
	public void modifyOk(MultipartHttpServletRequest hRequest,HostDTO dto,@RequestParam("page") int nowPage, HttpServletResponse response) throws IOException	{
		
		
		
		String uploadPath = "C:\\ncs\\workspace(spring)\\kdh\\AirKH\\src\\main\\webapp\\resources\\host\\";
		
		// 업로드된 파일들의 이름 목록을 제공하는 메서드.
		Iterator<String> iterator = hRequest.getFileNames();
		
		while(iterator.hasNext()) {
			
			String uploadFileName = iterator.next();
			
			MultipartFile mFile = hRequest.getFile(uploadFileName);
			
			// 업로드한 파일의 이름을 구하는 메서드.
			String originaleFileName = mFile.getOriginalFilename();
			
			// 실제 폴더를 만들어 보자.
			// ........\\resources\\upload\\2022-05-30
			
			
			// 실제 파일을 만들어 보자.
			
			String saveFile=uploadPath+originaleFileName;
			
				
				
				
				try {
					//  ........\\resources\\upload\\2022-05-30\\실제 파일
					// File origin = new File(homedir + "/" + saveFileName);
					mFile.transferTo(new File(saveFile));
					
					dto.setHost_pic(originaleFileName);
					
					System.out.println("origin file >>> " + originaleFileName);
					
					// transferTo() : 파일 데이터를 지정한 폴더로 실제 저장시키는 메서드. 
					
					
					//isUpload = true;
				} catch (Exception e) {
					// TODO Auto-generated catch block
					
				}
			
		}  // while문 end
    	
		
		
		int check =this.dao.updateHost(dto);
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			out.println("<script>");
			out.println("alert('사업주 수정 성공!!!')");
			out.println("location.href='host_content.do?no="+dto.getHost_num()+"&page="+nowPage+"'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('사업주 수정 실패~~~')");
			out.println("history.back()");
			out.println("</script>");
		}
		
	}
	@RequestMapping("host_delete.do")
	public void delete(@RequestParam("num")int num, @RequestParam("page") int nowPage, HttpServletResponse response) throws IOException {
		int check=this.dao.deleteHost(num);
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			
			this.dao.updateSequence(num);
			
			out.println("<script>");
			out.println("alert('사업주 삭제 성공!!!')");
			out.println("location.href='host_list.do?page="+nowPage+"'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('사업주 삭제 실패~~~')");
			out.println("history.back()");
			out.println("</script>");
		}
		
	}
	
	@RequestMapping("host_search.do")
	public String search(@RequestParam("field") String field,
			@RequestParam("keyword") String keyword,@RequestParam("page")int nowPage, Model model) {
		totalRecord=this.dao.searchHostCount(field, keyword);
		
		PageDTO dto = new PageDTO(nowPage, rowsize, totalRecord, field, keyword);
		List<HostDTO> searchList = this.dao.searchHostList(dto);
		
		model.addAttribute("search", searchList);
		model.addAttribute("page", dto);
		
		return "kdh/host_searchList";
	}
	
	
	@RequestMapping("member_list.do")
	public String mlist(HttpServletRequest request,Model model) {
		int page;
		if(request.getParameter("page")!=null) {
			page = Integer.parseInt(request.getParameter("page"));
		} else {
			page= 1; 
		}
		
		totalRecord=this.mdao.getListCount();
		
		PageDTO dto = new PageDTO(page, rowsize, totalRecord);
		
		
		List<MemberDTO> list= this.mdao.getMemberList(dto);
		model.addAttribute("mlist", list);
		model.addAttribute("mpage", dto);
		return "kdh/member_list";
		
	}
	
    @RequestMapping("member_insert.do")
    public String minsert(){
    	return "kdh/member_insert";
    	
    }
    
    @RequestMapping("member_insert_ok.do")
    public void minsertOk(MultipartHttpServletRequest mRequest,MemberDTO dto,HttpServletResponse response) throws IOException {

			
		String uploadPath = "C:\\ncs\\workspace(spring)\\kdh\\AirKH\\src\\main\\webapp\\resources\\member\\";
		
		// 업로드된 파일들의 이름 목록을 제공하는 메서드.
		Iterator<String> iterator = mRequest.getFileNames();
		
		while(iterator.hasNext()) {
			
			String uploadFileName = iterator.next();
			
			MultipartFile mFile = mRequest.getFile(uploadFileName);
			
			// 업로드한 파일의 이름을 구하는 메서드.
			String originaleFileName = mFile.getOriginalFilename();
			
			// 실제 폴더를 만들어 보자.
			// ........\\resources\\upload\\2022-05-30
			
			
			// 실제 파일을 만들어 보자.
			
			String saveFile=uploadPath+originaleFileName;
			
				
				
				
				try {
					//  ........\\resources\\upload\\2022-05-30\\실제 파일
					// File origin = new File(homedir + "/" + saveFileName);
					mFile.transferTo(new File(saveFile));
					
					dto.setMember_pic(originaleFileName);
					
					System.out.println("origin file >>> " + originaleFileName);
					
					// transferTo() : 파일 데이터를 지정한 폴더로 실제 저장시키는 메서드. 
					
					
					//isUpload = true;
				} catch (Exception e) {
					// TODO Auto-generated catch block
					
				}
			
		}  // while문 end
    	
    	
    	
    	
    	int check=this.mdao.insertMember(dto);
    	
    	response.setContentType("text/html;charset=UTF-8");
    	
    	PrintWriter out=response.getWriter();
    	
    	if(check>0) {
    		out.println("<script>");
    		out.println("alert('회원등록 성공!!')");
    		out.println("location.href='member_list.do'");
    		out.println("</script>");
    	} else {
    		out.println("<script>");
    		out.println("alert('회원등록 실패~~')");
    		out.println("history.back()");
    		out.println("</script>");
    	}
    		
    	
    }
    
    @RequestMapping("member_content.do")
    public String mcontent(@RequestParam("no")int no,@RequestParam("page")int nowPage, Model model) {
    	MemberDTO dto=this.mdao.memberCont(no);
    	
    	model.addAttribute("Page",nowPage);
    	model.addAttribute("Cont",dto);
    	
    	return "kdh/member_content";
    }
    
    @RequestMapping("member_modify.do")
    public String mmodify(@RequestParam("no")int no,@RequestParam("page")int nowPage, Model model) {
    	MemberDTO dto=this.mdao.memberCont(no);
    	
    	model.addAttribute("Page",nowPage);
    	model.addAttribute("modify",dto);
    	
    	return "kdh/member_modify";
    }
    
    @RequestMapping("member_modify_ok.do")
    public void mmodifyOk(MultipartHttpServletRequest mRequest, MemberDTO dto,@RequestParam("page")int nowPage,HttpServletResponse response) throws IOException {
    	
		String uploadPath = "C:\\ncs\\workspace(spring)\\kdh\\AirKH\\src\\main\\webapp\\resources\\member\\";
		
		// 업로드된 파일들의 이름 목록을 제공하는 메서드.
		Iterator<String> iterator = mRequest.getFileNames();
		
		while(iterator.hasNext()) {
			
			String uploadFileName = iterator.next();
			
			MultipartFile mFile = mRequest.getFile(uploadFileName);
			
			// 업로드한 파일의 이름을 구하는 메서드.
			String originaleFileName = mFile.getOriginalFilename();
			
			// 실제 폴더를 만들어 보자.
			// ........\\resources\\upload\\2022-05-30
			
			
			// 실제 파일을 만들어 보자.
			
			String saveFile=uploadPath+originaleFileName;
			
				
				
				
				try {
					//  ........\\resources\\upload\\2022-05-30\\실제 파일
					// File origin = new File(homedir + "/" + saveFileName);
					mFile.transferTo(new File(saveFile));
					
					dto.setMember_pic(originaleFileName);
					
					System.out.println("origin file >>> " + originaleFileName);
					
					// transferTo() : 파일 데이터를 지정한 폴더로 실제 저장시키는 메서드. 
					
					
					//isUpload = true;
				} catch (Exception e) {
					// TODO Auto-generated catch block
					
				}
			
		}  // while문 end
    	
    	
    	int check =this.mdao.updateMember(dto);
    	
    	response.setContentType("text/html;charset=UTF-8");
    	
    	PrintWriter out=response.getWriter();
    	
    	if(check>0) {
    		out.println("<script>");
    		out.println("alert('회원수정 성공')");
    		out.println("location.href='member_content.do?no="+dto.getMember_num()+"&page="+nowPage +"'");
    		out.println("</script>");
    		
    	}else {
    		
    		out.println("<script>");
    		out.println("alert('회원수정 실패')");
    		out.println("history.back()");
    		out.println("</script>");
    	}
    	
    	
    }
    
    @RequestMapping("member_delete.do")
    public void mdelete(@RequestParam("no")int no,@RequestParam("page")int nowPage, HttpServletResponse response) throws IOException {
    	int check=this.mdao.deleteMember(no);
    	
    	response.setContentType("text/html;charset=UTF-8");
    	PrintWriter out=response.getWriter();
    	
    	if(check>0){
    		this.mdao.updateSequence(no);
    		
    		out.println("<script>");
			out.println("alert('회원정보 삭제 성공!!!')");
			out.println("location.href='member_list.do?page="+nowPage+"'");
			out.println("</script>");
    		
    		
    	}else {
			out.println("<script>");
			out.println("alert('회원정보 삭제 실패~~~')");
			out.println("history.back()");
			out.println("</script>");
		}
		
    	
    	
    }
    
    @RequestMapping("member_search.do")
	public String msearch(@RequestParam("field") String field,
			@RequestParam("keyword") String keyword,@RequestParam("page")int nowPage, Model model) {
		totalRecord=this.mdao.searchMemberCount(field, keyword);
		
		PageDTO dto = new PageDTO(nowPage, rowsize, totalRecord, field, keyword);
		List<MemberDTO> searchList = this.mdao.searchMemberList(dto);
		
		model.addAttribute("Search", searchList);
		model.addAttribute("spage", dto);
		
		
		return "kdh/member_searchList";
	}
    
    @RequestMapping("review_list.do")
    public String rlist(HttpServletRequest request,Model model) {
    	
    	int page;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}else {
			page = 1;    // 처음으로 게시물 전체 목록 태그를 선택한 경우
		}
		
		
    	totalRecord=this.rdao.getListCont();
    	
    	PageDTO dto =new PageDTO(page,rowsize,totalRecord);
    	System.out.println(dto.getEndNo());
    	
    	
    	List<ReviewDTO> list = this.rdao.getReviewList(dto);
    	System.out.println(dto.getEndNo());
    	
    	model.addAttribute("Page",dto);
    	model.addAttribute("Rlist",list);
    	
    	return "kdh/review_list";
    	
    	
    }
    
    @RequestMapping("review_write.do")
    public String write() {
    	
    	return "kdh/review_write";
    }
    
    
    @RequestMapping("review_write_ok.do")
    public void rwriteOk(MultipartHttpServletRequest mRequest, ReviewDTO dto, HttpServletResponse response) throws IOException {
    	String uploadPath = "C:\\ncs\\workspace(spring)\\kdh\\AirKH\\src\\main\\webapp\\resources\\member\\";
		
		// 업로드된 파일들의 이름 목록을 제공하는 메서드.
		Iterator<String> iterator = mRequest.getFileNames();
		
		while(iterator.hasNext()) {
			
			String uploadFileName = iterator.next();
			
			MultipartFile mFile = mRequest.getFile(uploadFileName);
			
			// 업로드한 파일의 이름을 구하는 메서드.
			String originaleFileName = mFile.getOriginalFilename();
			
			// 실제 폴더를 만들어 보자.
			// ........\\resources\\upload\\2022-05-30
			
			
			// 실제 파일을 만들어 보자.
			
			String saveFile=uploadPath+originaleFileName;
			
				
				
				
				try {
					//  ........\\resources\\upload\\2022-05-30\\실제 파일
					// File origin = new File(homedir + "/" + saveFileName);
					mFile.transferTo(new File(saveFile));
					
					dto.setMember_pic(originaleFileName);
					
					System.out.println("origin file >>> " + originaleFileName);
					
					// transferTo() : 파일 데이터를 지정한 폴더로 실제 저장시키는 메서드. 
					
					
					//isUpload = true;
				} catch (Exception e) {
					// TODO Auto-generated catch block
					
				}
			
		}  // while문 end
    	
    	
    	
    	int check= this.rdao.insertReview(dto);
    	
    	response.setContentType("text/html; charset=UTF-8");
    	PrintWriter out = response.getWriter();
    	
    	if(check > 0) {
			out.println("<script>");
			out.println("alert('리뷰추가 성공!!!')");
			out.println("location.href='review_list.do'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('리뷰 추가 실패')");
			out.println("history.back()");
			out.println("</script>");
		}
    	
    }
    
    @RequestMapping("review_content.do")
    public String rcontent(@RequestParam("no") int no,
			@RequestParam("page") int nowPage, Model model) {
		
		
		// 게시글 상세 내역을 조회하는 메서드 호출
		ReviewDTO dto = this.rdao.ReviewCont(no);
		
		model.addAttribute("Cont", dto);
		
		model.addAttribute("Page", nowPage);
		
		return "kdh/review_content";
	}
	
	@RequestMapping("review_modify.do")
	public String rmodify(@RequestParam("no") int no,
			@RequestParam("page") int nowPage, Model model) {
		
		
		
		
		// 게시글 상세 내역을 조회하는 메서드 호출
		ReviewDTO dto = this.rdao.ReviewCont(no);
		
		model.addAttribute("Modify", dto);
		
		model.addAttribute("Page", nowPage);
		
		return "kdh/review_modify";
	}
	
	@RequestMapping("review_modify_ok.do")
    public void rmodifyOk(MultipartHttpServletRequest mRequest,ReviewDTO dto,@RequestParam("page")int nowPage,HttpServletResponse response) throws IOException {
		String uploadPath = "C:\\ncs\\workspace(spring)\\kdh\\AirKH\\src\\main\\webapp\\resources\\member\\";
		
		// 업로드된 파일들의 이름 목록을 제공하는 메서드.
		Iterator<String> iterator = mRequest.getFileNames();
		
		while(iterator.hasNext()) {
			
			String uploadFileName = iterator.next();
			
			MultipartFile mFile = mRequest.getFile(uploadFileName);
			
			// 업로드한 파일의 이름을 구하는 메서드.
			String originaleFileName = mFile.getOriginalFilename();
			
			// 실제 폴더를 만들어 보자.
			// ........\\resources\\upload\\2022-05-30
			
			
			// 실제 파일을 만들어 보자.
			
			String saveFile=uploadPath+originaleFileName;
			
				
				
				
				try {
					//  ........\\resources\\upload\\2022-05-30\\실제 파일
					// File origin = new File(homedir + "/" + saveFileName);
					mFile.transferTo(new File(saveFile));
					
					dto.setMember_pic(originaleFileName);
					
					System.out.println("origin file >>> " + originaleFileName);
					
					// transferTo() : 파일 데이터를 지정한 폴더로 실제 저장시키는 메서드. 
					
					
					//isUpload = true;
				} catch (Exception e) {
					// TODO Auto-generated catch block
					
				}
			
		}  // while문 end
		
		
    	int check =this.rdao.updateReview(dto);
    	
    	response.setContentType("text/html;charset=UTF-8");
    	
    	PrintWriter out=response.getWriter();
    	
    	if(check>0) {
    		out.println("<script>");
    		out.println("alert('리뷰수정 성공')");
    		out.println("location.href='review_content.do?no="+dto.getReview_num()+"&page="+nowPage +"'");
    		out.println("</script>");
    		
    	}else {
    		
    		out.println("<script>");
    		out.println("alert('리뷰수정 실패')");
    		out.println("history.back()");
    		out.println("</script>");
    	}
    	
    	
    }
	
	@RequestMapping("review_delete.do")
	public void rdelete(@RequestParam("no")int no,@RequestParam("page")int nowPage, HttpServletResponse response) throws IOException {
    	int check=this.rdao.deleteReview(no);
    	
    	response.setContentType("text/html;charset=UTF-8");
    	PrintWriter out=response.getWriter();
    	
    	if(check>0){
    		this.rdao.updateSequence(no);
    		
    		out.println("<script>");
			out.println("alert('리뷰정보 삭제 성공!!!')");
			out.println("location.href='review_list.do?page="+nowPage+"'");
			out.println("</script>");
    		
    		
    	}else {
			out.println("<script>");
			out.println("alert('회원정보 삭제 실패~~~')");
			out.println("history.back()");
			out.println("</script>");
		}
		
    	
    	
    }
	
	
	@RequestMapping("review_search.do")
	public String rsearch(@RequestParam("field") String field,
			@RequestParam("keyword") String keyword,@RequestParam("page")int nowPage,Model model) {
		totalRecord=this.rdao.searchReviewCount(field, keyword);
		
		PageDTO dto = new PageDTO(nowPage, rowsize, totalRecord, field, keyword);
		List<ReviewDTO> searchList = this.rdao.searchReviewList(dto);
		
		model.addAttribute("Search", searchList);
		model.addAttribute("rpage", dto);
		
		
		return "kdh/review_searchList";
		
		
		
	} 
	
	
	@RequestMapping("payment_list.do")
	public String plist(HttpServletRequest request,Model model) {
		int page;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}else {
			page = 1;    // 처음으로 게시물 전체 목록 태그를 선택한 경우
		}
		
		int rowsizes =10;
		totalRecord = this.pdao.getListCount();
		
		PageDTO dto = new PageDTO(page, rowsizes, totalRecord);
		
		List<PaymentDTO> list= this.pdao.getPaymentsList(dto);
		model.addAttribute("palist", list);
		model.addAttribute("Paging", dto);
		return "kdh/payment_list";
		
	}
	
	@RequestMapping("payment_insert.do")
	public String pinsert() {
		return "kdh/payment_insert";
		
	}
	

    @RequestMapping("payment_insert_ok.do")
    public void rwriteOk(MultipartHttpServletRequest pRequest, PaymentDTO dto, HttpServletResponse response) throws IOException {
    	
    	String uploadPath = "C:\\ncs\\workspace(spring)\\kdh\\AirKH\\src\\main\\webapp\\resources\\upload\\2022-06-13\\";
		
		// 업로드된 파일들의 이름 목록을 제공하는 메서드.
		Iterator<String> iterator = pRequest.getFileNames();
		
		while(iterator.hasNext()) {
			
			String uploadFileName = iterator.next();
			
			MultipartFile mFile = pRequest.getFile(uploadFileName);
			
			// 업로드한 파일의 이름을 구하는 메서드.
			String originaleFileName = mFile.getOriginalFilename();
			
			// 실제 폴더를 만들어 보자.
			// ........\\resources\\upload\\2022-05-30
			
			
			// 실제 파일을 만들어 보자.
			
			String saveFile=uploadPath+originaleFileName;
			
				
				
				
				try {
					//  ........\\resources\\upload\\2022-05-30\\실제 파일
					// File origin = new File(homedir + "/" + saveFileName);
					mFile.transferTo(new File(saveFile));
					
					dto.setAcc_thumbnail(originaleFileName);
					
					System.out.println("origin file >>> " + originaleFileName);
					
					// transferTo() : 파일 데이터를 지정한 폴더로 실제 저장시키는 메서드. 
					
					
					//isUpload = true;
				} catch (Exception e) {
					// TODO Auto-generated catch block
					
				}
			
		}  // while문 end
    	int check= this.pdao.insertPayments(dto);
    	
    	response.setContentType("text/html; charset=UTF-8");
    	PrintWriter out = response.getWriter();
    	
    	if(check > 0) {
			out.println("<script>");
			out.println("alert('결제칼럼추가 성공!!!')");
			out.println("location.href='payment_list.do'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('결제컬럼추가 실패')");
			out.println("history.back()");
			out.println("</script>");
		}
    	
    }
    
    @RequestMapping("payment_content.do")
    public String pcontent(@RequestParam("num")int no,@RequestParam("page")int nowPage, Model model) {
    	PaymentDTO dto=this.pdao.paymentCont(no);
    	
    	model.addAttribute("Page",nowPage);
    	model.addAttribute("Cont",dto);
    	
    	return "kdh/payment_content";
    }
    
    @RequestMapping("payment_modify.do")
    public String pmodify(@RequestParam("no")int no,@RequestParam("page")int nowPage, Model model) {
    	PaymentDTO dto=this.pdao.paymentCont(no);
    	
    	model.addAttribute("Page",nowPage);
    	model.addAttribute("Modi",dto);
    	
    	return "kdh/payment_modify";
    }
    
    @RequestMapping("payment_modify_ok.do")
  public void pmodifyOk(MultipartHttpServletRequest pRequest, PaymentDTO dto,@RequestParam("page")int nowPage, HttpServletResponse response) throws IOException {
    	
    	String uploadPath = "C:\\ncs\\workspace(spring)\\kdh\\AirKH\\src\\main\\webapp\\resources\\upload\\2022-06-13\\";
		
		// 업로드된 파일들의 이름 목록을 제공하는 메서드.
		Iterator<String> iterator = pRequest.getFileNames();
		
		while(iterator.hasNext()) {
			
			String uploadFileName = iterator.next();
			
			MultipartFile mFile = pRequest.getFile(uploadFileName);
			
			// 업로드한 파일의 이름을 구하는 메서드.
			String originaleFileName = mFile.getOriginalFilename();
			
			// 실제 폴더를 만들어 보자.
			// ........\\resources\\upload\\2022-05-30
			
			
			// 실제 파일을 만들어 보자.
			
			String saveFile=uploadPath+originaleFileName;
			
				
				
				
				try {
					//  ........\\resources\\upload\\2022-05-30\\실제 파일
					// File origin = new File(homedir + "/" + saveFileName);
					mFile.transferTo(new File(saveFile));
					
					dto.setAcc_thumbnail(originaleFileName);
					
					System.out.println("origin file >>> " + originaleFileName);
					
					// transferTo() : 파일 데이터를 지정한 폴더로 실제 저장시키는 메서드. 
					
					
					//isUpload = true;
				} catch (Exception e) {
					// TODO Auto-generated catch block
					
				}
			
		}  // while문 end
    	int check= this.pdao.updatePayments(dto);
    	
    	response.setContentType("text/html; charset=UTF-8");
    	PrintWriter out = response.getWriter();
    	
    	if(check > 0) {
			out.println("<script>");
			out.println("alert('결제칼럼수정 성공!!!')");
			out.println("location.href='payment_content.do?num="+dto.getCart_num()+"&page="+nowPage +"'");
			
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('결제컬럼수정 실패')");
			out.println("history.back()");
			out.println("</script>");
		}
    	
    }
    
    @RequestMapping("payment_delete.do")
    public void pdelete(@RequestParam("no")int no,@RequestParam("page")int nowPage, HttpServletResponse response) throws IOException {
    	int check=this.pdao.deletePayments(no);
    	
    	response.setContentType("text/html;charset=UTF-8");
    	PrintWriter out=response.getWriter();
    	
    	if(check>0){
    		this.pdao.updateSequence(no);
    		
    		out.println("<script>");
			out.println("alert('결제내역 삭제 성공!!!')");
			out.println("location.href='payment_list.do?page="+nowPage+"'");
			out.println("</script>");
    		
    		
    	}else {
			out.println("<script>");
			out.println("alert('결제내역 삭제 실패~~~')");
			out.println("history.back()");
			out.println("</script>");
		}
		
    	
    	
    }
    
    @RequestMapping("payment_tolist.do")
  	public String ptolist(@RequestParam("page")int nowPage,@RequestParam("no")int no,HttpServletRequest request,Model model) {
  		int page;
  		if(request.getParameter("page") != null) {
  			page = Integer.parseInt(request.getParameter("page"));
  		}else {
  			page = 1;    // 처음으로 게시물 전체 목록 태그를 선택한 경우
  		}
  		
  		totalRecord = this.pdao.getListCount(no);
  		
  		PageDTO dto = new PageDTO(no, page, rowsize, totalRecord);
  		
  		List<PaymentDTO> list= this.pdao.getPaymentoList(dto);
  		model.addAttribute("palist", list);
  		model.addAttribute("Paging", nowPage);
  		return "kdh/payment_tolist";
  		
  	}
    
    
    @RequestMapping("hacc_list.do")
    public String alist(HttpServletRequest request, Model model) {
    	List<HaccDTO> list=this.hdao.getHaccList();
    	
    	model.addAttribute("halist",list);
    	return"kdh/hacc_list";
    	
    }
    
    
    @RequestMapping("hacc_insert.do")
	public String hainsert(Model model) {
    	List<ThemeDTO> tlist = this.tdao.getThemeList();
		model.addAttribute("tList", tlist);
		return "kdh/hacc_insert";
		
	}
    
    
    @RequestMapping("hacc_insert_ok.do")
    
    public void hinsertOk(MultipartHttpServletRequest pRequest, HaccDTO dto, HttpServletResponse response) throws IOException {
    	
    	String uploadPath = "C:\\ncs\\workspace(spring)\\kdh\\AirKH\\src\\main\\webapp\\resources\\upload\\2022-06-13\\";
		
		// 업로드된 파일들의 이름 목록을 제공하는 메서드.
		Iterator<String> iterator = pRequest.getFileNames();
		
		while(iterator.hasNext()) {
			
			String uploadFileName = iterator.next();
			
			MultipartFile mFile = pRequest.getFile(uploadFileName);
			
			// 업로드한 파일의 이름을 구하는 메서드.
			String originaleFileName = mFile.getOriginalFilename();
			
			// 실제 폴더를 만들어 보자.
			// ........\\resources\\upload\\2022-05-30
			
			
			// 실제 파일을 만들어 보자.
			
			String saveFile=uploadPath+originaleFileName;
			System.out.println("saveFile"+saveFile);
			
				
				
				
				try {
					//  ........\\resources\\upload\\2022-05-30\\실제 파일
					// File origin = new File(homedir + "/" + saveFileName);
					mFile.transferTo(new File(saveFile));
					
					dto.setAcc_thumbnail(originaleFileName);
					
					System.out.println("origin file >>> " + originaleFileName);
					
					// transferTo() : 파일 데이터를 지정한 폴더로 실제 저장시키는 메서드. 
					
					
					//isUpload = true;
				} catch (Exception e) {
					// TODO Auto-generated catch block
					
				}
			
		}  // while문 end
    	int check= this.hdao.insertHacc(dto);
    	
    	response.setContentType("text/html; charset=UTF-8");
    	PrintWriter out = response.getWriter();
    	
    	if(check > 0) {
			out.println("<script>");
			out.println("alert('숙소칼럼추가 성공!!!')");
			out.println("location.href='hacc_list.do'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('숙소컬럼추가 실패')");
			out.println("history.back()");
			out.println("</script>");
		}
    	
    }
    
    @RequestMapping("hacc_content.do")
    public String hacontent(@RequestParam("no")int no, Model model) {
    	
    	HaccDTO dto=this.hdao.getHacc(no);
    	
    	ThemeDTO tcont = this.tdao.getThemeCont(dto.getAcc_theme());
    	
    	List<OfferDTO> olist = this.tdao.getOfferList();
    	
    	String offer_str = dto.getAcc_offer();
		String[] offer_arr = offer_str.split(",");
		int[] int_arr = new int[offer_arr.length];
		
		
		
		for (int i = 0; i < offer_arr.length; i++) {
			
			int_arr[i] = Integer.parseInt(offer_arr[i]);
			System.out.println("int_arr["+int_arr[i]+"]");
				
		}
    	
    	model.addAttribute("Cont",dto);
    	model.addAttribute("Olist",olist);
    	model.addAttribute("tcont", tcont);
		model.addAttribute("offer", int_arr);
    	
    	return "kdh/hacc_content";
    }
    

    @RequestMapping("hacc_modify.do")
    public String hamodify(@RequestParam("no")int no, Model model) {
    	
    	HaccDTO dto=this.hdao.getHacc(no);
    	
    	List<ThemeDTO> tlist = this.tdao.getThemeList();
		
    	
    	ThemeDTO tcont = this.tdao.getThemeCont(dto.getAcc_theme());
    	
    	List<OfferDTO> olist = this.tdao.getOfferList();
    	
    	
		model.addAttribute("tList", tlist);
    	model.addAttribute("Modi",dto);
    	model.addAttribute("Olist",olist);
    	model.addAttribute("tcont", tcont);
		
    	
    	return "kdh/hacc_modify";
    }
    
    @RequestMapping("hacc_modify_ok.do")
    public void hmodifyOk(MultipartHttpServletRequest pRequest,HaccDTO dto,HttpServletResponse response) throws IOException {
    	String uploadPath = "C:\\ncs\\workspace(spring)\\kdh\\AirKH\\src\\main\\webapp\\resources\\upload\\2022-06-13\\";
		
		// 업로드된 파일들의 이름 목록을 제공하는 메서드.
		Iterator<String> iterator = pRequest.getFileNames();
		
		while(iterator.hasNext()) {
			
			String uploadFileName = iterator.next();
			
			MultipartFile mFile = pRequest.getFile(uploadFileName);
			
			// 업로드한 파일의 이름을 구하는 메서드.
			String originaleFileName = mFile.getOriginalFilename();
			
			// 실제 폴더를 만들어 보자.
			// ........\\resources\\upload\\2022-05-30
			
			
			// 실제 파일을 만들어 보자.
			
			String saveFile=uploadPath+originaleFileName;
			System.out.println("saveFile"+saveFile);
			
				
				
				
				try {
					//  ........\\resources\\upload\\2022-05-30\\실제 파일
					// File origin = new File(homedir + "/" + saveFileName);
					mFile.transferTo(new File(saveFile));
					
					dto.setAcc_thumbnail(originaleFileName);
					
					System.out.println("origin file >>> " + originaleFileName);
					
					// transferTo() : 파일 데이터를 지정한 폴더로 실제 저장시키는 메서드. 
					
					
					//isUpload = true;
				} catch (Exception e) {
					// TODO Auto-generated catch block
					
				}
			
		}  // while문 end
    	
    	int check =this.hdao.updateHacc(dto);
    	
    	response.setContentType("text/html;charset=UTF-8");
    	
    	PrintWriter out=response.getWriter();
    	
    	if(check>0) {
    		out.println("<script>");
    		out.println("alert('숙소수정 성공')");
    		out.println("location.href='hacc_content.do?no="+dto.getAcc_code()+"'");
    		out.println("</script>");
    		
    	}else {
    		
    		out.println("<script>");
    		out.println("alert('숙소수정 실패')");
    		out.println("history.back()");
    		out.println("</script>");
    	}
    	
    	
    }
    
    @RequestMapping("hacc_delete.do")
    public void hadelete(@RequestParam("no")int no, HttpServletResponse response) throws IOException {
    	int check=this.hdao.deleteHacc(no);
    	
    	response.setContentType("text/html;charset=UTF-8");
    	PrintWriter out=response.getWriter();
    	
    	if(check>0){
    		this.hdao.updateSequence(no);
    		
    		out.println("<script>");
			out.println("alert('숙소내역 삭제 성공!!!')");
			out.println("location.href='hacc_list.do'");
			out.println("</script>");
    		
    		
    	}else {
			out.println("<script>");
			out.println("alert('숙소내역 삭제 실패~~~')");
			out.println("history.back()");
			out.println("</script>");
		}
		
    	
    	
    }
    
    @RequestMapping("qa_list.do")
	public String clist(HttpServletRequest request,Model model) {
		int page;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}else {
			page = 1;    // 처음으로 게시물 전체 목록 태그를 선택한 경우
		}
		
		
		
		totalRecord = this.qdao.getListCont();
		int rowsizes=10;
		
		PageDTO dto = new PageDTO(page, rowsizes, totalRecord);
		
		List<QaDTO> list= this.qdao.getQaList(dto);
		model.addAttribute("qlist", list);
		model.addAttribute("Paging", dto);
		return "kdh/qa_list";
		
	}
    
    
    @RequestMapping("qa_write.do")
    public String qwrite() {
    	return "kdh/qa_write";
    }
    
    
    @RequestMapping("qa_writeOk.do")
    public void qwriteOk(QaDTO dto,HttpServletResponse response) throws IOException{
		int check=this.qdao.insertQa(dto);
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		if (check>0){
			out.println("<script>");
			out.println("alert('게시물 입력성공!')");
			out.println("location.href='qa_list.do'");
			out.println("</script>");
			
		}else {
			out.println("<script>");
			out.println("alert('게시물 입력실패~~~')");
			out.println("history.back()");
			out.println("</script>");

		}
			
	}
    
    @RequestMapping("qa_content.do")
    
    public String qcontent(@RequestParam("no")int no,@RequestParam("page")int nowPage, Model model) {
    	QaDTO dto=this.qdao.QaCont(no);
    	
    	model.addAttribute("Page",nowPage);
    	model.addAttribute("Cont",dto);
    	
    	return "kdh/qa_content";
    }
	
    @RequestMapping("qa_reply.do")
    public String qreply(@RequestParam("no") int no,
			@RequestParam("page") int nowPage, Model model) {
		
		
		
		
		// 게시글 상세 내역을 조회하는 메서드 호출
    	QaDTO dto=this.qdao.QaCont(no);
		
		model.addAttribute("re", dto);
		
		model.addAttribute("Page", nowPage);
		
		return "kdh/qa_reply";
    }
   
    
    @RequestMapping("reply_ok.do")
    public void rwriteOk(QaDTO dto,@RequestParam("page") int nowPage, HttpServletResponse response) throws IOException{
    	this.qdao.insertSt(dto);
    	int check=this.qdao.insertRe(dto);
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		if (check>0){
			out.println("<script>");
			out.println("alert('댓글 입력성공!')");
			out.println("location.href='qa_list.do?page="+nowPage+"'");
			out.println("</script>");
			
		}else {
			out.println("<script>");
			out.println("alert('댓글 입력실패~~~')");
			out.println("history.back()");
			out.println("</script>");

		}
			
    }
    
    
    @RequestMapping("qa_delete.do")
    public void qadelete(@RequestParam("no")int num, @RequestParam("page") int nowPage, HttpServletResponse response) throws IOException {
		int check=this.qdao.deleteQa(num);
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			
			this.qdao.updateSequence(num);
			
			out.println("<script>");
			out.println("alert('고객문의 삭제 성공!!!')");
			out.println("location.href='qa_list.do?page="+nowPage+"'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('고객문의 삭제 실패~~~')");
			out.println("history.back()");
			out.println("</script>");
		}
		
	}
    
    @RequestMapping("qa_modify.do")
    public String qamodify(@RequestParam("no") int no,
			@RequestParam("page") int nowPage, Model model) {
		
		
		
		
		// 게시글 상세 내역을 조회하는 메서드 호출
		QaDTO dto = this.qdao.QaCont(no);
		
		model.addAttribute("Modify", dto);
		
		model.addAttribute("Page", nowPage);
		
		return "kdh/qa_modify";
	}
    
    @RequestMapping("qa_modify_ok.do")
    public void qamodifyOk(QaDTO dto,@RequestParam("page")int nowPage, HttpServletResponse response) throws IOException {
      
      	int check= this.qdao.updateQa(dto);
      	
      	response.setContentType("text/html; charset=UTF-8");
      	PrintWriter out = response.getWriter();
      	
      	if(check > 0) {
  			out.println("<script>");
  			out.println("alert('고객센터글수정 성공!!!')");
  			out.println("location.href='qa_content.do?no="+dto.getQa_num()+"&page="+nowPage +"'");
  			
  			out.println("</script>");
  		}else {
  			out.println("<script>");
  			out.println("alert('고객센터글수정 실패')");
  			out.println("history.back()");
  			out.println("</script>");
  		}
      	
      }
    
    
    
    
}
	



