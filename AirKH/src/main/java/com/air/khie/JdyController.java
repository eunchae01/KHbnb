package com.air.khie;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.air.cec.HostHotelDTO;
import com.air.cwc.WishDTO;
import com.air.jdy.AccDAO;
import com.air.jdy.AccDTO;
import com.air.jdy.OfferDTO;
import com.air.jdy.ThemeDTO;

@Controller
public class JdyController {

	@Autowired
	private AccDAO dao;
	
	// user 愿��젴 (寃뚯뒪�듃, �샇�뒪�듃)
	
	// 寃뚯뒪�듃
	// 硫붿씤�럹�씠吏�
	@RequestMapping("jdy.do")
	public String list(Model model) {

		List<AccDTO> list = this.dao.getAccList();
		List<ThemeDTO> tlist = this.dao.getThemeList();

		model.addAttribute("List", list);
		model.addAttribute("tList", tlist);

		return "jdy/main";
	}
	
	// �궗�슜�옄 �닕�냼 �긽�꽭 �럹�씠吏�
	@RequestMapping("acc_content.do")
	public String content(@RequestParam int no, Model model) {

		AccDTO dto = this.dao.getAccCont(no);
		List<OfferDTO> olist = this.dao.getOfferList();
		WishDTO like=this.dao.likeAcc(no);

		String offer_str = dto.getAcc_offer();
		String[] offer_arr = offer_str.split(",");
		int[] int_arr = new int[offer_arr.length];

		for (int i = 0; i < offer_arr.length; i++) {
			int_arr[i] = Integer.parseInt(offer_arr[i]);
		}

		model.addAttribute("Cont", dto);
		model.addAttribute("oList", olist);
		model.addAttribute("offer", int_arr);
		model.addAttribute("like",like);

		return "jdy/acc_cont";
	}

	// �궗�슜�옄 nav-bar �뀒留� 寃��깋
	@RequestMapping("search_theme.do")
	public String searchT(@RequestParam int no, Model model) {

		List<AccDTO> list = this.dao.searchByThemeAcc(no);
		List<ThemeDTO> tlist = this.dao.getThemeList();
		
		model.addAttribute("List", list);
		model.addAttribute("tList", tlist);

		return "jdy/acc_search_result";
	}

	// �궗�슜�옄 : �닕�냼 寃��깋
	@RequestMapping("acc_search.do")
	public String searchAcc(@RequestParam("where") String where, 
			@RequestParam("howMany") String howMany, Model model,
			HttpServletResponse response) throws IOException {

		Map<String,Object> map = new HashMap<String,Object>();
		String id = null;
		PrintWriter out = response.getWriter();
		response.setContentType("text/html; charset=UTF-8");
		
		if(where.isEmpty() && howMany.isEmpty()) {
			out.println("<script>");
			out.println("location.href='jdy.do'");
			out.println("</script>");
			return null;
		}else {
			if(where != null && howMany.isEmpty()) {
				id = "where";
				map.put("where", where);
			}else if(where.isEmpty() && howMany != null) {
				id = "howMany";
				map.put("howMany", Integer.parseInt(howMany));
			}else if(where != null && howMany != null) {
				id = "both";
				map.put("where", where);
				map.put("howMany", Integer.parseInt(howMany));
			}
			
			List<AccDTO> list = this.dao.searchAcc(map, id);
			List<ThemeDTO> tlist = this.dao.getThemeList();
			
			if(list.isEmpty()) {
				out.println("<script>");
				out.println("alert('寃��깋 寃곌낵媛� �뾾�뒿�땲�떎.')");
				out.println("location.href='jdy.do'");
				out.println("</script>");
				return null;
			}
			
			model.addAttribute("List", list);
			model.addAttribute("tList", tlist);
			return "jdy/acc_search_result";
		}
		
	}
	
	// =============================================================
	// �샇�뒪�듃

	// �샇�뒪�듃 硫붿씤�럹�씠吏�
	@RequestMapping("host_main.do")
	public String hostMain(Model model, HttpSession session) {

		List<AccDTO> list = this.dao.getAccListForHost(Integer.parseInt(session.getAttribute("host_num").toString()));
		model.addAttribute("List", list);

		return "jdy/host_main";
	}

	// �샇�뒪�듃 湲곕뒫 : �닕�냼 �벑濡� �럹�씠吏�
	@RequestMapping("acc_insert.do")
	public String insert(@RequestParam int no, Model model) {

		List<ThemeDTO> tlist = this.dao.getThemeList();
		model.addAttribute("tList", tlist);

		return "jdy/acc_insert";
	}

