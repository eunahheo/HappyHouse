package com.ssafy.happyhouse.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.ssafy.happyhouse.model.MemberDto;
import com.ssafy.happyhouse.model.service.MemberService;

//회원 처리용 controller
@Controller
/*
 * @RestController
 */@CrossOrigin("*")
@RequestMapping("/user")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	private MemberService memberService;

	@GetMapping("/register")
	public String register() {
		return "user/join";
	}
	
	
	@GetMapping("/user_info")
	public String userinfo(HttpSession session,
			HttpServletResponse response) {
		return "user_info";
	}
	
	@GetMapping("/user_update")
	public String userupdate() {
		return "user_update";
	}
	
	@DeleteMapping(value="/{id}")
	public ResponseEntity<List<MemberDto>>delete(@PathVariable("id")String id,HttpSession session) throws Exception{
		memberService.deleteMember(id);
		session.invalidate();
		List<MemberDto> list = memberService.listMember();
		return new ResponseEntity<List<MemberDto>>(list, HttpStatus.OK);
	}
	@GetMapping("/idcheck")
//	@ResponseBody
	public @ResponseBody String idCheck(@RequestParam("ckid") String checkId) throws Exception {
		int idCount = memberService.idCheck(checkId);
		JSONObject json = new JSONObject();
		json.put("idcount", idCount);
		System.out.println(idCount);
		return json.toString();
	}
	
	@PostMapping(value="/")
	public ResponseEntity<List<MemberDto>>register(@RequestBody MemberDto memberDto, Model model) throws Exception {
		logger.debug("memberDto info : {}", memberDto);
		logger.debug(memberDto.getId());
		memberService.registerMember(memberDto);
		List<MemberDto> list = memberService.listMember();
		return new ResponseEntity<List<MemberDto>>(list, HttpStatus.OK);
	}
	
	@PutMapping("/")
	public ResponseEntity<List<MemberDto>> update(@RequestBody MemberDto memberDto, HttpSession session, Model model) throws Exception {
		logger.debug("memberDto info : {}", memberDto);
		logger.debug(memberDto.getId());
		memberService.updateMember(memberDto);
		session.setAttribute("userinfo", memberDto);
		List<MemberDto> list = memberService.listMember();
		return new ResponseEntity<List<MemberDto>>(list, HttpStatus.OK);
	}
	@GetMapping("/login")
	public String login() {
		return "user/login";
	}
	
	@PostMapping("/login")
	public String login(@RequestParam Map<String, String> map, Model model, HttpSession session,
			HttpServletResponse response) throws Exception {
		MemberDto memberDto = memberService.login(map);
		if (memberDto != null) {
			session.setAttribute("userinfo", memberDto);

			Cookie cookie = new Cookie("ssafy_id", map.get("userId"));
			cookie.setPath("/");
			if ("saveok".equals(map.get("idsave"))) {
				cookie.setMaxAge(60 * 60 * 24 * 365 * 40);
			} else {
				cookie.setMaxAge(0);
			}
			response.addCookie(cookie);
			return "redirect:/";
		} else {
			model.addAttribute("msg", "아이디 또는 비밀번호 확인 후 다시 로그인하세요!");
			return "redirect:/";
		}
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	@GetMapping("/userList")
	public String list() {
		return "userList";
	}
	@GetMapping(value="/")
	public ResponseEntity<List<MemberDto>> userList() throws Exception {
		List<MemberDto> list = memberService.listMember();
		if(list != null && !list.isEmpty()) {
			return new ResponseEntity<List<MemberDto>>(list, HttpStatus.OK);
		}else {
			return new ResponseEntity(HttpStatus.NO_CONTENT);
		}
//		session.setAttribute("list", list);
//		return "userList";
	}
}
