package com.ssafy.happyhouse.controller;

import java.security.SecureRandom;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.internet.AddressException;
import javax.mail.Authenticator;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.model.MemberDto;
import com.ssafy.happyhouse.model.MemberParameterDto;
import com.ssafy.happyhouse.model.service.JwtServiceImpl;
import com.ssafy.happyhouse.model.service.MemberService;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;

@RestController
@CrossOrigin("*")
@RequestMapping("/user")
@Api("사용자 컨트롤러  API V1")
public class MemberController {

	public static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	private static final String SUCCESS = "success";
	private static final String FAIL = "fail";

	@Autowired
	private JwtServiceImpl jwtService;

	@Autowired
	private MemberService memberService;

	@DeleteMapping(value = "/{id}")
	public ResponseEntity<String> delete(@PathVariable("id") String id, HttpSession session) throws Exception {
		memberService.deleteMember(id);
		session.invalidate();
		return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
	}

	@GetMapping("/{userid}")
	public ResponseEntity<MemberDto> listOne(@PathVariable("userid") String id, HttpSession session) throws Exception {
		MemberDto member = memberService.userInfo(id);
		logger.debug(id);
		return new ResponseEntity<MemberDto>(member, HttpStatus.OK);
	}

	@PostMapping("/signup")
	public ResponseEntity<String> register(@RequestBody MemberDto memberDto, Model model) throws Exception {
		logger.debug("memberDto info : {}", memberDto);
		logger.debug(memberDto.getUserid());
		memberService.registerMember(memberDto);
		return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
	}

	@PutMapping("/")
	public ResponseEntity<String> update(@RequestBody MemberDto memberDto, HttpSession session, Model model)
			throws Exception {
		logger.debug("memberDto info : {}", memberDto);
		logger.debug(memberDto.getUserid());
		memberService.updateMember(memberDto);
		session.setAttribute("userinfo", memberDto);
		return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
	}

	// @GetMapping("/userList")
	// public String list() {
//	      return "userList";
	// }
	@GetMapping(value = "/")
	public ResponseEntity<List<MemberDto>> userList(MemberParameterDto memberParameterDto) throws Exception {
		List<MemberDto> list = memberService.listMember(memberParameterDto);
		if (list != null && !list.isEmpty()) {
			return new ResponseEntity<List<MemberDto>>(list, HttpStatus.OK);
		} else {
			return new ResponseEntity(HttpStatus.NO_CONTENT);
		}
//	      session.setAttribute("list", list);
//	      return "userList";
	}

	@ApiOperation(value = "로그인", notes = "Access-token과 로그인 결과 메세지를 반환한다.", response = Map.class)
	@PostMapping("/login")
	public ResponseEntity<Map<String, Object>> login(
			@RequestBody @ApiParam(value = "로그인 시 필요한 회원정보(아이디, 비밀번호).", required = true) MemberDto memberDto) {
		Map<String, Object> resultMap = new HashMap<>();
		HttpStatus status = null;
		try {
			MemberDto loginUser = memberService.login(memberDto);
			if (loginUser != null) {
				String token = jwtService.create("userid", loginUser.getUserid(), "access-token");// key, data, subject
				logger.debug("로그인 토큰정보 : {}", token);
				resultMap.put("access-token", token);
				resultMap.put("message", SUCCESS);
				status = HttpStatus.ACCEPTED;
			} else {
				resultMap.put("message", FAIL);
				status = HttpStatus.ACCEPTED;
			}
		} catch (Exception e) {
			logger.error("로그인 실패 : {}", e);
			resultMap.put("message", e.getMessage());
			status = HttpStatus.INTERNAL_SERVER_ERROR;
		}
		return new ResponseEntity<Map<String, Object>>(resultMap, status);
	}

