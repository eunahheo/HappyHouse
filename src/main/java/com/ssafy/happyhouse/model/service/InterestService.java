package com.ssafy.happyhouse.model.service;

import java.io.*;
import java.util.List;

import com.ssafy.happyhouse.model.InterestDto;

public interface InterestService {
	public int register(InterestDto interestDto) throws Exception;
	public List<InterestDto> allList(String userid) throws Exception;
	public InterestDto listOne(int interestno) throws Exception;
	public int updateInterest(InterestDto interestDto) throws Exception;
	public int deleteInterest(int interestno) throws Exception;
	public List<InterestDto> selectPopularity(String dongcode) throws Exception;
}
