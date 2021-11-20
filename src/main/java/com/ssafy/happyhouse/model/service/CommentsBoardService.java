package com.ssafy.happyhouse.model.service;

import java.util.List;

import com.ssafy.happyhouse.model.CommentBoardDto;

public interface CommentsBoardService {
	List<CommentBoardDto> list(String articleno);
	boolean create(CommentBoardDto commentBoardDto);
	boolean modify(CommentBoardDto commentBoardDto);
	boolean delete(int commentNo);	
}
