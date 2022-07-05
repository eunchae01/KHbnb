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
import com.air.cec.UserHotelDAO;
import com.air.cwc.WishDTO;
import com.air.jdy.AccDAO;
import com.air.jdy.AccDTO;
import com.air.jdy.OfferDTO;
import com.air.jdy.ThemeDTO;
import com.air.kyk.AvgDTO;
import com.air.kyk.ReviewDAOm;
import com.air.kyk.ReviewDTOm;

@Controller
public class JdyController {

	@Autowired
	private AccDAO dao;
	@Autowired
	private ReviewDAOm re_dao;
	@Autowired
	private UserHotelDAO userDao;
	
	// user 愿  젴 (寃뚯뒪 듃,  샇 뒪 듃)
	
	// 寃뚯뒪 듃
	// 硫붿씤 럹 씠吏 
	@RequestMapping("jdy.do")
	public String list(Model model) {

		List<AccDTO> list = this.dao.getAccList();
		List<ThemeDTO> tlist = this.dao.getThemeList();

		model.addAttribute("List", list);
		model.addAttribute("tList", tlist);

		return "jdy/main";
	}
	
	//  궗 슜 옄  닕 냼  긽 꽭  럹 씠吏 
	@RequestMapping("acc_content.do")


	public String content(@RequestParam int no, @RequestParam int hostno, Model model, HttpSession session) {
		
		// 호스트 정보 받아오기
        HostHotelDTO hostDto = this.userDao.getHostByNum(hostno);
		AccDTO dto = this.dao.getAccCont(no);
		List<OfferDTO> olist = this.dao.getOfferList();
		WishDTO like=this.dao.likeAcc(no);
		
		
		String member_id = (String)session.getAttribute("member_id");
		
		
		
		List<ReviewDTOm> re_dto = this.re_dao.reviewCont(no);
	    int count = this.re_dao.getReivewListCount(no);
	    AvgDTO re_avg = this.re_dao.avgCont(no);
	    int reinsert_hostnum = this.re_dao.reinsert_hostnum(no);
	    
	    if(count > 0) {
	    	double avg = this.re_dao.avgSelect(no);
	    	
	    	model.addAttribute("re_avg", avg);
	    }
	    
	    
	    
		String offer_str = dto.getAcc_offer();
		String[] offer_arr = offer_str.split(",");
		int[] int_arr = new int[offer_arr.length];

		for (int i = 0; i < offer_arr.length; i++) {
			int_arr[i] = Integer.parseInt(offer_arr[i]);
		}
		
		
		model.addAttribute("id_check", member_id);
		model.addAttribute("in_host",reinsert_hostnum);
		model.addAttribute("re_avg",re_avg);
	    model.addAttribute("review_list", re_dto);
	    model.addAttribute("count", count);
	    

	    model.addAttribute("Host", hostDto);
		model.addAttribute("Cont", dto);
		model.addAttribute("oList", olist);
		model.addAttribute("offer", int_arr);
		model.addAttribute("like",like);

		return "jdy/acc_cont";
	}

	//  궗 슜 옄 nav-bar  뀒留  寃  깋
	@RequestMapping("search_theme.do")
	public String searchT(@RequestParam int no, Model model) {

		List<AccDTO> list = this.dao.searchByThemeAcc(no);
		List<ThemeDTO> tlist = this.dao.getThemeList();
		
		model.addAttribute("List", list);
		model.addAttribute("tList", tlist);

		return "jdy/acc_search_result";
	}

	//  궗 슜 옄 :  닕 냼 寃  깋
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
				out.println("alert('寃  깋 寃곌낵媛   뾾 뒿 땲 떎.')");
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
	//  샇 뒪 듃

	//  샇 뒪 듃 硫붿씤 럹 씠吏 
	@RequestMapping("host_main.do")
	public String hostMain(Model model, HttpSession session) {

		List<AccDTO> list = this.dao.getAccListForHost(Integer.parseInt(session.getAttribute("host_num").toString()));
		model.addAttribute("List", list);
		
		int host_num = (Integer) session.getAttribute("host_num");
		
		HostHotelDTO host = this.userDao.getHostByNum(host_num);
		model.addAttribute("Host", host);
		
		List<ReviewDTOm> host_list = this.re_dao.hostReviewCont(host_num);
		model.addAttribute("host_list",host_list);
		
		return "jdy/host_main";
	}

