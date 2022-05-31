package com.air.khie;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class KykController {

	@RequestMapping("kyk.do")
	public String main() {
		return "kyk/main";
	}
}
