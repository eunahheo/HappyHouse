package com.ssafy.happyhouse.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.model.CommentBoardDto;
@Mapper
public interface CommentsBoardMapper {
	List<CommentBoardDto> list(String articleNo);
	int create(CommentBoardDto commentBoardDto);
	int modify(CommentBoardDto commentBoardDto);
	int delete(int commentNo);	
}
