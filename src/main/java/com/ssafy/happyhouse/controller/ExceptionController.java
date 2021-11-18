package com.ssafy.happyhouse.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.validation.BindException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

@ControllerAdvice
public class ExceptionController {
	private Logger logger = LoggerFactory.getLogger(ExceptionController.class);
	
	@ExceptionHandler(Exception.class)
	public String handleException(Exception e, Model m) {
		logger.error("Exception 발생 : {}", e.getMessage());
		m.addAttribute("errmsg", "처리중 에러 발생!!!");
		e.printStackTrace();
		if(e instanceof BindException) {
			m.addAttribute("errmsg", "파라미터가 잘 전달되었는지 확인하세요.");
		}
		return "error/error";
	}
	@ExceptionHandler(NoHandlerFoundException.class)
	@ResponseStatus(value = HttpStatus.NOT_FOUND)
	public String handle404(NoHandlerFoundException e, Model m) {
		logger.error("404 발생 : {}", "404 page not found");
		m.addAttribute("errmsg", "요청하신 파일은 존재하지 않습니다.");
		return "error/404";
	}
}