	//  샇 뒪 듃 湲곕뒫 :  닕 냼  벑濡   럹 씠吏 
	@RequestMapping("acc_insert.do")
	public String insert(@RequestParam int no, Model model) {

		List<ThemeDTO> tlist = this.dao.getThemeList();
		model.addAttribute("tList", tlist);

		return "jdy/acc_insert";
	}

	//  샇 뒪 듃 湲곕뒫 :  닕 냼  벑濡 
	@RequestMapping("acc_insert_ok.do")
	public String insertOk(AccDTO dto, HttpServletResponse response, MultipartHttpServletRequest mRequest)
			throws IOException {

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		// 파일 업로드 후 파일 문자열 받아오기 
		String fileName = this.dao.uploadFile(mRequest);
		
		// , 기준으로 잘라서 dto에 넣기
		String[] fileArr = fileName.split(",");

		dto.setAcc_thumbnail(fileArr[0]);
		dto.setAcc_image1(fileArr[1]);
		dto.setAcc_image2(fileArr[2]);
		dto.setAcc_image3(fileArr[3]);
		dto.setAcc_image4(fileArr[4]);

		int check = this.dao.insertAcc(dto);

		if (check > 0) {
			return "jdy/acc_insert_ok";
		} else {
			out.println("<script>");
			out.println("alert('숙소 등록 실패')");
			out.println("history.back()");
			out.println("</script>");
			return null;
		}
	}

	//  샇 뒪 듃:  닕 냼  긽 꽭  럹 씠吏 
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

	//  샇 뒪 듃:  닕 냼  닔 젙 踰꾪듉  겢由  ->  닔 젙  럹 씠吏 濡   씠 룞
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

	// 호스트: 숙소 수정
	@RequestMapping("acc_modify_ok.do")
	public void hostAModifyOk(AccDTO dto, HttpServletResponse response, MultipartHttpServletRequest mRequest) throws IOException {

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		// 파일 업로드 후 파일 문자열 받아오기 
		String fileName = this.dao.uploadFile(mRequest);
		System.out.println("fileName" + fileName);
		
		
		if(fileName == null) {
			dto.setAcc_thumbnail(dto.getAcc_thumbnail());
			dto.setAcc_image1(dto.getAcc_image1());
			dto.setAcc_image2(dto.getAcc_image2());
			dto.setAcc_image3(dto.getAcc_image3());
			dto.setAcc_image4(dto.getAcc_image4());
		}else {
			// , 기준으로 잘라서 dto에 넣기
			String[] fileArr = fileName.split(",");
			
			dto.setAcc_thumbnail(fileArr[0]);
			dto.setAcc_image1(fileArr[1]);
			dto.setAcc_image2(fileArr[2]);
			dto.setAcc_image3(fileArr[3]);
			dto.setAcc_image4(fileArr[4]);
			
			// 수정일 업데이트
			this.dao.updateAccDate(dto.getAcc_code());
		}
		
		int check = this.dao.updateAcc(dto);

		if (check > 0) {
			out.println("<script>");
			out.println("alert('숙소가 수정되었습니다!')");
			out.println("location.href='host_acc_cont.do?no=" + dto.getAcc_code() + "'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('숙소 수정 실패!')");
			out.println("history.back()");
			out.println("</script>");
		}

	}

	// 호스트: 숙소 삭제 기능
	@RequestMapping("host_adelete.do")
	public void hostADelete(@RequestParam int no, 
			@RequestParam int num, HttpServletResponse response)throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		int check = this.dao.deleteAcc(no);
		
		if (check > 0) {
			out.println("<script>");
			out.println("alert('숙소가 삭제되었습니다!')");
			out.println("location.href='host_main.do?no=" + num + "'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('숙소 삭제 실패!')");
			out.println("history.back()");
			out.println("</script>");
		}

	}

}
