package com.air.khie;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class JdyController {

	@RequestMapping("jdy.do")
	public String main() {
		return "jdy/main";
	}
}
