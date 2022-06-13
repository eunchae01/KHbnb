package com.air.khie;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.air.jdy.AccDAO;
import com.air.jdy.AccDTO;
import com.air.jdy.OfferDTO;
import com.air.jdy.ThemeDTO;

@Controller
public class JdyController {

	@Autowired
	private AccDAO dao;
	
	// 메인페이지
	@RequestMapping("jdy.do")
	public String list(Model model) {
		
		List<AccDTO> list = this.dao.getAccList();
		List<ThemeDTO> tlist = this.dao.getThemeList();

		model.addAttribute("List", list);
		model.addAttribute("tList", tlist);
		
		return "jdy/main";
	}
	
	// 호스트 기능 : 숙소 등록 호스트 코드 필요함!!!!!!!!!!!!!!!!!
	@RequestMapping("acc_insert.do")
	public String insert(@RequestParam int no, Model model) {
		
		List<ThemeDTO> tlist = this.dao.getThemeList();
		model.addAttribute("tList", tlist);
		
		//no = 호스트 넘버
		
		return "jdy/acc_insert";
	}
	
	// 호스트 기능 : 숙소 등록 호스트 코드 필요함!!!!!!!!!!!!!!!!! 지금은 강제로 1번 나중에 수정하기
	@RequestMapping("acc_insert_ok.do")
	public String insertOk(AccDTO dto, HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
//		String FileName = this.dao.uploadFile(mRequest);
//		dto.setAcc_thumbnail(FileName);
//		
//		if(FileName != null) {
//			out.println("<script>");
//			out.println("alert('사진 등록 성공!')");
//			out.println("</script>");
//		}else {
//			out.println("<script>");
//			out.println("alert('사진 등록 실패!')");
//			out.println("</script>");
//		}
		
		int check = this.dao.insertAcc(dto);
		
		if(check > 0) {
			return "jdy/acc_insert_ok";
		}else {
			out.println("<script>");
			out.println("alert('숙소 등록 실패!')");
			out.println("history.back()");
			out.println("</script>");
			return null;
		}
	}
	
	// 사용자 숙소 상세 페이지
	@RequestMapping("acc_content.do")
	public String content(@RequestParam int no, Model model) {
		
		AccDTO dto = this.dao.getAccCont(no);
		List<OfferDTO> olist = this.dao.getOfferList();
		
		String offer_str = dto.getAcc_offer();
		String[] offer_arr = offer_str.split(",");
		int[] int_arr = new int[offer_arr.length];
		
		for(int i=0; i<offer_arr.length; i++) {
			int_arr[i] = Integer.parseInt(offer_arr[i]);
		}
		
		model.addAttribute("Cont", dto);
		model.addAttribute("oList", olist);
		model.addAttribute("offer", int_arr);
		
		return "jdy/acc_cont";
	}
	
	// 사용자 nav-bar 테마 검색
	@RequestMapping("search_theme.do")
	public String searchT(@RequestParam int no, Model model) {
		
		List<AccDTO> list = this.dao.searchByThemeAcc(no);
		
		model.addAttribute("List", list);
		
		return "jdy/acc_search_result";
		
	}
	
	// 호스트: 호스팅하고 있는 숙소 리스트 조회
	@RequestMapping("host_acc_list.do")
	public String hostAList(@RequestParam int no, Model model) {
		
		List<AccDTO> list = this.dao.getAccListForHost(no);
		
		model.addAttribute("List", list);
		
		return "jdy/host_acc_list";
	}
	
	// 호스트: 숙소 상세 페이지
	@RequestMapping("host_acc_cont.do")
	public String hostACont(@RequestParam int no, Model model) {
		
		AccDTO dto = this.dao.getAccCont(no);
		List<OfferDTO> olist = this.dao.getOfferList();
		
		String offer_str = dto.getAcc_offer();
		String[] offer_arr = offer_str.split(",");
		int[] int_arr = new int[offer_arr.length];
		
		for(int i=0; i<offer_arr.length; i++) {
			int_arr[i] = Integer.parseInt(offer_arr[i]);
		}
		
		model.addAttribute("Cont", dto);
		model.addAttribute("oList", olist);
		model.addAttribute("offer", int_arr);
		
		return "jdy/host_acc_cont";
	}
	
	// 호스트: 숙소 수정 버튼 클릭 -> 수정 페이지로 이동
	@RequestMapping("host_acc_modify.do")
	public String hostAModify(@RequestParam int no, Model model) {
		
		AccDTO dto = this.dao.getAccCont(no);
		List<OfferDTO> olist = this.dao.getOfferList();
		
		String offer_str = dto.getAcc_offer();
		String[] offer_arr = offer_str.split(",");
		int[] int_arr = new int[offer_arr.length];
		
		for(int i=0; i<offer_arr.length; i++) {
			int_arr[i] = Integer.parseInt(offer_arr[i]);
		}
		
		model.addAttribute("Cont", dto);
		model.addAttribute("oList", olist);
		model.addAttribute("offer", int_arr);
		
		return "jdy/host_acc_modify";
	}
	
	// 호스트: 수정 페이지에서 수정하기 비번 안넣음!!!!!비번확인!!!!
	@RequestMapping("acc_modify_ok.do")
	public void hostAModifyOk(AccDTO dto, HttpServletResponse response) throws IOException {
		
		int check = this.dao.updateAcc(dto);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			out.println("<script>");
			out.println("alert('숙소 수정 성공!')");
			out.println("location.href='host_acc_list.do?no=" + dto.getAcc_host() + "'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('숙소 수정 실패!')");
			out.println("history.back()");
			out.println("</script>");
		}
		
	}
	
	// 호스트: 숙소 상세 페이지의 삭제 버튼 아직 숙소 코드 업데이트 기능 XXXXX 비번 필요 
	@RequestMapping("host_adelete.do")
	public void hostADelete(@RequestParam int no, @RequestParam int host, HttpServletResponse response) throws IOException {
		int check = this.dao.deleteAcc(no);
		
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			
			//삭제 시퀀스
			
			out.println("<script>");
			out.println("alert('숙소 삭제 성공!')");
			out.println("location.href='host_acc_list.do?no=" + host + "'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('숙소 삭제 실패!')");
			out.println("history.back()");
			out.println("</script>");
		}
		
	}
	
}
