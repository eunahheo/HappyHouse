package com.ssafy.happyhouse.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.model.CompanyDto;
import com.ssafy.happyhouse.model.service.CompanyService;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;

//http://localhost:9999/vue/swagger-ui.html
//@CrossOrigin(origins = { "*" }, methods = {RequestMethod.GET, RequestMethod.POST, RequestMethod.PUT, RequestMethod.POST} , maxAge = 6000)
@RestController
@CrossOrigin("*")
@RequestMapping("/company")
@Api("Company 컨트롤러  API V1")
public class CompanyController {

	private static final Logger logger = LoggerFactory.getLogger(CompanyController.class);
	private static final String SUCCESS = "success";
	private static final String FAIL = "fail";

	@Autowired
	private CompanyService companyService;

	@ApiOperation(value = "회사 등록", notes = "사용자의 회사를 등록한다. 그리고 DB입력 성공여부에 따라 'success' 또는 'fail' 문자열을 반환한다.", response = String.class)
	@PostMapping
	public ResponseEntity<String> registerCompany(
			@RequestBody @ApiParam(value = "회사 정보.", required = true) CompanyDto companyDto) throws Exception {
		logger.info("registerCompany - 호출");
		if (companyService.registerCompany(companyDto)) {
			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
		}
		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
	}

//	 
//	@ApiOperation(value = "회사 조회", notes = "회사번호에 해당하는 회사의 정보를 반환한다.", response = CompanyDto.class)
//	@GetMapping("/{companyno}")
//	public ResponseEntity<CompanyDto> getCompany(@PathVariable("companyno") @ApiParam(value = "얻어올 회사의 회사번호.", required = true) int companyno) throws Exception {
//		logger.info("getCompany - 호출 : " + companyno);
//		return new ResponseEntity<CompanyDto>(companyService.getCompany(companyno), HttpStatus.OK);
//	}
	@ApiOperation(value = "회사 조회", notes = "회사번호에 해당하는 회사의 정보를 반환한다.", response = CompanyDto.class)
	@GetMapping("/{userid}")
	public ResponseEntity<CompanyDto> getCompany(
			@PathVariable("userid") @ApiParam(value = "유저 아이디로 회사 얻기.") String userid) throws Exception {
		logger.info("getCompany - 호출 : " + userid);
		return new ResponseEntity<CompanyDto>(companyService.getCompany(userid), HttpStatus.OK);
	}

	@ApiOperation(value = "회사 정보 수정", notes = "새로운 회사 정보를 입력한다. 그리고 DB수정 성공여부에 따라 'success' 또는 'fail' 문자열을 반환한다.", response = String.class)
	@PutMapping
	public ResponseEntity<String> modifyCompany(
			@RequestBody @ApiParam(value = "수정할 회사정보.", required = true) CompanyDto companyDto) throws Exception {
		logger.info("modifyCompany - 호출");

		if (companyService.modifyCompany(companyDto)) {
			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
		}
		return new ResponseEntity<String>(FAIL, HttpStatus.OK);
	}

	@ApiOperation(value = "회사 글삭제", notes = "회사번호에 해당하는 회사의 정보를 삭제한다. 그리고 DB삭제 성공여부에 따라 'success' 또는 'fail' 문자열을 반환한다.", response = String.class)
	@DeleteMapping("/{companyno}")
	public ResponseEntity<String> deleteCompany(
			@PathVariable("companyno") @ApiParam(value = "삭제할 회사의 회사번호.", required = true) int companyno)
			throws Exception {
		logger.info("deleteCompany - 호출");
		if (companyService.deleteCompany(companyno)) {
			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
		}
		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
	}
}