package com.air.khie;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.air.cwc.PaymentDAO;
import com.air.cwc.PaymentDTO;
import com.air.cwc.WishDAO;
import com.air.cwc.WishDTO;
import com.air.cwc.testDAO;
import com.air.cwc.testDTO;
import com.air.jdy.AccDAO;
import com.air.jdy.AccDTO;

@Controller
public class CwcController {

	@Autowired
	private testDAO dao;

	@Autowired
	private WishDAO dao1;

	@Autowired
	private AccDAO dao2;
	
	@Autowired 
	private PaymentDAO dao3;
	
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

	// (�� ������� �˻��� �ؾ���)
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
	public void add(@RequestParam("acc_code") int acc_code, HttpServletResponse res) throws IOException {

		AccDTO dto= this.dao2.getAccCont(acc_code);
		int check = this.dao1.addWish(dto);
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();

		if (check > 0) {
			out.println("<script>");
			out.println("location.href='wish.content.do'");
			out.println("</script>");
		} else if(check==-1) {
			out.println("<script>");
			out.println("alert('위시리스트에 이미 추가 되었습니다.')");
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
			out.println("location.href = document.referrer");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("history.back()");
			out.println("</script>");
		}

	}
	//�����ϱ� ������
	@RequestMapping("payment.do")
	public String payment(@RequestParam("acc_code") int acc_code, Model model,HttpServletRequest req) throws ParseException {
		//(DTO�� ���缭 �޾ƾ���)
		String day=req.getParameter("day");

		String mon1=day.substring(5,7);
		String day1=day.substring(8,10);
		String mon2=day.substring(18,20);
		String day2=day.substring(21,23);
		String date1=mon1+"/"+day1;
		String date2=mon2+"/"+day2;
		
		Date format1=new SimpleDateFormat("MM/dd").parse(date1);
		Date format2=new SimpleDateFormat("MM/dd").parse(date2);
		long diffSec = (format2.getTime() - format1.getTime())/1000;
		long diffDays = diffSec / (24*60*60);
		int date= (int)(diffDays+1);
		String guest=req.getParameter("guest");
		
		testDTO dto = this.dao.getEmp(acc_code);
		int price= date*dto.getAcc_price();
		model.addAttribute("pCont", dto);
		model.addAttribute("price",price);
		model.addAttribute("day", day);
		model.addAttribute("date",date);
		model.addAttribute("date1",date1);
		model.addAttribute("date2",date2);
		model.addAttribute("guest", guest);
		return "cwc/payment";
	}
	@RequestMapping("add_pay.do")
	public void add_pay(@RequestParam("acc_code") int acc_code,PaymentDTO dto, HttpServletResponse res) throws IOException {
	
		int check =this.dao3.insertPay(dto);
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();

		if (check > 0) {
			out.println("<script>");
			out.println("location.href='pay_Ok.do'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('error.')");
			out.println("history.back()");
			out.println("</script>");
		}
	}
	@RequestMapping("pay_Ok.do")
	public String paycheck() {
		return "cwc/payment_Ok";
	}

	@RequestMapping("reservation_guest.do")
	public String payList(Model model) {
		List<PaymentDTO> list = this.dao3.getPayList();
		model.addAttribute("List", list);
		return "cwc/reservation_guest";
	}
}
