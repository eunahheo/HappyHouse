package com.ssafy.happyhouse.model.mapper;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.model.InterestDto;

@Mapper
public interface InterestMapper {

	public int register(InterestDto interestDto) throws SQLException;
	public List<InterestDto> allList(String userid) throws SQLException;
	public InterestDto listOne(int interestno) throws SQLException;
	public int updateInterest(InterestDto interestDto) throws SQLException;
	public int deleteInterest(int interestno) throws SQLException;
}