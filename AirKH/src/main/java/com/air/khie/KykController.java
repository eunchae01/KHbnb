package com.air.khie;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public void re_insertOk(ReviewDTOm dto, HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		
		int check = this.re_dao.insertReview(dto);
		
		if (check > 0) {
			out.println("<script>");
			out.println("alert('리뷰 작성 완료!')");
			out.println("location.href='acc_content.do?no="+dto.getAcc_code() +"'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('리뷰작성 실패!')");
			out.println("history.back()");
			out.println("</script>");
		}
	}
	
	@RequestMapping("QA_board.do")
	public String QA_boardMain() {
		return "kyk/QA_main";
	}
	
	@RequestMapping("QA_insert.do")
	public void QA_insert(QA_boardDTO dto, HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		int check = this.qa_dao.QA_insert(dto);
		
		if (check > 0) {
			out.println("<script>");
			out.println("alert('질문 완료!')");
			out.println("location.href='QA_list.do'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('질문 실패!')");
			out.println("history.back()");
			out.println("</script>");
		}
	}
}
