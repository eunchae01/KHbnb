package com.air.khie;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.air.kyk.AvgDTO;
import com.air.kyk.ReviewDAOm;
import com.air.kyk.ReviewDTOm;

@Controller
public class KykController {

	@Autowired
	private ReviewDAOm re_dao;
	
	
	@RequestMapping("kyk.do")
	public String main() {
		
		
		return "kyk/main";
	}
	
	@RequestMapping("review.do")
	public String review_cont(@RequestParam("acc_code") int acc_code,
	Model model) {
		
		
		
		List<ReviewDTOm> re_dto = this.re_dao.reviewCont(acc_code);
		int count = this.re_dao.getReivewListCount(acc_code);
		AvgDTO re_avg = this.re_dao.avgCont(acc_code);
		
		model.addAttribute("re_avg",re_avg);
		model.addAttribute("review_list", re_dto);
		model.addAttribute("count", count);
		
		return "kyk/review";
	}
} 
