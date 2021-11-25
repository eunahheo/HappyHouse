package com.ssafy.happyhouse.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssafy.happyhouse.model.service.MemberService;

@Controller
@CrossOrigin("*")
@RequestMapping("/map")
public class HouseController {
	private static final Logger logger = LoggerFactory.getLogger(HouseController.class);

	@Autowired
	MemberService msvc;

	@Autowired
	ResourceLoader loader;

	@GetMapping("")
	public String index() {
		return "map";
	}

	@GetMapping("/portfolio")
	public String portfolio() {
		return "portfolio-details";
	}

}
