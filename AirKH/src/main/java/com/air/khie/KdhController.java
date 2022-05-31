package com.air.khie;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class KdhController {

	@RequestMapping("kdh.do")
	public String main() {
		return "kdh/main";
	}
}
