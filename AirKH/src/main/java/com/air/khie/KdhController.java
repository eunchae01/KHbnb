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
import com.air.common.HostDTO;
import com.air.common.MemberDTO;
import com.air.common.PageDTO;
import com.air.common.ReviewDTO;
import com.air.kdh.HostDAO;
import com.air.kdh.MemberDAO;
import com.air.kdh.ReviewDAO;


@Controller
public class KdhController {

	
	@Autowired
	HostDAO dao;
	@Autowired
	MemberDAO mdao;
	@Autowired
	ReviewDAO rdao;
	
	
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
	 public String loginOk() {
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
		
		
		String uploadPath = "C:\\Users\\user\\git\\KHbnb\\AirKH\\src\\main\\webapp\\resources\\host\\";
		
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
	public String content(@RequestParam("num")int num,@RequestParam("page") int nowPage,Model model) {
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
		
		String uploadPath = "C:\\Users\\user\\git\\KHbnb\\AirKH\\src\\main\\webapp\\resources\\host\\";
		
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
			out.println("location.href='host_content.do?num="+dto.getHost_num()+"&page="+nowPage+"'");
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

			
		String uploadPath = "C:\\Users\\user\\git\\KHbnb\\AirKH\\src\\main\\webapp\\resources\\member\\";
		
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
    	
		String uploadPath = "C:\\Users\\user\\git\\KHbnb\\AirKH\\src\\main\\webapp\\resources\\member\\";
		
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
    public void rwriteOk(ReviewDTO dto, HttpServletResponse response) throws IOException {
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
    public void rmodifyOk(ReviewDTO dto,@RequestParam("page")int nowPage,HttpServletResponse response) throws IOException {
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
	
    
	
}
