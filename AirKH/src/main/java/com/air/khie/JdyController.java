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
import com.air.cec.MemberHotelDTO;
import com.air.cec.UserHotelDAO;
import com.air.cwc.WishDTO;
import com.air.jdy.AccDAO;
import com.air.jdy.AccDTO;
import com.air.jdy.OfferDTO;
import com.air.jdy.ThemeDTO;

@Controller
public class JdyController {

	@Autowired
	private AccDAO dao;
	
	@Autowired
	private UserHotelDAO userDao;
	
	// user �울옙占쎌�� (野����わ옙��, 占쎌��占쎈�わ옙��)
	
	// 野����わ옙��
	// 筌�遺우�ㅿ옙�뱄옙��筌�占�
	@RequestMapping("jdy.do")
	public String list(Model model) {
		
		
		List<AccDTO> list = this.dao.getAccList();
		List<ThemeDTO> tlist = this.dao.getThemeList();
		
		
		
		model.addAttribute("List", list);
		model.addAttribute("tList", tlist);

		return "jdy/main";
	}
	
	// 占쎄�占쎌��占쎌�� 占쎈��占쎈�� 占쎄맒占쎄쉭 占쎈�뱄옙��筌�占�
	@RequestMapping("acc_content.do")
	public String content(@RequestParam int no, @RequestParam int hostno, Model model, HttpServletRequest request) {
		
		// 호스트 정보 받아오기
		HostHotelDTO hostDto = this.userDao.getHostByNum(hostno);
		model.addAttribute("Host", hostDto);

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

	// 占쎄�占쎌��占쎌�� nav-bar 占쎈��筌�占� 野�占쏙옙源�
	@RequestMapping("search_theme.do")
	public String searchT(@RequestParam int no, Model model) {

		List<AccDTO> list = this.dao.searchByThemeAcc(no);
		List<ThemeDTO> tlist = this.dao.getThemeList();
		
		model.addAttribute("List", list);
		model.addAttribute("tList", tlist);

		return "jdy/acc_search_result";
	}

	// 占쎄�占쎌��占쎌�� : 占쎈��占쎈�� 野�占쏙옙源�
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
				out.println("alert('野�占쏙옙源� 野�怨��드�占� 占쎈씨占쎈�울옙�뀐옙��.')");
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
	// 占쎌��占쎈�わ옙��

	// 占쎌��占쎈�わ옙�� 筌�遺우�ㅿ옙�뱄옙��筌�占�
	@RequestMapping("host_main.do")
	public String hostMain(Model model, HttpSession session) {

		List<AccDTO> list = this.dao.getAccListForHost(Integer.parseInt(session.getAttribute("host_num").toString()));
		model.addAttribute("List", list);

		return "jdy/host_main";
	}

	// 占쎌��占쎈�わ옙�� 疫꿸��� : 占쎈��占쎈�� 占쎈�嚥∽옙 占쎈�뱄옙��筌�占�
	@RequestMapping("acc_insert.do")
	public String insert(@RequestParam int no, Model model) {

		List<ThemeDTO> tlist = this.dao.getThemeList();
		model.addAttribute("tList", tlist);

		return "jdy/acc_insert";
	}

	// 占쎌��占쎈�わ옙�� 疫꿸��� : 占쎈��占쎈�� 占쎈�嚥∽옙
	@RequestMapping("acc_insert_ok.do")
	public String insertOk(AccDTO dto, HttpServletResponse response, MultipartHttpServletRequest mRequest)
			throws IOException {

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		String fileName = this.dao.uploadFile(mRequest);

		// 占쎄�筌�占� 占쎈�嚥∽옙
		if (fileName != null) {
			out.println("<script>");
			out.println("alert('占쎄�筌�占� 占쎈�嚥∽옙 占쎄쉐�⑨옙!')");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('占쎄�筌�占� 占쎈�嚥∽옙 占쎈��占쎈��!')");
			out.println("</script>");
		}

		dto.setAcc_thumbnail(fileName);

		int check = this.dao.insertAcc(dto);

		if (check > 0) {
			return "jdy/acc_insert_ok";
		} else {
			out.println("<script>");
			out.println("alert('占쎈��占쎈�� 占쎈�嚥∽옙 占쎈��占쎈��!')");
			out.println("history.back()");
			out.println("</script>");
			return null;
		}
	}

	// 占쎌��占쎈�わ옙��: 占쎈��占쎈�� 占쎄맒占쎄쉭 占쎈�뱄옙��筌�占�
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

	// 占쎌��占쎈�わ옙��: 占쎈��占쎈�� 占쎈��占쎌�� 甕곌쑵�� 占쎄깻�깍옙 -> 占쎈��占쎌�� 占쎈�뱄옙��筌�占썸에占� 占쎌��占쎈�
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

	// 占쎌��占쎈�わ옙��: 占쎈��占쎌�� 占쎈�뱄옙��筌�占쏙옙肉�占쎄� 占쎈��占쎌��占쎈릭疫뀐옙 ��袁⑥쓰 占쎈�占쎄�占쎌��!!!!!��袁⑥쓰占쎌��占쎌��!!!!
	@RequestMapping("acc_modify_ok.do")
	public void hostAModifyOk(AccDTO dto, HttpServletResponse response) throws IOException {

		int check = this.dao.updateAcc(dto);

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		if (check > 0) {
			out.println("<script>");
			out.println("alert('占쎈��占쎈�� 占쎈��占쎌�� 占쎄쉐�⑨옙!')");
			out.println("location.href='host_acc_cont.do?no=" + dto.getAcc_code() + "'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('占쎈��占쎈�� 占쎈��占쎌�� 占쎈��占쎈��!')");
			out.println("history.back()");
			out.println("</script>");
		}

	}

	// 占쎌��占쎈�わ옙��: 占쎈��占쎈�� 占쎄맒占쎄쉭 占쎈�뱄옙��筌�占쏙옙�� 占쎄�占쎌�� 甕곌쑵�� 占쎈�筌�占� 占쎈��占쎈�� ��遺얜굡 占쎈씜占쎈�뀐옙��占쎈�� 疫꿸��� XXXXX ��袁⑥쓰 占쎈�占쎌��
	@RequestMapping("host_adelete.do")
	public void hostADelete(@RequestParam int no, 
			@RequestParam int num, HttpServletResponse response)throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		int check = this.dao.deleteAcc(no);
		
		if (check > 0) {
			out.println("<script>");
			out.println("alert('占쎈��占쎈�� 占쎄�占쎌�� 占쎄쉐�⑨옙!')");
			out.println("location.href='host_main.do?no=" + num + "'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('占쎈��占쎈�� 占쎄�占쎌�� 占쎈��占쎈��!')");
			out.println("history.back()");
			out.println("</script>");
		}

	}

}
