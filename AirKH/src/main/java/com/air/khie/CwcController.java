package com.air.khie;


import java.io.IOException;


import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
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
import com.air.cwc.WishCategoryDTO;
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
	
	// (�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝占� �뜝�떙�궪�삕�뜝�룞�삕 �뜝�뙏�뼲�삕�뜝�룞�삕)
	@RequestMapping("wish.content.do")
	public String Clist(@RequestParam("wish_category") String wish_category, Model model,HttpServletRequest req) {
		HttpSession session = req.getSession();
		String member_id;
		if((String) session.getAttribute("member_id")!=null) {
			member_id = (String) session.getAttribute("member_id");
		}else {
			return "cec/login";
		}
		WishDTO dto= new WishDTO();
		dto.setWish_category(wish_category);
		dto.setMember_id(member_id);
		List<WishDTO> list = this.dao1.getWishList(dto);
		model.addAttribute("wishList", list);
		model.addAttribute("cate", wish_category);
		return "cwc/wishcontent";
	}

	@RequestMapping("wish_list.do")
	public String wishlist(Model model,HttpServletRequest req) {
		HttpSession session = req.getSession();
		String member_id;
		if((String) session.getAttribute("member_id")!=null) {
			member_id=(String) session.getAttribute("member_id");
		}else {
			return "cec/login";
		}
		List<WishDTO> list = this.dao1.getcateList(member_id);
		model.addAttribute("cateList", list);
		return "cwc/wishlist";
	}

	@RequestMapping("wish_add.do")
	public void add(@RequestParam("wish_category") String wish_category, @RequestParam("acc_code") int acc_code, HttpServletResponse res,HttpServletRequest req) throws IOException {
		HttpSession session= req.getSession();
		String member_id=(String) session.getAttribute("member_id");
		WishDTO wish=new WishDTO();
		wish.setWish_category(wish_category);
		wish.setMember_id(member_id);
		
		AccDTO dto= this.dao2.getAccCont(acc_code);
		wish.setAcc_code(dto.getAcc_code());
		wish.setAcc_thumbnail(dto.getAcc_thumbnail());
		wish.setAcc_addr(dto.getAcc_addr());
		wish.setAcc_name(dto.getAcc_name());
		wish.setAcc_price(dto.getAcc_price());
		wish.setAcc_maxp(dto.getAcc_maxp());
		wish.setAcc_bedroom(dto.getAcc_bedroom());
		wish.setAcc_bed(dto.getAcc_bed());
		wish.setAcc_bath(dto.getAcc_bath());
		wish.setAcc_star(dto.getAcc_star());
		
		int check = this.dao1.addWish(wish);
		System.out.println("2@@@@@@@@@@@@@@@@@");
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();

		if (check > 0) {
			out.println("<script>");
			out.println("location.href = document.referrer");
			out.println("</script>");
		} else if(check==-1) {
			out.println("<script>");
			out.println("alert('failed to wish list !!')");
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
	//�뜝�룞�삕�뜝�룞�삕�뜝�떦源띿삕 �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕
	@RequestMapping("payment.do")
	public String payment(@RequestParam("acc_code") int acc_code, Model model,HttpServletRequest req) throws ParseException, IOException {
		//(DTO�뜝�룞�삕 �뜝�룞�삕�뜝�뜾�꽌 �뜝�뙣�븘�뼲�삕�뜝�룞�삕)
		HttpSession session = req.getSession();
		String member_id;
		if((String) session.getAttribute("member_id")!=null) {
			member_id=(String) session.getAttribute("member_id");
		}else {
			System.out.println("login gogo!");
			return "cec/login";
		}
		
		//筌ｋ똾寃� 占쎌뵥, 筌ｋ똾寃� 占쎈툡占쎌뜍
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
		
		String check_in=year1+"/"+mon1+"/"+day1;
		String check_out=year2+"/"+mon2+"/"+day2;
		long diffSec = (format2.getTime() - format1.getTime())/1000;
		long diffDays = diffSec / (24*60*60);
		int date= (int)(diffDays);
		
		if(date==0) {
			date=1;
		}
		
		//野껊슣�뮞占쎈뱜 占쎌뵥占쎌뜚
		String guest=req.getParameter("guest");
		
		AccDTO dto = this.dao2.getAccCont(acc_code);
		
		HostHotelDTO host= this.dao3.getHost(dto.getAcc_host());//占쎌깈占쎈뮞占쎈뱜 占쎌젟癰귨옙 揶쏉옙占쎌죬占쎌궎疫뀐옙
		MemberHotelDTO member=this.dao4.getMember(member_id); //筌롢끇苡� 占쎌젟癰귨옙 揶쏉옙占쎌죬占쎌궎疫뀐옙
		
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
			out.println("alert('please fill in the blanks!!')");
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
			System.out.println("login-gogo");
			return "cec/login";
		}
		int no= (Integer) session.getAttribute("acc_code");
		int hostNum = this.re_dao.reinsert_hostnum(no);
		String member_id = (String) session.getAttribute("member_id");
		String mpic= this.re_dao.reinsert_pic(member_id);
		
		List<PaymentDTO> list = this.dao3.getPayList(member_name);
		model.addAttribute("mem",member_name);
		model.addAttribute("mem_pic",mpic);
		model.addAttribute("host_num",hostNum);
		model.addAttribute("List", list);
		return "cwc/reservation_guest";
	}
	@RequestMapping("cart_delete.do")
	public void cart_del(@RequestParam("cart_num") int cart_num, HttpServletResponse res) throws IOException {
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();
		int check =this.dao3.del_cart(cart_num);
		
		if(check>0) {
			out.println("<script>");
			out.println("alert('reservation has been canceled!!')");
			out.println("location.href='reservation_guest.do?member_id=member_id'");
			out.println("</script>");
		}
	}
	
	@RequestMapping("cart_cancel.do")
	public void cart_cancle(@RequestParam("cart_num") int cart_num, HttpServletResponse res) throws IOException {
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();
		int check =this.dao3.del_cart(cart_num);
		
		if(check>0) {
			out.println("<script>");
			out.println("alert('canceled!!')");
			out.println("location.href='reservation_host.do'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('fail !!')");
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
		List<PaymentDTO> approve = this.dao3.getPayList_approve(host_name);
		List<PaymentDTO> play = this.dao3.getPayList_play(host_name);
		
		model.addAttribute("List", list);
		model.addAttribute("out", out);
		model.addAttribute("in", in);
		model.addAttribute("pre", pre);
		model.addAttribute("approve", approve);
		model.addAttribute("play", play);

		return "cwc/reservation_host";
	}	
	
	@RequestMapping("wish_category_add.do")
	public void add_cate(WishCategoryDTO dto,WishDTO dto2, HttpServletRequest req,HttpServletResponse res) throws IOException {
		int check=this.dao1.addCategory(dto);		
		int check2=this.dao1.addWish(dto2);
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();	
		if(check > 0 && check2>0 ) {
			out.println("<script>");
			out.println("alert('added wishlist')");
			out.println("location.href = document.referrer");
			out.println("</script>");
		}else { 
			out.println("<script>");
			out.println("history.back()");
			out.println("</script>");
		}
		
	}
	@RequestMapping("cart_approve.do")
	public void approve_cart(@RequestParam("cart_num") int cart_num,HttpServletResponse res) throws IOException {
		int check= this.dao3.approve_guest(cart_num);
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();	
		if(check>0) {
			out.println("<script>");
			out.println("alert('success!!')");
			out.println("location.href = document.referrer");
			out.println("</script>");
		}
		else { 
			out.println("<script>");
			out.println("alert('fail..')");
			out.println("history.back()");
			out.println("</script>");
		}
		
	}
}