	// �샇�뒪�듃 湲곕뒫 : �닕�냼 �벑濡�
	@RequestMapping("acc_insert_ok.do")
	public String insertOk(AccDTO dto, HttpServletResponse response, MultipartHttpServletRequest mRequest)
			throws IOException {

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		String fileName = this.dao.uploadFile(mRequest);

		// �궗吏� �벑濡�
		if (fileName != null) {
			out.println("<script>");
			out.println("alert('�궗吏� �벑濡� �꽦怨�!')");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('�궗吏� �벑濡� �떎�뙣!')");
			out.println("</script>");
		}

		dto.setAcc_thumbnail(fileName);

		int check = this.dao.insertAcc(dto);

		if (check > 0) {
			return "jdy/acc_insert_ok";
		} else {
			out.println("<script>");
			out.println("alert('�닕�냼 �벑濡� �떎�뙣!')");
			out.println("history.back()");
			out.println("</script>");
			return null;
		}
	}

	// �샇�뒪�듃: �닕�냼 �긽�꽭 �럹�씠吏�
	@RequestMapping("host_acc_cont.do")
	public String hostACont(@RequestParam int no, Model model) {

		AccDTO dto = this.dao.getAccCont(no);
		List<OfferDTO> olist = this.dao.getOfferList();

		String offer_str = dto.getAcc_offer();
		String[] offer_arr = offer_str.split(",");
		int[] int_arr = new int[offer_arr.length];

		for (int i = 0; i < offer_arr.length; i++) {
			int_arr[i] = Integer.parseInt(offer_arr[i]);
		}

		model.addAttribute("Cont", dto);
		model.addAttribute("oList", olist);
		model.addAttribute("offer", int_arr);

		return "jdy/host_acc_cont";
	}

	// �샇�뒪�듃: �닕�냼 �닔�젙 踰꾪듉 �겢由� -> �닔�젙 �럹�씠吏�濡� �씠�룞
	@RequestMapping("host_acc_modify.do")
	public String hostAModify(@RequestParam int no, Model model) {

		AccDTO dto = this.dao.getAccCont(no);
		List<OfferDTO> olist = this.dao.getOfferList();
		List<ThemeDTO> tlist = this.dao.getThemeList();

		String offer_str = dto.getAcc_offer();
		String[] offer_arr = offer_str.split(",");
		int[] int_arr = new int[offer_arr.length];

		for (int i = 0; i < offer_arr.length; i++) {
			int_arr[i] = Integer.parseInt(offer_arr[i]);
		}

		model.addAttribute("Cont", dto);
		model.addAttribute("oList", olist);
		model.addAttribute("offer", int_arr);
		model.addAttribute("tList", tlist);

		return "jdy/host_acc_modify";
	}

	// �샇�뒪�듃: �닔�젙 �럹�씠吏��뿉�꽌 �닔�젙�븯湲� 鍮꾨쾲 �븞�꽔�쓬!!!!!鍮꾨쾲�솗�씤!!!!
	@RequestMapping("acc_modify_ok.do")
	public void hostAModifyOk(AccDTO dto, HttpServletResponse response) throws IOException {

		int check = this.dao.updateAcc(dto);

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		if (check > 0) {
			out.println("<script>");
			out.println("alert('�닕�냼 �닔�젙 �꽦怨�!')");
			out.println("location.href='host_acc_cont.do?no=" + dto.getAcc_code() + "'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('�닕�냼 �닔�젙 �떎�뙣!')");
			out.println("history.back()");
			out.println("</script>");
		}

	}

	// �샇�뒪�듃: �닕�냼 �긽�꽭 �럹�씠吏��쓽 �궘�젣 踰꾪듉 �븘吏� �닕�냼 肄붾뱶 �뾽�뜲�씠�듃 湲곕뒫 XXXXX 鍮꾨쾲 �븘�슂
	@RequestMapping("host_adelete.do")
	public void hostADelete(@RequestParam int no, 
			@RequestParam int num, HttpServletResponse response)throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		int check = this.dao.deleteAcc(no);
		
		if (check > 0) {
			out.println("<script>");
			out.println("alert('�닕�냼 �궘�젣 �꽦怨�!')");
			out.println("location.href='host_main.do?no=" + num + "'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('�닕�냼 �궘�젣 �떎�뙣!')");
			out.println("history.back()");
			out.println("</script>");
		}

	}

}
