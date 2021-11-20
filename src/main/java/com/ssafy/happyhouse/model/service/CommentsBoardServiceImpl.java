package com.ssafy.happyhouse.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.CommentBoardDto;
import com.ssafy.happyhouse.model.mapper.CommentsBoardMapper;

@Service
public class CommentsBoardServiceImpl implements CommentsBoardService {
	@Autowired
	private CommentsBoardMapper mapper;
	
	@Override
	public List<CommentBoardDto> list(String isbn) {
		return mapper.list(isbn);
	}
	@Override
	public boolean create(CommentBoardDto commentBoardDto) {
		return mapper.create(commentBoardDto) == 1;
	}
	@Override
	public boolean modify(CommentBoardDto commentBoardDto) {
		return mapper.modify(commentBoardDto) == 1;
	}
	@Override
	public boolean delete(int commentNo) {
		return mapper.delete(commentNo) == 1;
	}
}
