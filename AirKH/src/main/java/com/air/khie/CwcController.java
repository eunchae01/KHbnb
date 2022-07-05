package com.air.khie;


import java.io.IOException;

import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.air.cec.HostHotelDTO;
import com.air.cec.MemberHotelDTO;
import com.air.cec.UserHotelDAO;
import com.air.cwc.PaymentDAO;
import com.air.cwc.PaymentDTO;
import com.air.cwc.WishDAO;
import com.air.cwc.WishDTO;
import com.air.jdy.AccDAO;
import com.air.jdy.AccDTO;
import com.air.jdy.ThemeDTO;
import com.air.kyk.ReviewDAOm;

@Controller
public class CwcController {

	@Autowired
	private WishDAO dao1;

	@Autowired
	private AccDAO dao2;
	
	@Autowired 
	private PaymentDAO dao3;
	
	@Autowired
	private UserHotelDAO dao4;
	
	@Autowired
	private ReviewDAOm re_dao;

	// (�� ������� �˻��� �ؾ���)
	@RequestMapping("wish.content.do")
	public String Clist(Model model,HttpServletRequest req) {
		HttpSession session = req.getSession();
		String member_name;
		if((String) session.getAttribute("member_id")!=null) {
			member_name = (String) session.getAttribute("member_name");
		}else {
			System.out.println("로그인 먼저 진행하십셔");
			return "cec/login";
		}
		
		List<WishDTO> list = this.dao1.getWishList(member_name);
		model.addAttribute("wishList", list);
		return "cwc/wishcontent";
	}

