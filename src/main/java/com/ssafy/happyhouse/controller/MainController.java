package com.ssafy.happyhouse.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

// index page 처리용 controller
@Controller
public class MainController {

	@GetMapping("/")
	public String index() {
		return "index";
	}

	@GetMapping("/portfolio")
	public String portfolio() {
		return "portfolio-details";
	}

	@GetMapping("/category")
	public String category() {
		return "mapCategory";
	}
}
