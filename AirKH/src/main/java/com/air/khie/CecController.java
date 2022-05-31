package com.air.khie;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CecController {

	@RequestMapping("cec.do")
	public String main() {
		return "cec/main";
	}
	
	
}