	@ApiOperation(value = "회원인증", notes = "회원 정보를 담은 Token을 반환한다.", response = Map.class)
	@GetMapping("/info/{userid}")
	public ResponseEntity<Map<String, Object>> getInfo(
			@PathVariable("userid") @ApiParam(value = "인증할 회원의 아이디.", required = true) String userid,
			HttpServletRequest request) {
//		logger.debug("userid : {} ", userid);
		Map<String, Object> resultMap = new HashMap<>();
		HttpStatus status = HttpStatus.ACCEPTED;
		if (jwtService.isUsable(request.getHeader("access-token"))) {
			logger.info("사용 가능한 토큰!!!");
			try {
//				로그인 사용자 정보.
				MemberDto memberDto = memberService.userInfo(userid);
				System.out.println(memberDto);
				resultMap.put("userInfo", memberDto);
				resultMap.put("message", SUCCESS);
				status = HttpStatus.ACCEPTED;
			} catch (Exception e) {
				logger.error("정보조회 실패 : {}", e);
				resultMap.put("message", e.getMessage());
				status = HttpStatus.INTERNAL_SERVER_ERROR;
			}
		} else {
			logger.error("사용 불가능 토큰!!!");
			resultMap.put("message", FAIL);
			status = HttpStatus.ACCEPTED;
		}
		return new ResponseEntity<Map<String, Object>>(resultMap, status);
	}

//	@Bean
//	public JavaMailSenderImpl mailSender() {
//		JavaMailSenderImpl javaMailSender = new JavaMailSenderImpl();
//		javaMailSender.setProtocol("smtp");
//		javaMailSender.setHost("smtp.gmail.com");
//		javaMailSender.setPort(587);
//		return javaMailSender;
//	}

	@Autowired
	private EmailUtil emailUtil;

	@GetMapping("/temporary/{userid}")
	public ResponseEntity temporaryPass(@PathVariable("userid") String id, HttpSession session) throws Exception {
		String tempoPass = getRamdomPassword(8);
		MemberDto member = memberService.userInfo(id); // 비밀번호 변경을 요청한 회원
		member.setUserpwd(tempoPass);
		memberService.updateMember(member);
		System.out.println(member.getEmail());

		System.out.println("호출22");

//		SimpleMailMessage simpleMessage = new SimpleMailMessage();
//		System.out.println(simpleMessage);
//		simpleMessage.setTo(member.getEmail());
//		simpleMessage.setFrom("asi20735@gmail.com");
//		// boolean isAttach;
//		simpleMessage.setReplyTo("dd");
//		simpleMessage.setCc("");
//		simpleMessage.setBcc("");
//		simpleMessage.setSentDate(new Date(2021, 11, 26));
//		simpleMessage.setSubject("[HappyHouse]임시 비밀번호 발급");
//
//		simpleMessage.setText(
//				"안녕하세요. \n 저희 HappyHouse를 이용해 주셔서 감사합니다. \n 임시 비밀번호로 로그인 해주세요.\n\n임시 비밀번호 : " + member.getUserpwd());
//		System.out.println(simpleMessage);
//		javaMailSender.send(simpleMessage);
		emailUtil.sendEmail(member.getEmail(), "[HappyHouse]임시 비밀번호 발급", "안녕하세요. \n 임시 비밀번호로 로그인 해주세요.\n\n임시 비밀번호 : "
				+ member.getUserpwd() + " \n\n 저희 HappyHouse를 이용해 주셔서 감사합니다.");
		System.out.println("성공");

		System.out.println("메일 보냄?");

		return new ResponseEntity(HttpStatus.OK);

	}

	// 임시 비밀번호 생성
	public String getRamdomPassword(int size) {
		char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
				'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a',
				'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v',
				'w', 'x', 'y', 'z', '!', '@', '#', '$', '%', '^', '&' };
		StringBuffer sb = new StringBuffer();
		SecureRandom sr = new SecureRandom();
		sr.setSeed(new Date().getTime());
		int idx = 0;
		int len = charSet.length;
		for (int i = 0; i < size; i++) {
			idx = sr.nextInt(len);
			sb.append(charSet[idx]);
		}
		return sb.toString();
	}

}