	@RequestMapping("wish_list.do")
	public String wishlist(Model model,HttpServletRequest req) {
		HttpSession session = req.getSession();
		String member_id;
		if((String) session.getAttribute("member_id")!=null) {
			member_id=(String) session.getAttribute("member_id");
		}else {
			System.out.println("로그인 먼저 진행하십셔");
			return "cec/login";
		}
		List<WishDTO> list = this.dao1.getWishList(member_id);
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
	public String payment(@RequestParam("acc_code") int acc_code, Model model,HttpServletRequest req) throws ParseException, IOException {
		//(DTO�� ���缭 �޾ƾ���)
		HttpSession session = req.getSession();
		String member_id;
		if((String) session.getAttribute("member_id")!=null) {
			member_id=(String) session.getAttribute("member_id");
		}else {
			System.out.println("로그인 먼저 진행하십셔");
			return "cec/login";
		}
		
		//체크 인, 체크 아웃
		String day=req.getParameter("day");
		String mon1=day.substring(5,7);
		String day1=day.substring(8,10);
		String mon2=day.substring(18,20);
		String day2=day.substring(21,23);
		String date1=mon1+"/"+day1;
		String date2=mon2+"/"+day2;
		String year1=day.substring(0,4);;
		String year2=day.substring(13,17);
		Date format1=new SimpleDateFormat("MM/dd").parse(date1);
		Date format2=new SimpleDateFormat("MM/dd").parse(date2);
		
		String check_in=year1+"년 "+mon1+"월 "+day1+"일";
		String check_out=year2+"년 "+mon2+"월 "+day2+"일";
		long diffSec = (format2.getTime() - format1.getTime())/1000;
		long diffDays = diffSec / (24*60*60);
		int date= (int)(diffDays);
		
		if(date==0) {
			date=1;
		}
		
		//게스트 인원
		String guest=req.getParameter("guest");
		
		
		AccDTO dto = this.dao2.getAccCont(acc_code);
		
		HostHotelDTO host= this.dao3.getHost(dto.getAcc_host());//호스트 정보 가져오기
		MemberHotelDTO member=this.dao4.getMember(member_id); //멤버 정보 가져오기
		
		int price= date*dto.getAcc_price();
		int commission = (int)(price*0.1);
		int total_price=price+commission;
		int coupon=(int) (total_price*0.7);
		int cprice=total_price-coupon;
		int maxp=dto.getAcc_maxp();
		model.addAttribute("member",member);
		model.addAttribute("host",host);
		model.addAttribute("maxp", maxp);
		model.addAttribute("pCont", dto);
		model.addAttribute("price",price);
		model.addAttribute("cprice",cprice);
		model.addAttribute("commission",commission);
		model.addAttribute("total_price",total_price);
		model.addAttribute("coupon",coupon);
		model.addAttribute("day", day);
		model.addAttribute("date",date);
		model.addAttribute("check_in",check_in);
		model.addAttribute("check_out",check_out);
		model.addAttribute("date1",date1);
		model.addAttribute("date2",date2);
		model.addAttribute("guest", guest);
		return "cwc/payment";
	}
	@RequestMapping("add_pay.do")
	public void add_pay(@RequestParam("acc_code") int acc_code,PaymentDTO dto, HttpServletResponse res,HttpServletRequest req,HttpSession session) throws IOException {
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();
		session.setAttribute("acc_code", acc_code);
		if(dto.getCard_num()==""||dto.getExprie()==""||dto.getCvv()==""||dto.getZip_code() ==""||dto.getCountry() =="") {
			out.println("<script>");
			out.println("alert('결재 수단에 누락이 존재합니다..')");
			out.println("history.back()");
			out.println("</script>");
		}else {

			int check =this.dao3.insertPay(dto);
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
	}
	@RequestMapping("pay_Ok.do")
	public String paycheck() {
		return "cwc/payment_Ok";
	}

	@RequestMapping("reservation_guest.do")
	public String payList(PaymentDTO dto, Model model, HttpServletRequest req) {
		HttpSession session = req.getSession();
		String member_name=null;
		if((String) session.getAttribute("member_id")!=null) {
			member_name = (String) session.getAttribute("member_name");
		}else {
			System.out.println("로그인 먼저 진행하십셔");
			return "cec/login";
		}
		int no= (Integer) session.getAttribute("acc_code");
		int hostNum = this.re_dao.reinsert_hostnum(no);
		String member_id = (String) session.getAttribute("member_id");
		String mpic= this.re_dao.reinsert_pic(member_id);
		
		
		
		List<PaymentDTO> list = this.dao3.getPayList(member_name);
		model.addAttribute("List", list);
		model.addAttribute("mem",member_name);
		model.addAttribute("mem_pic",mpic);
		model.addAttribute("host_num",hostNum);
		return "cwc/reservation_guest";
	}
	@RequestMapping("cart_delete.do")
	public void cart_del(@RequestParam("cart_num") int cart_num, HttpServletResponse res) throws IOException {
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();
		int check =this.dao3.del_cart(cart_num);
		
		if(check>0) {
			out.println("<script>");
			out.println("alert('예약이 취소 되었습니다...')");
			out.println("location.href='reservation_guest.do?member_id=member_id'");
			out.println("</script>");
		}
	}
	
	@RequestMapping("cart_update.do")
	public String cart_update(@RequestParam("cart_num") int cart_num, Model model) {
		PaymentDTO dto = this.dao3.cartCont(cart_num);
		model.addAttribute("dto", dto);
		return "cwc/payment_update";
	}
	
	@RequestMapping("cart_update_ok.do")
	public void update_cart(PaymentDTO dto, HttpServletResponse res) throws IOException {
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();	
		int check = this.dao3.update_cart(dto);
		if(check > 0) {
			out.println("<script>");
			out.println("alert('예약 수정 성공!!!')");
			out.println("location.href='reservation_guest.do?member_id=member_id'");
			out.println("</script>");
		}else { 
			out.println("<script>");
			out.println("history.back()");
			out.println("</script>");
		}
	}
	
	@RequestMapping("reservation_host.do")
	public String host_res(PaymentDTO dto, Model model, HttpServletRequest req) {
		HttpSession session = req.getSession();
		String host_name=(String) session.getAttribute("host_name");
		System.out.println(host_name);
		List<PaymentDTO> list = this.dao3.getPayList_H(host_name);
		List<PaymentDTO> out = this.dao3.getPayList_out(host_name);
		List<PaymentDTO> in = this.dao3.getPayList_in(host_name);
		List<PaymentDTO> pre = this.dao3.getPayList_pre(host_name);
		List<PaymentDTO> update = this.dao3.getPayList_update(host_name);
		List<PaymentDTO> approve = this.dao3.getPayList_approve(host_name);
		model.addAttribute("List", list);
		model.addAttribute("out", out);
		model.addAttribute("in", in);
		model.addAttribute("pre", pre);
		model.addAttribute("update", update);
		model.addAttribute("approve", approve);
		return "cwc/reservation_host";
	}
		
	
}
