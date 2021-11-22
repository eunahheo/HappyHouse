package com.ssafy.happyhouse.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
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

import com.ssafy.happyhouse.model.InterestDto;
import com.ssafy.happyhouse.model.service.InterestService;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;

@RestController
@CrossOrigin("*")
@RequestMapping("/map/interest")
@Api("사용자 컨트롤러  API V1")
public class InterestController {

   public static final Logger logger = LoggerFactory.getLogger(InterestController.class);
   private static final String SUCCESS = "success";
   private static final String FAIL = "fail";

   @Autowired
   private InterestService interestService;
   
   @DeleteMapping("{interestno}")
   public ResponseEntity<String> deleteInterest(@PathVariable("interestno") int interestno) throws Exception {
      logger.debug("deleteInterest - 호출");
      if(interestService.deleteInterest(interestno)==1) {
         return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
      }
      return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
   }
   @PostMapping
   public ResponseEntity<String> register(@RequestBody InterestDto interestDto) throws Exception {
      logger.info("registerInterest - 호출");
      System.out.println(interestDto.getDongcode());
      if (interestService.register(interestDto)==1) {
         return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
      }
      return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
   }
   
   @ApiOperation(value = "게시판 글목록", notes = "모든 게시글의 정보를 반환한다.", response = List.class)
   @GetMapping("/all/{userid}")
   public ResponseEntity<List<InterestDto>> listInterest(@PathVariable("userid") String userid) throws Exception {
      logger.info("listInterest - 호출");
      return new ResponseEntity<List<InterestDto>>(interestService.allList(userid), HttpStatus.OK);
   }
   
   @ApiOperation(value = "게시판 글보기", notes = "글번호에 해당하는 게시글의 정보를 반환한다.", response = InterestDto.class)
   @GetMapping("/{interestno}")
   public ResponseEntity<InterestDto> listOneInterest(@PathVariable("interestno") @ApiParam(value = "얻어올 글의 글번호.", required = true) int interestno) throws Exception {
      logger.info("listOneInterest - 호출 : " + interestno);
      return new ResponseEntity<InterestDto>(interestService.listOne(interestno), HttpStatus.OK);
   }
   
   @ApiOperation(value = "게시판 글수정", notes = "새로운 게시글 정보를 입력한다. 그리고 DB수정 성공여부에 따라 'success' 또는 'fail' 문자열을 반환한다.", response = String.class)
   @PutMapping
   public ResponseEntity<String> modifyArticle(@RequestBody @ApiParam(value = "수정할 글정보.", required = true) InterestDto interestDto) throws Exception {
      logger.info("modifyArticle - 호출");
      
      if (interestService.updateInterest(interestDto)==1) {
         return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
      }
      return new ResponseEntity<String>(FAIL, HttpStatus.OK);
   }
}