package com.ssafy.happyhouse.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.ssafy.happyhouse.model.CommentBoardDto;
import com.ssafy.happyhouse.model.service.CommentsBoardService;

import io.swagger.annotations.ApiOperation;

@CrossOrigin(origins = { "*" }, maxAge = 6000)
@RestController
@RequestMapping("/board/comment")
public class CommentRestController {
	private static final Logger logger = LoggerFactory.getLogger(CommentRestController.class);
	private static final String SUCCESS = "success";
	private static final String FAIL = "fail";
	
	@Autowired
	CommentsBoardService commentService;

	@ApiOperation(value = "articleno에 해당하는 댓글 목록을 반환한다.", response = List.class)
	@GetMapping("{articleno}")
	public ResponseEntity<List<CommentBoardDto>> listComment(@PathVariable("articleno") String articleno) {
		logger.debug("listComment - 호출");
		System.out.println("호출이다!!!");
		return new ResponseEntity<>(commentService.list(articleno), HttpStatus.OK);
	}

	@ApiOperation(value = "새로운 댓글 입력한다. 그리고 DB입력 성공여부에 따라 'success' 또는 'fail' 문자열을 반환한다.", response = String.class)
	@PostMapping
	public ResponseEntity<String> createComment(@RequestBody CommentBoardDto commentDto) {
		logger.debug("createComment - 호출");
		if(commentService.create(commentDto)) {
			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
		}
		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
	}

	@ApiOperation(value = "댓글번호가 commentno에 해당하는 도서평을 수정한다. 그리고 DB수정 성공여부에 따라 'success' 또는 'fail' 문자열을 반환한다.", response = String.class)
	@PutMapping
	public ResponseEntity<String> modifyComment(@RequestBody CommentBoardDto commentDto) {
		logger.debug("modifyComment - 호출");
		logger.debug("" + commentDto);
		System.out.println("댓글 수정하자!!!"  + commentDto);
		if(commentService.modify(commentDto)) {
			System.out.println("댓글 수정 성공!!!");
			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
		}
		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
	}

	@ApiOperation(value = "댓글번호가 commentno에 해당하는 댓글을 삭제한다. 그리고 DB삭제 성공여부에 따라 'success' 또는 'fail' 문자열을 반환한다.", response = String.class)
	@DeleteMapping("{commentno}")
	public ResponseEntity<String> deleteBook(@PathVariable("commentno") int commentno) {
		logger.debug("deleteBoard - 호출");
		if(commentService.delete(commentno)) {
			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
		}
		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
	}
	
}
