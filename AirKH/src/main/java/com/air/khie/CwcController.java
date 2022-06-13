package com.air.khie;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.air.cwc.WishDAO;
import com.air.cwc.WishDTO;
import com.air.cwc.testDAO;
import com.air.cwc.testDTO;

@Controller
public class CwcController {

	@Autowired
	private testDAO dao;

	@Autowired
	private WishDAO dao1;

	@RequestMapping("cwc.do")
	public String main() {
		return "cwc/main";
	}

	@RequestMapping("4.do")
	public String main4() {
		return "cwc/wishlist";
	}

	@RequestMapping("list.do")
	public String list(Model model) {
		List<testDTO> list = this.dao.getEmpList();
		model.addAttribute("List", list);
		return "cwc/wish";
	}

	// (찜 목록으로 검색을 해야함)
	@RequestMapping("wish.content.do")
	public String Clist(Model model) {
		List<WishDTO> list = this.dao1.getWishList();
		model.addAttribute("wishList", list);
		return "cwc/wishcontent";
	}

	@RequestMapping("wish_list.do")
	public String wishlist(Model model) {
		List<WishDTO> list = this.dao1.getWishList();
		model.addAttribute("wishList", list);
		return "cwc/wishlist";
	}

	@RequestMapping("wish_add.do")
	public void add(WishDTO dto, HttpServletResponse res) throws IOException {

		int check = this.dao1.addWish(dto);
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();

		if (check > 0) {
			out.println("<script>");
			out.println("location.href='wish_list.do'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("history.back()");
			out.println("</script>");
		}
	}

	@RequestMapping("wish_delete.do")
	public void delete(@RequestParam("acc_code") int acc_code, HttpServletResponse response) throws IOException {

		int check = this.dao1.deleteWish(acc_code);

		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out = response.getWriter();

		if (check > 0) {
			out.println("<script>");
			out.println("location.href='wish.content.do'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("history.back()");
			out.println("</script>");
		}

	}
	//결재하기 누르면
	@RequestMapping("payment.do")
	public String payment(@RequestParam("acc_code") int acc_code,Model model,HttpServletRequest req) {
		//(DTO에 맞춰서 받아야함)
		String day=req.getParameter("day");
		String guest=req.getParameter("guest");
		System.out.println(day);
		System.out.println(guest);
		
		testDTO dto = this.dao.getEmp(acc_code);
		model.addAttribute("pCont", dto);
		
		model.addAttribute("day", day);
		model.addAttribute("guest", guest);
		return "cwc/payment";
	}
}
