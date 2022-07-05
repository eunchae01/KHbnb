package com.air.khie;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.air.jdy.AccDAO;
import com.air.jdy.AccDTO;
import com.air.jdy.ThemeDTO;
import com.air.kyk.QA_PageDTO;
import com.air.kyk.QA_boardDAO;
import com.air.kyk.QA_boardDTO;
import com.air.kyk.ReviewDAOm;
import com.air.kyk.ReviewDTOm;

@Controller
public class KykController {

	
	@Autowired
	private ReviewDAOm re_dao;
	
	@Autowired
	private QA_boardDAO qa_dao;
	
	
	
	@RequestMapping("kyk.do")
	public String main() {
		return "kyk/main";
	}
	
	@RequestMapping("review_insert.do")
	public String re_insert() {
		
		
		return "kyk/review_insert";
				
	}
	
	@RequestMapping("review_insert_ok.do")
	public void re_insertOk(ReviewDTOm dto, @RequestParam("hostno") int hostno,HttpSession session, HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		
		int check = this.re_dao.insertReview(dto);
		this.re_dao.insertStar(dto.getAcc_code());
		
		if (check > 0) {
			out.println("<script>");
			out.println("alert('리뷰 작성 완료!')");
			out.println("location.href='acc_content.do?no="+dto.getAcc_code()+"&hostno="+hostno+"'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('리뷰작성 실패!')");
			out.println("history.back()");
			out.println("</script>");
		}
	}
	
	@RequestMapping("re_modify.do")
	public void re_modify( int review_num,
			HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		
		int check = this.re_dao.review_modify(review_num);
		
		if (check > 0) {
			
			
			out.println("<script>");
			out.println("alert('리뷰 수정 완료!')");
			out.println("location.href='jdy.do'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('리뷰작성 실패!')");
			out.println("history.back()");
			out.println("</script>");
		}
	}
	
	
	@RequestMapping("QA.do") // 멤버 로그인 체크
	public void QA_mcheck(HttpSession session,HttpServletResponse response, Model model) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		
		String mem_id = null;
		
		if(session.getAttribute("member_id")!=null) {
			out.println("<script>");
			mem_id = (String)session.getAttribute("member_id");
			 out.println("location.href='QA_main.do?qa_id="+mem_id+"'");
			 out.println("</script>");
			
		}else if(session.getAttribute("host_id")!=null){
			out.println("<script>"); 
			mem_id = (String)session.getAttribute("host_id");
			 out.println("location.href='QA_main.do?qa_id="+mem_id+"'");
			 out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('로그인해주세요!')");
			out.println("location.href='login.do'");
			out.println("</script>");
		}
	}
	
	@RequestMapping("QA_main.do")
	public String QA_member(HttpSession session,HttpServletRequest request ,Model model,HttpServletResponse response) {
		
		response.setContentType("text/html; charset=UTF-8");
		
		String mem_id=null;
		
		if(session.getAttribute("member_id")!=null) {
			
			mem_id = (String)session.getAttribute("member_id");
			 
			 List<QA_boardDTO> list = this.qa_dao.getQaList(mem_id);
			 model.addAttribute("qa_list", list);
			
		}else if(session.getAttribute("host_id")!=null){
			
			mem_id = (String)session.getAttribute("host_id");
			 
			 List<QA_boardDTO> list = this.qa_dao.getQaList(mem_id);
			 model.addAttribute("qa_list", list);
		}
		
		 
		 
		return "kyk/QA_main";
		
 
		
		
		
		
	}
	
	@RequestMapping("QA_write.do") // 멤버 인서트 폼
	public String QA_m_insert(HttpSession session, Model model) {
		String mem_id = null;
		if(session.getAttribute("member_id") !=null) {
			mem_id = (String)session.getAttribute("member_id");
			model.addAttribute("qa_id", mem_id);
		}else if(session.getAttribute("host_id") !=null) {
			mem_id = (String)session.getAttribute("host_id");
			model.addAttribute("qa_id", mem_id);
		}
		
		
		return "kyk/QA_insert";
		
	}
	
	@RequestMapping("QA_insertOk.do") // 멤버 인서트 완료
	public void QA_m_insertOk(HttpSession session,HttpServletResponse response,
			QA_boardDTO dto, Model model) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		int check = this.qa_dao.QA_insert(dto);
		String mem_id = null;
		if(session.getAttribute("member_id") != null) {
			mem_id = (String)session.getAttribute("member_id");
			if (check > 0) {
				out.println("<script>");
				out.println("alert('곧 답변해 드리겠습니다!')");
				out.println("location.href='QA_main.do?qa_id="+mem_id+"'");
				out.println("</script>");
			} else {
				out.println("<script>");
				out.println("alert('문의 실패')");
				out.println("history.back()");
				out.println("</script>");
			}
		}else if(session.getAttribute("host_id") !=null) {
			mem_id = (String)session.getAttribute("host_id");
			
			if (check > 0) {
				out.println("<script>");
				out.println("alert('곧 답변해 드리겠습니다!')");
				out.println("location.href='QA_main.do?qa_id="+mem_id+"'");
				out.println("</script>");
			} else {
				out.println("<script>");
				out.println("alert('문의 실패')");
				out.println("history.back()");
				out.println("</script>");
			}
		}
		
		
	}
	

	
	@RequestMapping("QA_content.do")
	public String QA_content(@RequestParam("qa_num") int qa_num, Model model) {
		QA_boardDTO list = this.qa_dao.getQaCont(qa_num);
		model.addAttribute("cont_list", list);
		
		return "kyk/QA_Cont";
	}
	
	@RequestMapping("QA_modify.do")
	public String QA_m_modify(@RequestParam("qa_num") int qa_num,  Model model) {
		QA_boardDTO list = this.qa_dao.getQaCont(qa_num);
		model.addAttribute("cont_list", list);
		 
		
		return "kyk/QA_modify";
	}
	@RequestMapping("QA_modifyOk.do")
	public void QA_modifyOk(QA_boardDTO dto, HttpSession session, Model model,HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		int check = this.qa_dao.QA_update(dto);
		
		if (check > 0) {
			out.println("<script>");
			out.println("alert('수정완료!!')");
			out.println("location.href='QA_main.do'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('문의 실패')");
			out.println("history.back()");
			out.println("</script>");
		}
	}
	
	@RequestMapping("QA_delete.do")
	public void QA_delete(@RequestParam("qa_num") int qa_num, Model model, HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		int check = this.qa_dao.QA_delete(qa_num);
		if (check > 0) {
			out.println("<script>");
			out.println("alert('삭제완료!!')");
			out.println("location.href='QA_main.do'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('삭제 실패')");
			out.println("history.back()");
			out.println("</script>");
		}
		
	}
	
}
